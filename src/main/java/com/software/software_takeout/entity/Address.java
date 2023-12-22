package com.software.software_takeout.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Address implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long uid;
    private String name;
    private String phone;
    private String detail;
    private Long status;
}
