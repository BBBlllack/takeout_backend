package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Restaurant;
import com.software.software_takeout.service.RestaurantService;
import com.software.software_takeout.util.JwtUtil;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/rest")
public class RestaurantController {

    @Resource
    private RestaurantService restaurantService;

    /**
     * 商户登录
     *
     * @param restaurant
     * @return
     */
    @PostMapping("/login")
    public ApiResponse<Map<String, String>> login(@RequestBody Restaurant restaurant, HttpServletResponse response) {
        log.error(restaurant.toString());
        LambdaQueryWrapper<Restaurant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Restaurant::getPhone, restaurant.getPhone())
                .eq(Restaurant::getPassword, restaurant.getPassword());
        Restaurant one = restaurantService.getOne(queryWrapper);
        if (one != null) {
            // 登录成功
            Map<String, Object> map = new HashMap<>();
            map.put("id", one.getId());
            map.put("phone", one.getPhone());
            one.setPassword(null);
            Map<String, String> infoMap = new HashMap<>();
            infoMap.put("id", one.getId().toString());
            infoMap.put("phone", one.getPhone());
            infoMap.put("name", one.getName());
            infoMap.put("token", JwtUtil.generateToken(map));
            return ApiResponse.success(infoMap, "登录成功");
        }
        response.setStatus(HttpStatus.UNAUTHORIZED.value());
        return ApiResponse.error(401, "登录失败,用户名或密码错误!");
    }

    /**
     * 更新商户信息
     *
     * @param restaurant 要更新的商户信息
     * @return
     */
    @PostMapping("/update")
    public ApiResponse<Boolean> updateRestaurant(@RequestBody Restaurant restaurant) {
        restaurant.setId(ThreadLocalUtil.getId());
        boolean update = restaurantService.updateById(restaurant);
        if (update) {
            return ApiResponse.success(update, "更新成功");
        }
        return ApiResponse.error(999, "更新失败!");
    }

    @PostMapping("/logout")
    public ApiResponse<Boolean> logout() {
        Long rid = ThreadLocalUtil.getId();
        log.info("当前商户: {}", rid);
        return null;
    }

    /**
     * 分页查询商户
     *
     * @param page 页码
     * @param size 每页的数量
     * @param key  查询关键字
     * @return 查询出来的商户
     */
    @GetMapping("/page")
    public ApiResponse<Object> getAllRests(@RequestParam(value = "page", required = false) Integer page,
                                           @RequestParam(value = "size", required = false) Integer size,
                                           @RequestParam(value = "key", required = false) String key) {
        LambdaQueryWrapper<Restaurant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(Restaurant::getName, key == null ? "" : key);
        if (page == null || size == null) {
            return ApiResponse.success(restaurantService.list(queryWrapper), "关键字查询");
        }
        IPage iPage = new Page(page, size);
        return ApiResponse.success(restaurantService.page(iPage, queryWrapper), "分页查询");
    }

    @GetMapping("/user/list")
    public ApiResponse<Object> getAllRestsUser(@RequestParam(value = "page", required = false) Integer page,
                                           @RequestParam(value = "size", required = false) Integer size,
                                           @RequestParam(value = "key", required = false) String key) {
        LambdaQueryWrapper<Restaurant> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(Restaurant::getName, key == null ? "" : key);
        if (page == null || size == null) {
            return ApiResponse.success(restaurantService.list(queryWrapper), "关键字查询");
        }
        IPage iPage = new Page(page, size);
        return ApiResponse.success(restaurantService.page(iPage, queryWrapper), "分页查询");
    }

    @GetMapping("/info")
    public ApiResponse<Restaurant> getRestaurantById(@RequestParam(value = "id", required = false) Long id) {
        return ApiResponse.success(restaurantService.getById(id == null ? ThreadLocalUtil.getId() : id), "获取成功" + id);
    }
}
