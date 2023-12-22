package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Category;
import com.software.software_takeout.entity.Dish;
import com.software.software_takeout.service.CategoryService;
import com.software.software_takeout.service.DishService;
import com.software.software_takeout.util.EntityStatus;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/dish")
public class DishController {

    @Resource
    private DishService dishService;

    /**
     * 获取菜品全部列表，给rest用
     *
     * @param page
     * @param size
     * @return
     */
    @GetMapping("/rest/list")
    public ApiResponse<IPage> getDishListRest(@RequestParam(value = "page", required = false) Integer page,
                                              @RequestParam(value = "size", required = false) Integer size) {
        IPage iPage;
        if (page == null || size == null) {
            iPage = new Page(1, 10000);
        } else {
            iPage = new Page(page, size);
        }
        LambdaQueryWrapper<Dish> dishWrapper = new LambdaQueryWrapper<>();
        // 返回正常或者停售的菜品
        dishWrapper.eq(Dish::getRid, ThreadLocalUtil.getId())
                .eq(Dish::getStatus, EntityStatus.NORMAL)
                .or().eq(Dish::getStatus, EntityStatus.STOP_SALE);
        return ApiResponse.success(dishService.page(iPage, dishWrapper), "后端获取全部菜品成功!");
    }

    @GetMapping("/user/list")
    public ApiResponse<IPage> getDishListUser(@RequestParam(value = "rid", required = false) Long rid, @RequestParam("cid") Long cid,
                                              @RequestParam(value = "page", required = false) Integer page,
                                              @RequestParam(value = "size", required = false) Integer size) {
        IPage iPage;
        if (page == null || size == null) {
            iPage = new Page(1, 10000);
        } else {
            iPage = new Page(page, size);
        }
        LambdaQueryWrapper<Dish> dishWrapper = new LambdaQueryWrapper<>();
        // 返回正常的菜品
        dishWrapper.eq(Dish::getCid, cid);
        return ApiResponse.success(dishService.page(iPage, dishWrapper), "用户获取分页菜品成功!");
    }

    @GetMapping("/category")
    private ApiResponse<List<Dish>> getDishByCategory(@RequestParam("cid") Long cid) {
        LambdaQueryWrapper<Dish> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Dish::getCid, cid);
        queryWrapper.eq(Dish::getStatus, EntityStatus.NORMAL);
        return ApiResponse.success(dishService.list(queryWrapper), "获取菜品列表成功!");
    }

    /**
     * 新增或更新菜品, 有则更新, 无则添加
     *
     * @param dish
     * @return
     */
    @PostMapping("/update")
    public ApiResponse<Boolean> updateDish(@RequestBody Dish dish) {
        if (dish.getId() == null) {
            // 新增菜品
            dish.setRid(ThreadLocalUtil.getId());
            boolean save = dishService.save(dish);
            return save ? ApiResponse.success(save, "新增菜品成功") : ApiResponse.error(999, "新增菜品失败!");
        }
        // 更新菜品
        boolean update = dishService.updateById(dish);
        return update ? ApiResponse.success(update, "更新成功!") : ApiResponse.error(0, "更新失败");
    }

    /**
     * 批量停售菜品
     *
     * @param ids 菜品id列表
     * @return
     */
    @PostMapping("/disable")
    @Transactional
    public ApiResponse<Boolean> disableDish(@RequestBody List<Long> ids) {
        log.info(ids.toString());
        List<Dish> dishes = new LinkedList<>();
        for (Long id : ids) {
            Dish dish = new Dish();
            dish.setId(id);
            dish.setStatus(EntityStatus.STOP_SALE);
            dishes.add(dish);
        }
        boolean update = dishService.updateBatchById(dishes);
        return update ? ApiResponse.success(update, "停售成功") : ApiResponse.error(0, "停售失败!");

    }

    /**
     * 批量起售菜品
     *
     * @param ids 菜品id列表
     * @return
     */
    @PostMapping("/enable")
    @Transactional
    public ApiResponse<Boolean> enableDish(@RequestBody List<Long> ids) {
        List<Dish> dishes = new LinkedList<>();
        for (Long id : ids) {
            Dish dish = new Dish();
            dish.setId(id);
            dish.setStatus(EntityStatus.NORMAL);
            dishes.add(dish);
        }
        boolean update = dishService.updateBatchById(dishes);
        return update ? ApiResponse.success(update, "起售成功") : ApiResponse.error(0, "起售失败!");
    }

    /**
     * 批量删除菜品, 删除仅仅是标记status为 EntityStatus.DELETED (2)
     *
     * @param ids
     * @return
     */
    @PostMapping("/delete")
    @Transactional
    public ApiResponse<Boolean> deleteDish(@RequestBody List<Long> ids) {
        List<Dish> dishes = new LinkedList<>();
        for (Long id : ids) {
            Dish dish = new Dish();
            dish.setId(id);
            dish.setStatus(EntityStatus.DELETED);
            dishes.add(dish);
        }
        boolean update = dishService.updateBatchById(dishes);
        return update ? ApiResponse.success(update, "删除成功") : ApiResponse.error(999, "删除失败!");
    }
}
