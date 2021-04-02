package com.kh.eyes.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
	
	//혹시 context path가 있다면 생략하고 작성 ex) /mybatis -> 생략
	@GetMapping("index")
	public String index() {
		return "index/index";
	}
	
	@GetMapping("info")
	public String info() {
		return "index/info";
	}
}
