package com.software.software_takeout.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.software.software_takeout.entity.Orders;
import com.software.software_takeout.entity.Restaurant;
import com.software.software_takeout.mapper.OrdersMapper;
import com.software.software_takeout.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class OrdersServiceImpl extends ServiceImpl<OrdersMapper, Orders> implements OrdersService {

    @Resource
    private OrdersMapper ordersMapper;

    @Override
    public List<Orders> getRestOrder(Integer page, Integer size, String key, LocalDateTime startDate, LocalDateTime endDate) {
        return ordersMapper.getRestOrder(page * size, size, key, startDate, endDate);
    }
}
