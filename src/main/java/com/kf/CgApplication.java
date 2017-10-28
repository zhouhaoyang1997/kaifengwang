package com.kf;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.kf.xss.XssStringJsonSerializer;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;

import javax.servlet.MultipartConfigElement;


@Configuration
@SpringBootApplication
@MapperScan("com.kf.mapper")
@ServletComponentScan
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
		factory.setLocation("C:/Users/18236/Desktop/");
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

	/**
	 * primary注解优先权作用，貌似可以不加
	 * 参考 http://www.jb51.net/article/115232.htm
	 * @param builder
	 * @return
	 */
	@Bean
	@Primary
	public ObjectMapper xssObjectMapper(Jackson2ObjectMapperBuilder builder){
		//解析器?????
		ObjectMapper mapper = builder.createXmlMapper(false).build();
		//注册xss解析器
		SimpleModule xssModule = new SimpleModule("XssStringJsonSerializer");
		xssModule.addSerializer(new XssStringJsonSerializer());
		mapper.registerModule(xssModule);
		return mapper;
	}
}
