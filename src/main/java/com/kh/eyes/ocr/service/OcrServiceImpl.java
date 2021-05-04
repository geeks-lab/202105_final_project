package com.kh.eyes.ocr.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class OcrServiceImpl implements OcrService{
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Override
	public String getTextFromOcr(Map<String, Object> bodyObj) {
		final String  SECRET_KEY = "eGdDTUN0a0liaE5NYnhaZERGc3RYQVNDcXBNbmh1bGo=";
		final String  invokeURL = "https://0065417594944195ac1452a41b197f7b.apigw.ntruss.com/custom/v1/8430/12a8a28869fc3dfac419936519c63abadcf50e925d078c50ea3a3369d356198a/general";
		
		HttpHeaders headerMap = new HttpHeaders();
		headerMap.add("Content-Type", "application/json");
		headerMap.add("X-OCR-SECRET",SECRET_KEY);
		RequestEntity< Map<String,Object>> entity = RequestEntity
																.method(HttpMethod.POST, invokeURL)
																.headers(headerMap)
																.body(bodyObj);
		
		ResponseEntity<String> response = restTemplate.exchange(entity, String.class);
		return response.getBody();
	}
	
}
