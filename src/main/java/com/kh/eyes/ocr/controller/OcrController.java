package com.kh.eyes.ocr.controller;

import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.eyes.ocr.service.OcrService;

@Controller
@RequestMapping("ocr")
public class OcrController {
	
	private final OcrService ocrService;
	
	public OcrController(OcrService ocrService) {
		this.ocrService = ocrService;
	}
	
	@GetMapping("document")
	public String instead() {
		return "ocr/documentOcr";
	}

	@PostMapping("response")
	@ResponseBody
	public ResponseEntity<String> getTextFromOCR(@RequestBody Map<String,Object> bodyObj) {				
		String response = ocrService.getTextFromOcr(bodyObj);
		HttpHeaders responseHeaders = new HttpHeaders(); 
		responseHeaders.add("Content-Type", "text/plain; charset=utf-8");

		return new ResponseEntity<String>(response, responseHeaders,HttpStatus.OK);
	}

}