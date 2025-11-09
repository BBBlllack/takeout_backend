package com.software.software_takeout.controller;

import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 测试类，用来测试一些springboot的特性
 */
@Slf4j
@RestController
@RequestMapping("/test")
public class AAATestController {

    /**
     * 前端传javaBean数组
     *
     * @param users
     * @return
     */
    @PostMapping("/obj")
    public ApiResponse<Object> testRecvObjs(@RequestBody User[] users) {
        for (User user : users) {
            log.info(user.toString());
        }
        return ApiResponse.success(users);
    }
}
