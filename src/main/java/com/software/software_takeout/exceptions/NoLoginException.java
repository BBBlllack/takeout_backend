package com.software.software_takeout.exceptions;

/**
 * 当用户未登陆时会触发此异常
 */
public class NoLoginException extends Exception{
    public NoLoginException(String message) {
        super(message);
    }
}
