package com.kh.eyes.teachable.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eyes.teachable.model.repository.TeachableRepository;
import com.kh.eyes.teachable.model.vo.Teachable;

@Service
public class TeachableServiceImpl implements TeachableService{

	private final TeachableRepository teachableRepository;
	
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
}
