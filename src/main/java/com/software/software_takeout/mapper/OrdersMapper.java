package com.software.software_takeout.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.software.software_takeout.entity.Orders;
import com.software.software_takeout.entity.Restaurant;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface OrdersMapper extends BaseMapper<Orders> {
    List<Orders> getRestOrder(@Param("offset") Integer offset,@Param("limit") Integer limit,
                                  @Param("key") String key,@Param("startDate") LocalDateTime startDate,
                                  @Param("endDate") LocalDateTime endDate);


}
