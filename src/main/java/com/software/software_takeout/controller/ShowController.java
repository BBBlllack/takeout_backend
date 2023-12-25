package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Orders;
import com.software.software_takeout.entity.Restaurant;
import com.software.software_takeout.entity.User;
import com.software.software_takeout.service.OrdersService;
import com.software.software_takeout.service.RestaurantService;
import com.software.software_takeout.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/show")
public class ShowController {

    @Resource
    private OrdersService ordersService;

    @Resource
    private UserService userService;

    @Resource
    private RestaurantService restaurantService;

    @GetMapping("/order")
    public ApiResponse<List<Map>> getLatestOrders(@RequestParam(value = "num",required = false) Integer num){
        List<Map> maps = new ArrayList<>();
        if (num == null || num == 0){
            num = 10;
        }
        IPage<Orders> iPage = new Page<>(1, num);
        List<Orders> orders = ordersService.page(iPage).getRecords();
        for (Orders order : orders) {
            LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
            userLambdaQueryWrapper.eq(User::getId, order.getUid());
            User user = userService.getOne(userLambdaQueryWrapper);

            LambdaQueryWrapper<Restaurant> restaurantLambdaQueryWrapper = new LambdaQueryWrapper<>();
            restaurantLambdaQueryWrapper.eq(Restaurant::getId, order.getRid());
            Restaurant restaurant = restaurantService.getOne(restaurantLambdaQueryWrapper);
            Map<String, Object> map = new HashMap<>();
            map.put("rest", restaurant);
            map.put("id", order.getId());
            map.put("user", user);
            map.put("create_time", order.getCreateTime());
            map.put("status", order.getStatus());
            maps.add(map);
        }
        return ApiResponse.success(maps, "获取订单信息成功!");
    }




}
