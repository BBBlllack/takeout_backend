package com.software.software_takeout.controller;

import com.software.software_takeout.entity.ApiResponse;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomeErrorController implements org.springframework.boot.web.servlet.error.ErrorController {

    @RequestMapping("/error")
    public ApiResponse<Object> error(){
        return ApiResponse.success(true,"error...");
    }
}
