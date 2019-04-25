package com.allhotplace.www.controller.user;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.service.face.user.UserService;


@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String Login() {
		
		return "/user/login";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String LoginProc() {
		
		return "/user/login";
	}

	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		//userService.logout(session);
		
		return "redirect:/member/main";
	}
	
	
	
	
}
