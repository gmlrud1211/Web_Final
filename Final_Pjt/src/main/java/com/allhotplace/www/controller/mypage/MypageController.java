package com.allhotplace.www.controller.mypage;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.mypage.MypageService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;


	@RequestMapping(value="/mypage/info", method=RequestMethod.GET)
	public String MyInfo(HttpSession session, Model model) {
		
		logger.info("마이페이지 - 개인정보조회");
		
		String user_id = (String) session.getAttribute("user_id");
		logger.info("접속중인 아이디 : "+user_id);
		
		Users user= mypageService.viewUserInfo(user_id);
		model.addAttribute("user",user);
		
		return "mypage/myInfo";
	}
			
}
