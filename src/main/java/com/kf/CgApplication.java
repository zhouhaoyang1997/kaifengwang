package com.kf;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.kf.mapper")
public class CgApplication {

	public static void main(String[] args) {
		SpringApplication.run(CgApplication.class, args);
	}
}
