package com.software.software_takeout.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class Dish implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long cid;
    private Long rid;
    private String name;
    private String descr;
    private BigDecimal price;
    private BigDecimal discount;
    private String cover;
    private Long status;

}
