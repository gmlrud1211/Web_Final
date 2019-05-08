package com.allhotplace.www.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.allhotplace.www.dao.face.admin.FileDao;
import com.allhotplace.www.dto.Fileupload;


@Controller
public class FileController {
	
	@Autowired ServletContext context; 
	@Autowired FileDao fileDao;
	
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);

	@RequestMapping(value="/file/fileup", method=RequestMethod.GET)
	public void fileForm() {}
	
	@RequestMapping(value="/file/fileup", method=RequestMethod.POST)
	public String fileupload(MultipartFile file,
			Fileupload upFile ) {
		logger.info("파일업로드");
		
		// 고유 식별자 
		String uId = UUID.randomUUID().toString().split("-")[0];
		
		//저장될 파일 이름
		String stored_name = null;
		stored_name = file.getOriginalFilename()+"_"+uId;
		
		// 파일 저장 경로
		String path = context.getRealPath("upload");
		
		// 저장될 파일 
		File dest = new File(path,stored_name);
		
		// 파일 업로드 
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		upFile.setFile_name(file.getOriginalFilename());
		upFile.setFile_storedName(stored_name);
		
		logger.info(file.toString());
		
		// DB에 파일 저장
		fileDao.insert(upFile);

		return null;
	}
		
	
	@RequestMapping("/file/list")
	public void filelist(Model model) {
		
		// 업로드된 파일 전체 조회 
		List<Fileupload> list  = fileDao.selectAll();
		
		// 모델에 추가 
		model.addAttribute("list", list);
	}
	
	
	@RequestMapping("/file/download")
	public ModelAndView download(int file_no, ModelAndView mav) {
		
		// 모델 값 지정 - 다운받으려는 파일의 정보 
		Fileupload file = fileDao.selectByFileno(file_no);
		mav.addObject("downFile",file);
		
		// 뷰지정 
		mav.setViewName("down"); // 빈 id
		
		return mav;
	}

	
	
}
