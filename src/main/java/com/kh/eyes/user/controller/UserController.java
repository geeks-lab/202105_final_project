package com.kh.eyes.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eyes.user.model.service.UserService;
import com.kh.eyes.user.model.vo.User;
import com.kh.eyes.user.validator.MemberValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	UserService userService;
	MemberValidator memberValidator;
	
	public UserController(UserService userService, MemberValidator memberValidator) {
		this.userService = userService;
		this.memberValidator = memberValidator;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(memberValidator);
	}
	
	@GetMapping("/join")
	public String boardForm() {
		return "user/join";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idcheck(String userId) {
		if(userService.selectUserById(userId) != null) {
			return "fail";
		}	
		return "success";
	}	
	
	@PostMapping("/joinimpl")
	public String joinImpl(HttpSession session
			,@ModelAttribute User persistInfo
			,Model model) {
		System.out.println(persistInfo);
		userService.insertUser(persistInfo);
		model.addAttribute("msg","회원가입이 완료되었습니다.");
		model.addAttribute("url", "/index");
		session.removeAttribute("persistInfo");
		
		return "common/result";
	}
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@PostMapping("loginimpl")
	@ResponseBody
	public String loginImpl(@RequestBody User user
			, HttpSession session) {
		
		User userInfo = userService.authenticateUser(user);
		if(userInfo == null) {
			return "fail";
		}
		
		session.setAttribute("userInfo", userInfo);
		return "success";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/index";
	}
	
	@GetMapping("/mypage")
	public void mypage() {};
	
}