package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.Address;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Dish;
import com.software.software_takeout.entity.ShopCar;
import com.software.software_takeout.service.DishService;
import com.software.software_takeout.service.ShopCarService;
import com.software.software_takeout.util.ResponseStatus;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.javassist.compiler.ast.Variable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/cart")
public class ShopCarController {

    @Resource
    private ShopCarService shopCarService;

    @Resource
    private DishService dishService;

    /**
     * 获取用户在当前餐厅中购物车内容
     *
     * @param rid 当前餐厅
     * @return
     */
    @GetMapping("/list")
    public ApiResponse<List<Map>> getUserShopCar(@RequestParam("rid") Long rid) {
        Long uid = ThreadLocalUtil.getId();
        log.info("请求购物车,用户uid: {}", uid);
        List<Map> dataMaps = new ArrayList<>();
        LambdaQueryWrapper<ShopCar> queryWrapper = new LambdaQueryWrapper<>();
        // 获取用户在当前餐厅的购物车
        queryWrapper.eq(ShopCar::getUid, uid)
                .eq(ShopCar::getRid, rid);
        List<ShopCar> shopCars = shopCarService.list(queryWrapper);
        for (ShopCar shopCar : shopCars) {
            LambdaQueryWrapper<Dish> dishWrapper = new LambdaQueryWrapper<>();
            Map<String, Object> dataMap = new HashMap<>();
            dishWrapper.eq(Dish::getId, shopCar.getDid());
            // 组装数据
            Dish dish = dishService.getOne(dishWrapper);
            dataMap.put("id", shopCar.getId());
            dataMap.put("name", dish.getName());
            dataMap.put("quantity", shopCar.getQuantity());
            dataMap.put("cover", dish.getCover());
            dataMap.put("price", dish.getPrice());
            dataMap.put("discount", dish.getDiscount());
            dataMap.put("descr", dish.getDescr());
            dataMap.put("dish", dish);
            dataMaps.add(dataMap);
        }
        return ApiResponse.success(dataMaps, "获取用户购物车成功!");
    }

    /**
     * 更新用户购物车
     *
     * @param shopCars
     * @return
     */
    @PostMapping("/update")
    @Transactional
    public ApiResponse<Boolean> addShopCar(@RequestBody List<ShopCar> shopCars) {
        Long uid = ThreadLocalUtil.getId();
        for (ShopCar shopCar : shopCars) {
            shopCar.setUid(uid);
            log.info("更新购物车信息: {}", shopCar);
            if (shopCar.getQuantity() == null || shopCar.getQuantity() == 0) {
                // 删除此记录
                boolean remove = shopCarService.removeById(shopCar.getId());
            }
            // 无则添加
            if (shopCar.getId() == null) {
                boolean save = shopCarService.save(shopCar);
//                return save ? ApiResponse.success(Boolean.TRUE, "添加成功!") : ApiResponse.error(ResponseStatus.ERROR, "添加失败");
            }
            // 有则更新
            boolean update = shopCarService.updateById(shopCar);
//            return update ? ApiResponse.success(update, "更新成功") : ApiResponse.error("保存失败!");
        }
        return ApiResponse.success(Boolean.TRUE, "操作成功");
    }
}
