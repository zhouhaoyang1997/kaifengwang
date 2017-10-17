package com.kf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

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

	/**
	 * 错误处理
	 * @return
	 */
	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {

		return new EmbeddedServletContainerCustomizer() {
			@Override
			public void customize(ConfigurableEmbeddedServletContainer container) {
				ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/404.html");
				container.addErrorPages(error404Page);
			}
		};
	}
}
