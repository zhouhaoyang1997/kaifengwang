package com.kf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.MultipartConfigElement;


@Configuration
@SpringBootApplication
@MapperScan("com.kf.mapper")
public class CgApplication {

	public static void main(String[] args) {
		SpringApplication.run(CgApplication.class, args);
	}

	/**
	 * 文件上传配置
	 * @return
	 */
	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		//文件最大上传为3m
		factory.setMaxFileSize("3072KB"); //KB,MB
		/// 设置总上传数据总大小
		factory.setMaxRequestSize("102492KB");
		return factory.createMultipartConfig();
	}
}
