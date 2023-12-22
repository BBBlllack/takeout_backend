package com.software.software_takeout.interceptors;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.software.software_takeout.entity.ApiResponse;
import com.software.software_takeout.util.JwtUtil;
import com.software.software_takeout.util.ThreadLocalUtil;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String authorization = request.getHeader("Authorization");
        try {
            Map<String, Object> map = JwtUtil.parseToken(authorization);
            // 若用户携带了token, 将其放入ThreadLocal中
            ThreadLocalUtil.set(map);
        }catch (Exception e){
            // 未携带令牌
            response.setStatus(401);
            ObjectMapper mapper = new ObjectMapper();
            response.getWriter().write(mapper.writeValueAsString(ApiResponse.error(401, "NOT LOGIN")));
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//        释放内存
        ThreadLocalUtil.remove();
    }
}
