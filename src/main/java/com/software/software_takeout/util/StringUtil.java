package com.software.software_takeout.util;

import sun.security.provider.SecureRandom;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class StringUtil {

    private static List<String> orderComments = new ArrayList<>();

    static {
        orderComments.add("请尽快送达，谢谢！");
        orderComments.add("不要辣/少辣/微辣，谢谢！");
        orderComments.add("多加点酱料，谢谢！");
        orderComments.add("不要葱姜蒜，谢谢！");
        orderComments.add("饭要熟一点，谢谢！");
        orderComments.add("送餐时请打电话通知，谢谢！");
        orderComments.add("要筷子/勺子/纸巾，谢谢！");
        orderComments.add("饮料请选无糖/少糖，谢谢！");
        orderComments.add("请小心包装，谢谢！");
        orderComments.add("有过敏食材，注意查看，谢谢！");
        orderComments.add("送餐时请戴口罩，谢谢！");
        orderComments.add("请不要使用一次性餐具，谢谢！");
        orderComments.add("食材新鲜为主，谢谢！");
        orderComments.add("请提供发票，谢谢！");
        orderComments.add("送餐时注意保温，谢谢！");
        orderComments.add("要求纸质发票，谢谢！");
        orderComments.add("请不要加味精，谢谢！");
        orderComments.add("送餐时间有限，请准时，谢谢！");
        orderComments.add("请附赠一些餐厅小吃，谢谢！");
        orderComments.add("尽量使用环保包装，谢谢！");
    }

    // 接受string(yyyy-dd-mm) 返回对应的localdatetime
    public static LocalDateTime GtStringToLocalDateTime(String date) {
        // 将字符串解析为 LocalDateTime
        return LocalDateTime.parse(date + " 00:00:00", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static LocalDateTime LtStringToLocalDateTime(String date) {
        // 将字符串解析为 LocalDateTime
        return LocalDateTime.parse(date + " 23:59:59", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public static String generateRandomString(int len) {
        int length = len;
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            sb.append(randomChar);
        }
        return sb.toString();
    }

    public static String getRandomComment() {
        return orderComments.get(new Random().nextInt(orderComments.size() - 1));
    }

    public static boolean StringToLocalDateTime(String date) {
        return false;
    }
}
