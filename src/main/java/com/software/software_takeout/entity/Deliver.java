package com.software.software_takeout.entity;

import lombok.Data;
import java.io.Serializable;

@Data
public class Deliver implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String phone;
    private String password;
    private String avatar;
    private Integer status;
}
