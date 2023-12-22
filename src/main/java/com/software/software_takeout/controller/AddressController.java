package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.software.software_takeout.entity.Address;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.service.AddressService;
import com.software.software_takeout.util.EntityStatus;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;


@Slf4j
@RestController
@RequestMapping("/address")
public class AddressController {

    @Resource
    private AddressService addressService;

    /**
     * 返回用户地址, 过滤已经删除的地址
     *
     * @return
     */
    @GetMapping("/list")
    public ApiResponse<List<Address>> getUserAddress() {
        Long uid = ThreadLocalUtil.getId();
        log.info("请求地址,用户uid: {}", uid);
        LambdaQueryWrapper<Address> queryWrapper = new LambdaQueryWrapper<>();
        // 过滤已经删除的地址
        queryWrapper.eq(Address::getUid, uid)
                .eq(Address::getStatus, EntityStatus.NORMAL);
        return ApiResponse.success(addressService.list(queryWrapper), "用户获取地址成功!");
    }

    /**
     * 新增或更新地址, 有则更新, 无则添加
     *
     * @param address
     * @return
     */
    @PostMapping("/update")
    public ApiResponse<Boolean> addAddress(@RequestBody Address address) {
        Long uid = ThreadLocalUtil.getId();
        address.setUid(uid);
        if (address.getId() == null) {
            // 新增地址
            log.info("新增地址信息: {}", address);
            boolean save = addressService.save(address);
            return save ? ApiResponse.success(save, "新增地址成功") : ApiResponse.error(0, "新增地址失败!");

        }
        // 更新地址
        boolean update = addressService.updateById(address);
        return update ? ApiResponse.success(update, "更新地址成功!") : ApiResponse.error(0, "更新地址失败");
    }

}
