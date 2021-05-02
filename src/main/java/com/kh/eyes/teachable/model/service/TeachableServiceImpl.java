package com.kh.eyes.teachable.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.http.RequestEntity.BodyBuilder;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eyes.teachable.model.repository.TeachableRepository;
import com.kh.eyes.teachable.model.vo.Teachable;

@Service
public class TeachableServiceImpl implements TeachableService{

	private final TeachableRepository teachableRepository;
	
	@Autowired
	private RestTemplate restTemplate;
	
	public TeachableServiceImpl(TeachableRepository teachableRepository) {
		this.teachableRepository = teachableRepository;
	}
	
	@Override
	public void insertTeachable(Teachable teachable, MultipartFile file) { //fileUtil활용
		try {
			String savePath = getfSavePath();
			System.out.println(savePath);
			
			teachable.setQueSavePath(savePath);
			
			teachableRepository.insertTeachable(teachable);
			saveFile(teachable, file);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
	}
	
	private String getfSavePath() {
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR) + "/"
				+ (cal.get(Calendar.MONTH) + 1) + "/"
				+ cal.get(Calendar.DAY_OF_MONTH) + "/";
	}
	
	private void saveFile(Teachable teachable, MultipartFile file) throws IllegalStateException, IOException {
		File dest = new File(teachable.getFullPath() + teachable.getQueFileName());
		if(!dest.exists()) {
			new File(teachable.getFullPath()).mkdirs();
		}
		
		file.transferTo(dest);
	}

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
