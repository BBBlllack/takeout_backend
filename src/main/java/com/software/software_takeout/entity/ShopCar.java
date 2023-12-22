package com.software.software_takeout.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("shopcar")
public class ShopCar implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long uid;
    private Long did;
    // FIXME 还未设置外键约束
    private Long rid;
    private Long quantity;
}
