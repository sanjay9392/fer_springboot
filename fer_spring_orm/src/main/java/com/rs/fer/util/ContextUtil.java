package com.rs.fer.util;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.rs.fer.service.FERService;

public class ContextUtil {
	public static FERService getFERService() {
		return new ClassPathXmlApplicationContext("spring_ht.xml").getBean(FERService.class);

	}

}
