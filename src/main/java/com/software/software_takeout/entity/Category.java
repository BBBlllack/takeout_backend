package com.software.software_takeout.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long rid;
    private String name;
    private Long status;
}
