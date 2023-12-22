package com.software.software_takeout.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.software.software_takeout.entity.*;
import com.software.software_takeout.service.*;
import com.software.software_takeout.util.OrdersStatus;
import com.software.software_takeout.util.ResponseStatus;
import com.software.software_takeout.util.StringUtil;
import com.software.software_takeout.util.ThreadLocalUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Slf4j
@RestController
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrdersService ordersService;

    @Resource
    private OrderDetailService orderDetailService;

    @Resource
    private ShopCarService shopCarService;

    @Resource
    private DishService dishService;

    @Resource
    private AddressService addressService;

    @Resource
    private UserService userService;

    @Resource
    private RestaurantService restaurantService;

    @GetMapping("/user")
    public ApiResponse<IPage> getUserOrders(@RequestParam(value = "page", required = false) Integer page,
                                            @RequestParam(value = "size", required = false) Integer size,
                                            @RequestParam(value = "status", required = false) String status) {
        Map map = ThreadLocalUtil.get();
        Long uid = (Long) map.get("id");
        log.info("请求订单,用户uid: {}", uid);
        LambdaQueryWrapper<Orders> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Orders::getUid, uid);
        if (page == null || size == null) {
            // 返回全部订单
            return ApiResponse.success(ordersService.page(new Page<>(1, 100000), queryWrapper), "返回用户全部订单");
        }
        IPage iPage = new Page(page, size);
        return ApiResponse.success(ordersService.page(iPage, queryWrapper), "返回用户订单" + page + "," + size);
    }

    /**
     * 获取用户订单列表
     * @param page
     * @param size
     * @return
     */
    @GetMapping("/user/list")
    public ApiResponse<IPage> getUserOrders(@RequestParam(value = "page", required = false) Integer page,
                                            @RequestParam(value = "size", required = false) Integer size) {
        // 存放结果的ipage
        IPage<Map<String, Object>> resultIPage = new Page();
        // 存放拼装好的map结果
        List<Map<String, Object>> resultInfos = new ArrayList<>();
        // 获取用户uid
        Long uid = ThreadLocalUtil.getId();
        // 根据用户uid查询订单
        LambdaQueryWrapper<Orders> ordersWrapper = new LambdaQueryWrapper<>();
        ordersWrapper.eq(Orders::getUid, uid);
        // 判断分页
        IPage<Orders> iPage;
        if (page == null || size == null) {
            iPage = new Page<>(1, 10000);
        } else {
            iPage = new Page<>(page, size);
        }
        // 执行分页查询
        IPage<Orders> ordersIPage = ordersService.page(iPage, ordersWrapper);
        for (Orders orders : ordersIPage.getRecords()) {
            // 查询对应的餐厅
            LambdaQueryWrapper<Restaurant> restaurantLambdaQueryWrapper = new LambdaQueryWrapper<>();
            restaurantLambdaQueryWrapper.eq(Restaurant::getId, orders.getRid());
            Restaurant restaurant = restaurantService.getOne(restaurantLambdaQueryWrapper);
            // 查询对应的地址信息
            LambdaQueryWrapper<Address> addressLambdaQueryWrapper = new LambdaQueryWrapper<>();
            addressLambdaQueryWrapper.eq(Address::getId, orders.getAid());
            Address address = addressService.getOne(addressLambdaQueryWrapper);
            // 查询对应的用户信息
            LambdaQueryWrapper<User> userLambdaQueryWrapper = new LambdaQueryWrapper<>();
            userLambdaQueryWrapper.eq(User::getId, orders.getUid());
            User user = userService.getOne(userLambdaQueryWrapper);
            // 组装数据
            Map resultInfo = new HashMap();
            resultInfo.put("id",  orders.getId());
            resultInfo.put("restaurant", restaurant);
            resultInfo.put("address", address);
            resultInfo.put("user", user);
            resultInfo.put("status", orders.getStatus());
            resultInfo.put("totalprice", orders.getTotalprice());
            resultInfo.put("create_time", orders.getCreateTime());
            resultInfo.put("comment", orders.getComment());
            resultInfos.add(resultInfo);
        }
        // 组装ipage
        resultIPage.setRecords(resultInfos);
        resultIPage.setTotal(iPage.getTotal());
        resultIPage.setSize(iPage.getSize());
        resultIPage.setCurrent(iPage.getCurrent());
        resultIPage.setPages(iPage.getPages());
        return ApiResponse.success(resultIPage, "用户获取订单列表成功!");
    }

    @GetMapping("/rest/list")
    public ApiResponse<IPage> getRestaurantOrders(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size,
                                                  @RequestParam(value = "key", required = false) String key, @RequestParam(value = "begin", required = false) String begin,
                                                  @RequestParam(value = "end", required = false) String end) {
//        IPage<Orders> ordersPage = new Page<>();
//        ordersPage.setRecords(ordersService.getRestOrder(page, size, key, startDate, endDate));
//        ordersPage.setCurrent(page);
//        ordersPage.setSize(size);
        Long rid = ThreadLocalUtil.getId(); // 获取商家编号
        log.info("请求订单,商家编号: {}", rid);
        LambdaQueryWrapper<Orders> ordersWrapper = new LambdaQueryWrapper<>();
        ordersWrapper.eq(Orders::getRid, rid);
        // 存储返回结果
        IPage dataPage = new Page();
        // 存放record, 最终结果拼装在map中
        List<Map> recordsMap = new ArrayList<>();
        IPage<Orders> iPage = new Page<>(1, 10000);
        // 动态拼接查询条件
        if (page != null && size != null) {
            iPage = new Page(page, size);
        }
        if (key != null) {
            ordersWrapper.like(Orders::getId, key);
        }
        if (begin != null) {
            LocalDateTime startDate = StringUtil.GtStringToLocalDateTime(begin);
            LocalDateTime endDate;
            if (startDate != null) {
                if (end == null) {
                    // 结束日期为空默认当前
                    endDate = LocalDateTime.now();
                } else {
                    endDate = StringUtil.LtStringToLocalDateTime(end);
                }
                ordersWrapper.ge(Orders::getCreateTime, startDate).le(Orders::getCreateTime, endDate);
            }
        }
        IPage<Orders> ordersIPage = ordersService.page(iPage, ordersWrapper);
        List<Orders> records = ordersIPage.getRecords();
        for (Orders record : records) {
            Map<String, Object> recordMap = new HashMap<>();
            LambdaQueryWrapper<User> userWrapper = new LambdaQueryWrapper<>();
            LambdaQueryWrapper<Address> addressWrapper = new LambdaQueryWrapper<>();
            userWrapper.eq(User::getId, record.getUid());
            addressWrapper.eq(Address::getId, record.getAid());
            User user = userService.getOne(userWrapper);
            Address address = addressService.getOne(addressWrapper);
            recordMap.put("id", record.getId()); // 订单号
            recordMap.put("user", user); // 用户名
            recordMap.put("address", address); // 下单地址
            recordMap.put("phone", address.getPhone()); // 下单手机号
            recordMap.put("status", record.getStatus()); // 订单状态
            recordMap.put("create_time", record.getCreateTime()); // 订单创建时间
            recordMap.put("totalprice", record.getTotalprice() == null ? 0.00 : record.getTotalprice());
            recordMap.put("comment", record.getComment());
            recordsMap.add(recordMap);
        }
        dataPage.setRecords(recordsMap);
        dataPage.setSize(ordersIPage.getSize());
        dataPage.setCurrent(ordersIPage.getCurrent());
        dataPage.setTotal(ordersIPage.getTotal());
        dataPage.setPages(ordersIPage.getPages());

        return ApiResponse.success(dataPage, "查询餐厅订单成功!");
    }

    /**
     * 用户下单, 从购物车查询出, 创建新订单, 创建对应的订单详情
     *
     * @return
     */
    @PostMapping("/submit")
    @Transactional
    public ApiResponse<Boolean> submitOrder(@RequestBody SubmitOrder submitOrder) {
        if (submitOrder == null || submitOrder.getCart() == null || submitOrder.getCart().size() == 0) {
            return ApiResponse.error(0, "数据体异常!");
        }
        Long uid = ThreadLocalUtil.getId();
        Long[] scids = submitOrder.getCart().toArray(new Long[0]);
        Long aid = submitOrder.getAid();
        Long rid = submitOrder.getRid();
        String comment = submitOrder.getComment();
        if (scids == null || scids.length == 0) {
            return ApiResponse.error(ResponseStatus.ERROR, "购物车id为空!");
        }
//        LambdaQueryWrapper<ShopCar> shopCarWrapper = new LambdaQueryWrapper<>();
//        shopCarWrapper.eq(ShopCar::getUid, uid);
        List<ShopCar> shopCars = shopCarService.listByIds(Arrays.asList(scids));
        if (shopCars.size() == 0) {
            return ApiResponse.error(0, "购物车为空!");
        }
        // 创建新订单
        Orders orders = new Orders();
        orders.setStatus(0L);
        orders.setAid(aid);
        orders.setUid(uid);
        orders.setRid(rid);
        orders.setComment(comment);
        ordersService.save(orders);
        List<OrderDetail> details = new ArrayList<>();
        for (ShopCar shopCar : shopCars) {
            // 创建每一个订单详情
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOid(orders.getId());
            orderDetail.setDid(shopCar.getDid());
            orderDetail.setQuantity(shopCar.getQuantity().intValue());
            log.error("did: {}, quantity: {}", orderDetail.getDid(), orderDetail.getQuantity());
            // 创建dish查询
            LambdaQueryWrapper<Dish> dishWrapper = new LambdaQueryWrapper<>();
            dishWrapper.eq(Dish::getId, orderDetail.getDid());
            Dish dish = dishService.getOne(dishWrapper);
            // 计算订单详情价格
            orderDetail.setPrice(BigDecimal.valueOf((dish.getPrice().doubleValue() * (1 - dish.getDiscount().doubleValue() / 10)) * shopCar.getQuantity()));
            details.add(orderDetail);
        }
        // 保存orderDetail
        boolean orderDetailFlag = orderDetailService.saveBatch(details);
        // 清空购物车
//        boolean removeFlag = shopCarService.remove(shopCarWrapper);
        boolean removeFlag = shopCarService.removeByIds(Arrays.asList(scids));
        return orderDetailFlag && removeFlag ? ApiResponse.success(Boolean.TRUE, "提交成功!") : ApiResponse.error(0, "提交失败!");
    }

    /**
     * 查询用户订单详情
     *
     * @param oid 要查询详情的订单号
     * @return
     */
    @GetMapping("/user/detail")
    public ApiResponse<List<Map<String, Object>>> getUserOrderList(@RequestParam("id") Long oid) {
        // 存放最终结果的map，封装订单的每个详情
        List<Map<String, Object>> results = new ArrayList<>();
        LambdaQueryWrapper<Orders> ordersWrapper = new LambdaQueryWrapper<>();
        ordersWrapper.eq(Orders::getId, oid);
        Orders orders = ordersService.getOne(ordersWrapper);
        LambdaQueryWrapper<OrderDetail> detailWrapper = new LambdaQueryWrapper<>();
        detailWrapper.eq(OrderDetail::getOid, oid);
        List<OrderDetail> details = orderDetailService.list(detailWrapper);
        for (OrderDetail detail : details) {
            LambdaQueryWrapper<Dish> dishWrapper = new LambdaQueryWrapper<>();
            dishWrapper.eq(Dish::getId, detail.getDid());
            Dish dish = dishService.getOne(dishWrapper);
            Map<String, Object> infoMap = new HashMap<>();
            // 组装数据
            infoMap.put("id", detail.getId());
            infoMap.put("dish", dish);
            infoMap.put("price", detail.getPrice());
            infoMap.put("mark", detail.getMark());
            infoMap.put("quantity", detail.getQuantity());
            results.add(infoMap);
        }
        return ApiResponse.success(results, "用户成功查询订单详情!");
    }


    /**
     * 更新订单
     *
     * @param order 传入的订单
     * @return
     */
    @PostMapping("/rest/update")
    public ApiResponse<Boolean> update(@RequestBody Orders order) {
        // 留作扩展，根据订单状态执行对应的逻辑
        if (order.getStatus() == OrdersStatus.ORDER_STATUS_PAY) {

        }
        if (order.getStatus() == OrdersStatus.ORDER_STATUS_DELIVER) {

        }
        if (order.getStatus() == OrdersStatus.ORDER_STATUS_COMPLETE) {

        }
        if (order.getStatus() == OrdersStatus.ORDER_STATUS_REFUND) {

        }
        boolean update = ordersService.updateById(order);
        return update ? ApiResponse.success(update, "更新成功") : ApiResponse.error(0, "更新失败");
    }
}


