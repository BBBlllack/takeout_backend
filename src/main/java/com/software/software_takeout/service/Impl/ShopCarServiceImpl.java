package com.software.software_takeout.service.Impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.software.software_takeout.entity.ShopCar;
import com.software.software_takeout.mapper.ShopCarMapper;
import com.software.software_takeout.service.ShopCarService;
import org.springframework.stereotype.Service;

@Service
public class ShopCarServiceImpl extends ServiceImpl<ShopCarMapper, ShopCar> implements ShopCarService {
}
