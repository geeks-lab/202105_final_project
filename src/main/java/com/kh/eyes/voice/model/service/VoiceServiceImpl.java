package com.kh.eyes.voice.model.service;

import org.springframework.stereotype.Service;

import com.kh.eyes.voice.model.repository.VoiceRepository;
import com.kh.eyes.voice.model.vo.Voice;

@Service
public class VoiceServiceImpl implements VoiceService{

	private final VoiceRepository voiceRepository;
	
	public VoiceServiceImpl(VoiceRepository voiceRepository) {
		this.voiceRepository = voiceRepository;
	}
	
	@Override
	public void insertVoiceSynth(Voice voice) {
		voiceRepository.insertVoiceSynth(voice);
	}

}
