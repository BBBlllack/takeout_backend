package com.software.software_takeout.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class Restaurant implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String phone;
    private String password;
    private String announce;
    private String address;
    private String cover;
    private Long sale;
    private Double mark;
    private Double percent;
    @TableField(fill = FieldFill.DEFAULT)
    private LocalDateTime regtime;
    private Integer status;
}
