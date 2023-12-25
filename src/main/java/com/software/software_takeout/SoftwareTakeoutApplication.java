package com.software.software_takeout;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Slf4j
@SpringBootApplication
@EnableCaching // 启用 SpringCache，使用 Redis 作为缓存供应商
@EnableScheduling // 启用定时任务
@EnableTransactionManagement // 启用 spring 事务管理
public class SoftwareTakeoutApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(SoftwareTakeoutApplication.class, args);
        log.info("server is running on port: {}", applicationContext.getEnvironment().getProperty("server.port"));
    }

}
