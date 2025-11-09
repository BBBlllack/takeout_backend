package com.software.software_takeout;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.Category;
import com.software.software_takeout.entity.Dish;
import com.software.software_takeout.entity.Orders;
import com.software.software_takeout.entity.User;
import com.software.software_takeout.service.*;
import com.software.software_takeout.util.StringUtil;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@SpringBootTest
public class MpTest {

    @Resource
    private CategoryService categoryService;

    @Resource
    private DishService dishService;

    @Resource
    private OrdersService ordersService;

    @Resource
    private DeliverService deliverService;

    @Resource
    private UserService userService;

    @Test
    void testAdd() {
        List<Category> categoryList = categoryService.list();
        for (Category category : categoryList) {
            Long rid = category.getRid();
            Long cid = category.getId();
            LambdaQueryWrapper<Dish> dishWrapper = new LambdaQueryWrapper<>();
            dishWrapper.eq(Dish::getCid, cid);
            List<Dish> dishList = dishService.list(dishWrapper);
            for (Dish dish : dishList) {
                dish.setRid(rid);
                dishService.updateById(dish);
            }
        }
    }

    @Test
    void testStringUtil() {
        System.out.println(StringUtil.StringToLocalDateTime("2021-10-01"));
    }

    @Test
    void testDeliver() {
        List<Orders> ordersList = ordersService.list();
        Long count = 1L;
        for (Orders orders : ordersList) {
            Long oid = orders.getId();
            deliverService.insertDomap(count++, oid, null);
        }
    }

    @Test
    void testUserService(){

    }

}
