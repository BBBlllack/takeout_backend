package com.software.software_takeout.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.software.software_takeout.entity.Deliver;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DeliverMapper extends BaseMapper<Deliver> {
    @Select("insert into domap values (#{did},#{oid},#{comment})")
    Integer insertDomap(Long did, Long oid, Long comment);

    @Select("select did from domap where oid = #{oid}")
    Long getDeliverIdByOid(Long oid);
}
