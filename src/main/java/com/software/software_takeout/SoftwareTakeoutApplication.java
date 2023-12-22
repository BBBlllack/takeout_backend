package com.software.software_takeout;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Slf4j
@SpringBootApplication
@EnableScheduling
@EnableTransactionManagement
public class SoftwareTakeoutApplication {

    public static void main(String[] args) {
        SpringApplication.run(SoftwareTakeoutApplication.class, args);
        log.info("服务器启动成功...");
    }

}
