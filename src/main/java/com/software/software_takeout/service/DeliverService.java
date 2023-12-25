package com.software.software_takeout.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.software.software_takeout.entity.Deliver;

public interface DeliverService extends IService<Deliver> {

    Boolean insertDomap(Long did, Long oid, Long comment);

    Long getDeliverByOid(Long oid);
}
