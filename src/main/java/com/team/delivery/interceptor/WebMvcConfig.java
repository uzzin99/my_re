package com.team.delivery.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new CustomInterceptor())
                .order(1)
                .addPathPatterns("/signUp/**","/s_info","/cart","/newpost","/delBD","/upBD","/delCmt") //여기가 로그인 창으로 넘어가는 부분
                .excludePathPatterns(); //여기는 통과해도 되는부분<--요줄에 적어주심 됩니다

    }
}
