package com.kh.eyes.user.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.eyes.user.model.repository.UserRepository;
import com.kh.eyes.user.model.vo.User;

@Component
public class MemberValidator implements Validator{
	
	private final UserRepository userRepository;
	
	public MemberValidator(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		User member = (User) target;

		//1. 아이디 존재 유무
		if(userRepository.selectUserById(member.getUserId()) != null){
			errors.rejectValue("userId", "error.userId", "이미 존재하는 아이디입니다.");
		}
		
		//2. 비밀번호가 8글자 이상의 숫자,영문자,특수문자 조합인지
		Pattern pattern = Pattern.compile("^(?!.*[ㄱ-힣])(?=.*\\W)(?=.*\\d)(?=.*[a-zA-Z])(?=.{8,})");
	
		if(!pattern.matcher(member.getUserPwd()).find()) {
			errors.rejectValue("userPwd", "error.userPwd", "비밀번호는 영어,숫자,특수문자 조합의 8글자 이상인 문자입니다.");
		}
		
	}

}