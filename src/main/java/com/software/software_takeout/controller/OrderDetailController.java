package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Dish;
import com.software.software_takeout.entity.OrderDetail;
import com.software.software_takeout.entity.Orders;
import com.software.software_takeout.service.DishService;
import com.software.software_takeout.service.OrderDetailService;
import com.software.software_takeout.service.OrdersService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/orderdetail")
public class OrderDetailController {

    @Resource
    private OrderDetailService orderDetailService;

    @Resource
    private DishService dishService;

    /**
     * 根据传来的订单id列表返回对应的订单详情
     *
     * @param oid
     * @return orderdeatil:{
     * de...
     * dish: {
     * dish..
     * }
     * }
     */
    @GetMapping("/rest/byoid")
    @Transactional //
    public ApiResponse<List<OrderDetail>> getOrderDetailByOid(Long oid) {
        List<OrderDetail> list = new LinkedList<>();
        LambdaQueryWrapper<OrderDetail> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(OrderDetail::getOid, oid);
        List<OrderDetail> details = orderDetailService.list(queryWrapper);
        for (OrderDetail detail : details) {
            LambdaQueryWrapper<Dish> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(Dish::getId, detail.getDid());
            detail.setDish(dishService.getOne(wrapper));
            list.add(detail);
        }
        return ApiResponse.success(list, "获取订单详情成功!");
    }

    /**
     * 对订单详情进行评分
     *
     * @param odid 要评价的orderDetail id
     * @param mark 给出的评分
     * @return
     */
    @GetMapping("/evaluate")
    public ApiResponse<Boolean> evaluate(@RequestParam("odid") Long odid, @RequestParam("mark") Double mark) {
        OrderDetail orderDetail = orderDetailService.getById(odid);
        orderDetail.setMark(mark);
        boolean update = orderDetailService.updateById(orderDetail);
        return update ? ApiResponse.success(Boolean.TRUE, "评价成功!") : ApiResponse.error("评价失败!");
    }
}
