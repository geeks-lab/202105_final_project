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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.eyes.common.code.ErrorCode;
import com.kh.eyes.common.exception.ToAlertException;
import com.kh.eyes.user.model.service.UserService;
import com.kh.eyes.user.model.vo.User;
import com.kh.eyes.user.validator.MemberValidator;

//1. 해당 클래스를 applicationContext에 빈으로 등록
//2. Controller와 관련된 annotation을 사용할 수 있게 해준다.
//	@RequestMapping : 컨트롤러의 메서드와 매핑시킬 요청 url을 지정, http method 상관없음
//	@GetMapping : 컨트롤러의 메서드와 매핑시킬 요청 url을 지정 get method만 매핑
//	@PostMapping : 컨트롤러의 메서드와 매핑시킬 요청 url을 지정 post method만 매핑
//	@RequestParam : 요청 파마리터를 컨트롤러 메서드의 매개변수에 바인드
//					FormHttpRequestConverter가 동작, Content-type : form-url-encoded
//					속성 >> name : 요청파라미터명, 컨트롤러메서드의 매개변수명과 요청파라미터명이 같으면 생략 가능
//						required : 필수 여부 default : true
//						defaultValue : 파라미터가 없거나, 빈 값이 넘어왔을 때 세팅할 기본 값
//						value : name alias ex) @RequestParam("userId")
//	@RequestBody : json 포맷으로 넘어온 요청 바디를 읽어서 자바의 객체에 바인드
//				MappingJacksonHttpMessageConverter가 동작 Content-type : application/json
//	@ModelAttribute : 요청 파라미터를 VO에 바인드, VO에 바인드함과 동시에 Model에 VO를 담는다.
//	@SessionAttribute : 원하는 Session의 속성을 컨트롤러의 매개변수에 바인드
//	@CookieValue : 원하는 Cookie의 값을 컨트롤러의 매개변수에 바인드
//	@PathVariable : url 템플릿에 담긴 파라미터값을 컨트롤러의 매개변수에 바인드
//	@ResponseBody : 컨트롤러의 메서드 위에 작성, 메서드가 반환하는 값을 응답바디에 직접 넣어준다.

// *** Servlet 객체(HttpServletRequest, HttpServletResponse, HttpSession)들을
//	컨트롤러 메서드의 매개변수로 전달받을 수 있다.
//	HttpEntity, RequestEntity, ResponseEntity

@Controller
@RequestMapping("user")
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
	
	@GetMapping("join")
	public String boardForm() {
		return "user/join";
	}
	
	@GetMapping("idcheck")
	@ResponseBody
	public String idcheck(String userId) {
		if(memberService.selectMemberById(userId).equals(userId)) {
			return "fail";
		}
		return "success";
	}
	
//	@PostMapping("mailauth")
//	public String authenticateEmail(@Valid User persistInfo
//							, Errors error //반드시 @Valid 변수 바로 뒤에 작성
//							, HttpSession session
//							, Model model) {
//		if(error.hasErrors()) {
//			return "member/join";
//		}
//		
//		String authPath = UUID.randomUUID().toString();
//		
//		//session에 persistInfo 저장
//		session.setAttribute("persistInfo", persistInfo);
//		session.setAttribute("authPath", authPath);
//		
//		//memberService의 authenticateEmail 호출해서 회원가입 메일 발송
//		//memberService.authenticateEmail(persistInfo, authPath);
//		
//		//메일발송 안내창 출력 후 index 페이지로 페이지 이동
//		model.addAttribute("msg", "이메일 발송이 완료되었습니다.");
//		model.addAttribute("url", "/index");
//		
//		return "common/result";
//	}
	
	@GetMapping("joinimpl/{authPath}")
	public String joinImpl(HttpSession session
			,@PathVariable String authPath
			,@SessionAttribute("authPath") String sessionPath
			,@SessionAttribute("persistInfo") User persistInfo
			,Model model) {
		
		if(!authPath.equals(sessionPath)) {
			throw new ToAlertException(ErrorCode.AUTH02);
		}
		memberService.insertMember(persistInfo);
		model.addAttribute("msg","회원가입이 완료되었습니다.");
		model.addAttribute("url", "/index");
		session.removeAttribute("persistInfo");
		
		return "common/result";
		
	}
	
	@GetMapping("login")
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
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		//redirect 사용해보기
		return "redirect:/index";
	}
	
	@GetMapping("mypage")
	public void mypage() {};
	
	
}