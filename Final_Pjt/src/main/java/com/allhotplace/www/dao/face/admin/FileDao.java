package com.allhotplace.www.dao.face.admin;

import java.util.List;

import com.allhotplace.www.dto.Fileupload;

public interface FileDao {

	//파일 업로드 기록 저장
	public void insert(Fileupload upFile);
	
	// 파일 전체 조회 
	public List selectAll();
	
	// 지정된 fileno의 파일 조회 
	public Fileupload selectByFileno(int fileno);
	
}
