package com.allhotplace.www.controller.mypage;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.mypage.MypageService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;


	@RequestMapping(value="/mypage/myInfo")
	public void MyInfo(HttpSession session, Model model) {
		
		logger.info("마이페이지 - 개인정보조회");
		
		String user_id = (String) session.getAttribute("user_id");
		logger.info("접속중인 아이디 : "+user_id);
		
		Users user= mypageService.viewUserInfo(user_id);
		model.addAttribute("user",user);
		
	}
	
	@RequestMapping(value="/mypage/infoUpdate", method=RequestMethod.GET)
	public void InfoUpdateView(HttpSession session, Model model) {
		logger.info("개인정보수정페이지-get");
		
		String user_id = (String) session.getAttribute("user_id");
		logger.info("접속중인 아이디 : "+user_id);
		
		Users user= mypageService.viewUserInfo(user_id);
		model.addAttribute("user",user);
		
	}
	
	
	@RequestMapping(value="/mypage/infoUpdate", method=RequestMethod.POST)
	public String InfoUpdate(Model model, Users user, HttpServletRequest req,
							@RequestParam("birth_day")String birth_day,
							@RequestParam("birth_month")String birth_month,
							@RequestParam("birth_year")String birth_year) {
	
		logger.info("개인정보수정페이지-post");

		req.getAttribute(birth_year);
		req.getAttribute(birth_month);
		req.getAttribute(birth_day);
				
		String user_birth = birth_year+"/"+birth_month+"/"+birth_day;
		
		user.setUser_birth(user_birth);
		System.out.println(user_birth);
			
		
		mypageService.updateInfo(user);
				
		return "redirect:/mypage/info";
	}
	
	@RequestMapping(value="/mypage/calendar")
	public void CalendarList(HttpSession session, Model model) {
		
		logger.info("마이페이지 - 개인정보조회");
		
		String user_id = (String) session.getAttribute("user_id");
		logger.info("접속중인 아이디 : "+user_id);
		
		List<Calendar> calendarList = mypageService.viewUserCalendarList(user_id);
		model.addAttribute("calendarList", calendarList);
	
	}
}
