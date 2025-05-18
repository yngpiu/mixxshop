package com.example.springWEB.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Maps for local product images
        registry.addResourceHandler("/resources/images/product/**")
                .addResourceLocations("classpath:/static/images/product/")
                .addResourceLocations("file:src/main/webapp/resources/images/product/");
        
        // Legacy mapping for backward compatibility
        registry.addResourceHandler("/images/product/**")
                .addResourceLocations("classpath:/static/images/product/")
                .addResourceLocations("file:src/main/webapp/resources/images/product/");
    }
} 