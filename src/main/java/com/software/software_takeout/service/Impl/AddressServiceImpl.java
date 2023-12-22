package com.software.software_takeout.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.software.software_takeout.entity.Address;
import com.software.software_takeout.mapper.AddressMapper;
import com.software.software_takeout.service.AddressService;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements AddressService {
}
