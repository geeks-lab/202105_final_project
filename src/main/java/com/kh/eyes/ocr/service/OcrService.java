package com.kh.eyes.ocr.service;

import java.util.Map;

public interface OcrService {
	
	String getTextFromOcr(Map<String, Object> bodyObj);
	
}
