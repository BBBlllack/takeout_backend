package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.User;
import com.software.software_takeout.service.UserService;
import com.software.software_takeout.util.EntityStatus;
import com.software.software_takeout.util.JwtUtil;
import com.software.software_takeout.util.StringUtil;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;


@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 用户注册, 无则注册, 有则登陆
     *
     * @param user
     * @return
     */
    @PostMapping("/login")
    public ApiResponse<Map<String, String>> login(@RequestBody User user) {
        System.out.println("用户请求登录: " + user);
        // 最终返回的数据
        Map<String, String> infoMap = new HashMap<>();
        // 判断用户名和密码是否正确
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(User::getPhone, user.getPhone());
        if (userService.getOne(wrapper) == null) {
            // 用户未注册
            // 组装username
            user.setUsername("用户_" + StringUtil.generateRandomString(5));
            user.setStatus(EntityStatus.NORMAL.intValue());
            userService.save(user);
            HashMap<String, Object> map = new HashMap<>();
            map.put("id", user.getId());
            map.put("phone", user.getPhone());
            infoMap.put("id", user.getId().toString());
            infoMap.put("phone", user.getPhone());
            infoMap.put("token", JwtUtil.generateToken(map));
            log.info("用户注册: {}", user.getId());
            return ApiResponse.success(infoMap, "初次登陆,自动注册!");
        }
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(User::getPhone, user.getPhone()).eq(User::getPassword, user.getPassword());
        User one = userService.getOne(queryWrapper);
        if (one == null) {
            // 账号或密码错误
            return ApiResponse.error(200, "用户账号或密码错误");
        }
        // 登录成功
        HashMap<String, Object> map = new HashMap<>();
        map.put("id", one.getId());
        map.put("phone", one.getPhone());
        log.info("用户登陆: {}", one.getId());

        infoMap.put("id", one.getId().toString());
        infoMap.put("phone", one.getPhone());
        infoMap.put("token", JwtUtil.generateToken(map));
        return ApiResponse.success(infoMap, "用户登录成功!");
    }

    /**
     * 用户登出
     *
     * @return
     */
    @PostMapping("/logout")
    public ApiResponse<Boolean> logout() {
        Map<String, Object> map = ThreadLocalUtil.get();
        System.out.println(map.get("id"));
        System.out.println(map.get("phone"));
        return null;
    }

    /**
     * 分页查询用户
     *
     * @param page
     * @param size
     * @param key  用户名模糊匹配
     * @return
     */
    @GetMapping("/page")
    public ApiResponse<Object> page(@RequestParam("page") Integer page, @RequestParam("size") Integer size,
                                    @RequestParam("key") String key) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(User::getUsername, key == null ? "" : key);
        if (page == null || size == null) {
            return ApiResponse.success(userService.list(queryWrapper), "关键字查询");
        }
        IPage iPage = new Page(page, size);
        return ApiResponse.success(userService.page(iPage, queryWrapper), "分页查询");
    }

    /**
     * 更新个人信息
     *
     * @param user
     * @return
     */
    @PostMapping("/update")
    public ApiResponse<Boolean> updateInfo(@RequestBody User user) {
        return userService.updateById(user) ? ApiResponse.success(Boolean.TRUE, "更新个人信息成功!") : ApiResponse.error(0, "更新个人信息失败");
    }

    /**
     * 获取个人信息
     *
     * @return
     */
    @GetMapping("/info")
    public ApiResponse<User> getUserInfo() {
        User user = userService.getById(ThreadLocalUtil.getId());
        user.setPassword(null);
        return ApiResponse.success(user, "获取个人信息成功!");
    }

}
