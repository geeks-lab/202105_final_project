package com.kh.eyes.voice.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.eyes.voice.model.vo.Voice;

@Mapper
public interface VoiceRepository {
	
	@Insert("insert into voice_synth "
			+ "(voice_sy_id, voice_sy_length, voice_sy_text, que_data_idx) "
			+ "values (#{voiceSyId}, #{voiceSyLength}, #{voiceSyText}, #{queDataIdx}) ")
	int insertVoiceSynth(Voice voice);
	
}
