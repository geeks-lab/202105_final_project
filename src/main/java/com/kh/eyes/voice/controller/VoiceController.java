package com.kh.eyes.voice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.eyes.voice.model.service.VoiceService;
import com.kh.eyes.voice.model.vo.Voice;

@Controller
@RequestMapping("teach")
public class VoiceController {
	
	private final VoiceService voiceService;
	
	public VoiceController(VoiceService voiceService) {
		this.voiceService = voiceService;
	}
	
	@RequestMapping("voiceSynth")
	public String voiceSynth(String[] voiceData) {
		Voice voice = new Voice();
		//service에 넘겨줄 데이터 작성
		
		voiceService.insertVoiceSynth(voice);
		return "teachable/teachFood";
	}
	
}
