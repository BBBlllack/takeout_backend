package com.software.software_takeout.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class User implements Serializable {
    
    private static final long serialVersionUID = 1L;

    private Long id;

    private String username;

    private String phone;

    private String password;

    private String avatar;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @TableField(fill = FieldFill.DEFAULT)
    private LocalDateTime regtime;

    private Integer status;

}