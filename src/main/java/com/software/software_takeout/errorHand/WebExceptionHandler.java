package com.software.software_takeout.errorHand;

import com.software.software_takeout.entity.ApiResponse;
import org.springframework.http.HttpStatus;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class WebExceptionHandler {

    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    public ApiResponse<String> MethodNotAllowed(Exception e){
        e.printStackTrace();
        return ApiResponse.error(HttpStatus.METHOD_NOT_ALLOWED.value(), "请求方法不允许!");
    }

    @ExceptionHandler(Exception.class)
    public ApiResponse<String> handlerException(Exception e) {
        e.printStackTrace();
        return ApiResponse.error(999, "这个异常开发者没想到..." + e.getCause());
    }

}
