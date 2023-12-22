package com.software.software_takeout.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 接受前端传来的submit参数封装在此
 */
@Data
public class SubmitOrder implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long aid;
    private Long rid;
    private List<Long> cart;
    private String comment;
}
