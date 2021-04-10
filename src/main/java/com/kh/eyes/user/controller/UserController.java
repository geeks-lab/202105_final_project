package com.kh.eyes.user.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.eyes.common.code.ErrorCode;
import com.kh.eyes.common.exception.ToAlertException;
import com.kh.eyes.user.model.service.UserService;
import com.kh.eyes.user.model.vo.User;
import com.kh.eyes.user.validator.MemberValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	UserService memberService;
	MemberValidator memberValidator;
	
	public UserController(UserService memberService, MemberValidator memberValidator) {
		this.memberService = memberService;
		this.memberValidator = memberValidator;
	}
	
	//InitBinder : WebDataBinder를 초기화하는 메서드를 식별하는 주석
	//		value : webDataBinder가 적용될 파라미터 명 또는 Model의 attribute 이름
	@InitBinder //(value="title")
	public void initBinder(WebDataBinder webDataBinder) {
		//WebDataBinder : 컨트롤러 메서드의 파라미터에 데이터를 bind 해주는 역할 수행
		webDataBinder.addValidators(memberValidator);
	}
	
	//view를 지정하는 방법
	//1. ModelAndView 객체를 만들어서 setViewName 메서드에 view 경로를 지정하고 객체를 리턴
	//2. view 경로를 반환
	//3. 아무것도 반환하지 않을 경우, 요청 url을 view 경로로 지정
	
	/*
	 * @GetMapping("join")
	 * public void member() {};
	 */
	
	@GetMapping("/join")
	public String boardForm() {
		return "user/join";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idcheck(String userId) {
		if(memberService.selectMemberById(userId) != null) {
			return "fail";
		}
		
		return "success";
	}
	
	
	@PostMapping("/joinimpl")
	public String joinImpl(HttpSession session
			,@ModelAttribute User persistInfo
			,Model model) {
		System.out.println(persistInfo);
		memberService.insertMember(persistInfo);
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
	public String loginImpl(@RequestBody User member
			, HttpSession session) {
		
		User userInfo = memberService.authenticateUser(member);
		if(userInfo == null) {
			return "fail";
		}
		
		session.setAttribute("userInfo", userInfo);
		return "success";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		//redirect 사용해보기
		return "redirect:/index";
	}
	
	@GetMapping("/mypage")
	public void mypage() {};
	
	
}