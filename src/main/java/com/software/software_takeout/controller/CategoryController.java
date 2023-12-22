package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Category;
import com.software.software_takeout.service.CategoryService;
import com.software.software_takeout.util.EntityStatus;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    /**
     * 用户获取餐厅分类列表
     *
     * @param rid 餐厅id
     * @return
     */
    @GetMapping("/user/list")
    public ApiResponse<List<Category>> getCategoryListUser(@RequestParam("rid") Long rid) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        // 返回启用的分类
        queryWrapper.eq(Category::getRid, rid)
                .eq(Category::getStatus, EntityStatus.NORMAL);
        return ApiResponse.success(categoryService.list(queryWrapper), "用户获取饭店分类列表成功!");
    }

    /**
     * 饭店获取自己的分类列表
     *
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/rest/list")
    private ApiResponse<IPage> getCategoryList(@RequestParam(value = "page", required = false) Integer page,
                                               @RequestParam(value = "size", required = false) Integer pageSize) {
        Long rid = ThreadLocalUtil.getId();
        LambdaQueryWrapper<Category> categoryWrapper = new LambdaQueryWrapper<>();
        categoryWrapper.eq(Category::getRid, rid);
        IPage iPage;
        if (page == null || pageSize == null) {
            iPage = new Page(1, 10000);
        } else {
            iPage = new Page(page, pageSize);
        }
        IPage<Category> page1 = categoryService.page(iPage, categoryWrapper);
        return ApiResponse.success(page1, "获取分页分类成功!");
    }

    @GetMapping("/rest")
    private ApiResponse<List<Category>> getCategoryByRest(@RequestParam("rid") Long rid) {
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Category::getRid, rid);
        queryWrapper.eq(Category::getStatus, EntityStatus.NORMAL);
        return ApiResponse.success(categoryService.list(queryWrapper), "获取分类列表成功!");
    }

    /**
     * 有则更新, 无则添加
     * 新增, 更新, 逻辑删除分类
     *
     * @param category 分类信息
     * @return
     */
    @PostMapping("/update")
    public ApiResponse<Boolean> updateCategory(@RequestBody Category category) {
        category.setRid(ThreadLocalUtil.getId());
        if (category.getId() == null) {
            // 新增分类
            boolean save = categoryService.save(category);
            return save ? ApiResponse.success(save, "保存成功") : ApiResponse.error(999, "保存失败!");
        }
        if (category.getName() == null || category.getStatus() == null) {
            // 逻辑删除分类
            category.setStatus(EntityStatus.DELETED);
            boolean deletedLogic = categoryService.updateById(category);
            return deletedLogic ? ApiResponse.success(deletedLogic, "删除成功") : ApiResponse.error(999, "删除失败!");
        }
        // 更新分类
        boolean update = categoryService.updateById(category);
        return update ? ApiResponse.success(update, "更新成功") : ApiResponse.error(999, "更新失败!");
    }
}
