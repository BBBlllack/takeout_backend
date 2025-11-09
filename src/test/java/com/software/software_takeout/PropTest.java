package com.software.software_takeout;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;

@SpringBootTest
public class PropTest {
    private static String ip;

    @Value("${cors.config.ip}")
    public void setIp(String value){
        PropTest.ip = value;
    }

    public static String getIp() {
        return ip;
    }

    @Test
    void test1(){
        System.out.println(PropTest.getIp());
    }
}
