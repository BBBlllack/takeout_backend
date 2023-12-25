package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.entity.Deliver;
import com.software.software_takeout.service.DeliverService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Slf4j
@RestController
@RequestMapping("/deliver")
public class DeliverController {

    @Resource
    private DeliverService deliverService;

    @GetMapping("/order")
    public ApiResponse<Deliver> getDeliverByOid(@RequestParam("oid") Long oid){
        Long deliver = deliverService.getDeliverByOid(oid);
        LambdaQueryWrapper<Deliver> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Deliver::getId, deliver);
        return ApiResponse.success(deliverService.getOne(wrapper), "获取配送员成功!");
    }
}
