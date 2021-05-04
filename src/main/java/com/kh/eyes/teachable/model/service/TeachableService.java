package com.kh.eyes.teachable.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.eyes.teachable.model.vo.Teachable;

public interface TeachableService {
	
	void insertTeachable(Teachable teachable, MultipartFile file);

	 String getTextFromOcr(Map<String, Object> bodyObj);
	
}
