package com.software.software_takeout;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.List;

@Slf4j
@SpringBootApplication
@EnableCaching // 启用 SpringCache，使用 Redis 作为缓存供应商
@EnableScheduling // 启用定时任务
@EnableTransactionManagement // 启用 spring 事务管理
public class SoftwareTakeoutApplication implements CommandLineRunner {

    @Value("${author.title}")
    public String title;

    @Value("${author.info}")
    public List<String> authors;

    public static void main(String[] args) {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(SoftwareTakeoutApplication.class, args);
        log.info("server is running on port: {}", applicationContext.getEnvironment().getProperty("server.port"));
    }

    @Override
    public void run(String... args) throws Exception {
        log.error(title);
        int count = 0;
        for (String author : authors) {
            log.error("author {}: {}", count++, author);
        }
    }
}
