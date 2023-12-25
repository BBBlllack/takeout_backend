package com.software.software_takeout.config;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.software.software_takeout.interceptors.ConsumeTimeInterceptor;
import com.software.software_takeout.interceptors.LoginInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

@Slf4j
@SpringBootConfiguration
public class WebMvcConfig implements WebMvcConfigurer {

    @Resource
    private LoginInterceptor loginInterceptor;

    @Resource
    private ConsumeTimeInterceptor consumeTimeInterceptor;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("加载静态资源解析器...");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        log.info("加载拦截器...");
        List<String> loginUrls = new LinkedList<>();
        List<String> loginUrlsExcludes = new LinkedList<>();
        loginUrls.add("/**");
        // 不拦截的请求
        loginUrlsExcludes.add("/user/login");
        loginUrlsExcludes.add("/rest/login");
        loginUrlsExcludes.add("/test/**");
        loginUrlsExcludes.add("/show/**");
        loginUrlsExcludes.add("/static/**");
        loginUrlsExcludes.add("/deliver/**");
        loginUrlsExcludes.add("/actuator/**");
        loginUrlsExcludes.add("/instances");
        loginUrlsExcludes.add("/error ");
//        registry.addInterceptor(consumeTimeInterceptor).addPathPatterns("/**");
        registry.addInterceptor(loginInterceptor).addPathPatterns(loginUrls).excludePathPatterns(loginUrlsExcludes);
    }

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        // 移除默认的消息转化器
        converters.removeIf(converter -> converter instanceof MappingJackson2HttpMessageConverter);
        // 使用fastjson消息转换器解决Mybatis Plus主键过大问题
        // ctmd坑死我了
        FastJsonHttpMessageConverter fastJsonHttpMessageConverter = new FastJsonHttpMessageConverter();
        FastJsonConfig fastJsonConfig = new FastJsonConfig();
        fastJsonConfig.setSerializerFeatures(SerializerFeature.BrowserCompatible);
        fastJsonHttpMessageConverter.setFastJsonConfig(fastJsonConfig);
        converters.add(fastJsonHttpMessageConverter);
    }
}
