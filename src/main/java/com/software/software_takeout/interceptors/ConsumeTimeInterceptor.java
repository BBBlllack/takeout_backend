package com.software.software_takeout.interceptors;

import com.software.software_takeout.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 记录日志, 接口耗时, 当前用户
 * @author shj
 */
@Slf4j
@Component
public class ConsumeTimeInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String authorization = request.getHeader("Authorization");
        Map<String, Object> map;
        try {
            map = JwtUtil.parseToken(authorization);
        } catch (Exception e) {
            map = new HashMap<>();
            map.put("id", null);
        }
        String uri = request.getRequestURI();
        log.info("---------------------请求开始--------------------");
        log.info("请求接口: {}", uri);
        log.info("当前用户: {}", map.get("id"));
        request.setAttribute("startTime", System.currentTimeMillis());
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.info("接口耗时: {}ms", System.currentTimeMillis() - (Long) request.getAttribute("startTime"));
        log.info("---------------------请求结束--------------------");
    }
}
