package com.kh.eyes.teachable.controller;

import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eyes.teachable.model.service.TeachableService;
import com.kh.eyes.teachable.model.vo.Teachable;
import com.kh.eyes.user.model.vo.User;

@Controller
@RequestMapping("teach")
public class TeachableController {
	
	private final TeachableService teachableService;
	
	public TeachableController(TeachableService teachableService) {
		this.teachableService = teachableService;
	}
	
	@GetMapping("food")
	public String food() {
		return "teachable/teachFood";
	}
	
	@GetMapping("product")
	public String product() {
		return "teachable/teachProduct";
	}
	
	@RequestMapping("formImage")
	public String formImage(String[] teachData,
			@RequestParam(value="file", required=true) MultipartFile file,
			@SessionAttribute(name = "userInfo", required = false) User user) { //view단에서 매개변수로 받음
	    
	    Teachable teachable = new Teachable();
	    teachable.setQueFileName(UUID.randomUUID().toString());
	    teachable.setQueCategory(teachData[0]);
	    teachable.setQueResult(teachData[1]);
	    
	    String userId = user == null?"guest":user.getUserId();
	    teachable.setUserId(userId);
		
		teachableService.insertTeachable(teachable, file);
	    return "teachable/teachFood";
	}

	@GetMapping("jiyoungtest")
	public String jiyoungtest() {
		return "teachable/teachProduct_jiyoung";
	}
	
	
}



