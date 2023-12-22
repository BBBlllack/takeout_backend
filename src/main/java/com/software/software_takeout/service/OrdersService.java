package com.software.software_takeout.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.software.software_takeout.entity.Orders;
import com.software.software_takeout.entity.Restaurant;

import java.time.LocalDateTime;
import java.util.List;

public interface OrdersService extends IService<Orders> {
    List<Orders> getRestOrder(Integer page, Integer size, String key, LocalDateTime startDate, LocalDateTime endDate);
}
