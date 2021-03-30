package com.kh.eyes.instead.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InsteadController {
	 @GetMapping("instead")
	   public String instead() {
	      return "instead/instead";
}
}