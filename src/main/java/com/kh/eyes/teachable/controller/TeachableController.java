package com.kh.eyes.teachable.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("teach")
public class TeachableController {
	
	@GetMapping("food")
	public String food() {
		return "teachable/teachFood";
	}
	
	@GetMapping("product")
	public String product() {
		return "teachable/teachProduct";
	}
	
	@GetMapping("jiyoungtest")
	public String jiyoungtest() {
		return "teachable/teachProduct_jiyoung";
	}
}
