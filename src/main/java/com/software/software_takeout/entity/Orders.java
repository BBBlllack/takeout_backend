package com.software.software_takeout.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long uid;
    private Long aid;
    private Long rid;
    private BigDecimal totalprice;
    @JsonFormat(pattern = "yyyy-MM-mm/hh:MM:ss")
    @TableField(fill = FieldFill.DEFAULT)
    private LocalDateTime createTime;
    private String comment;
    private Long status;
}
