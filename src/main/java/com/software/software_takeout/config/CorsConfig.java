package com.software.software_takeout.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

@Slf4j
//@Configuration
public class CorsConfig {

    @Value("${cors.config.ip}")
    public String corsIp;

    @Bean
    public CorsFilter corsFilter() {
        log.info("cors config is loading and corsIp is " + corsIp);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        // 允许来自域的请求
        config.addAllowedOrigin(corsIp);
        log.info("allow orgin is:" + corsIp);
//        config.addAllowedOrigin("*");
        // 允许使用的HTTP方法
        config.addAllowedMethod("GET");
        config.addAllowedMethod("POST");
        config.addAllowedMethod("PUT");
        config.addAllowedMethod("DELETE");
        // 允许的请求头
        config.addAllowedHeader("*");
        // 允许带凭证（如Cookie）
        config.setAllowCredentials(true);
        source.registerCorsConfiguration("/**", config);
        return new CorsFilter(source);
    }
}
