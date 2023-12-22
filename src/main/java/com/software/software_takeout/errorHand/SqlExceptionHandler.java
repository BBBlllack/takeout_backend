package com.software.software_takeout.errorHand;

import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.exceptions.NoLoginException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;

@RestControllerAdvice
public class SqlExceptionHandler {

    @ExceptionHandler(SQLException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR) // 500
    public ApiResponse<String> handlerSqlException(SQLException e) {
        if (e.getMessage().contains("doesn't have a default value")) {
            return ApiResponse.error(500, "关键字段不能为空!");
        }
        return ApiResponse.error(500, e.getCause().toString() == null ? null : e.getCause().toString());
    }

    @ExceptionHandler(NoLoginException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED) // 401
    public ApiResponse<String> handlerNoLoginException(NoLoginException e) {
        return ApiResponse.error(HttpStatus.UNAUTHORIZED.value(), e.getCause().toString());
    }

}
