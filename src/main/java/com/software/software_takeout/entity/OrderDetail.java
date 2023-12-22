package com.software.software_takeout.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;

@Data
@TableName("orderdetail")
public class OrderDetail {
    private Long id;
    private Long oid;
    private Long did;
    @TableField(exist = false)
    private Dish dish;
    private BigDecimal price;
    private Double mark;
    private Integer quantity;
}
