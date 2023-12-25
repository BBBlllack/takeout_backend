package com.software.software_takeout.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.software.software_takeout.entity.Deliver;
import com.software.software_takeout.mapper.DeliverMapper;
import com.software.software_takeout.service.DeliverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DeliverServiceImpl extends ServiceImpl<DeliverMapper, Deliver> implements DeliverService {

    @Autowired
    private DeliverMapper deliverMapper;

    @Override
    public Boolean insertDomap(Long did, Long oid, Long comment) {
        return deliverMapper.insertDomap(did, oid, comment) > 0;
    }

    @Override
    public Long getDeliverByOid(Long oid) {
        return deliverMapper.getDeliverIdByOid(oid);
    }

    //    @Override
//    public Boolean insertDomap(Long did, Long oid, Long comment) {
//        return deliverMapper.insertDomap(did, oid, comment) > 0;
//    }
}
