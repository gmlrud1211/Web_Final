package com.allhotplace.www.controller.user;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dto.Users;
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
	public String LoginProc(HttpSession session, 
							String user_id, String user_pw, 
							Model model) {
		
		model.addAttribute("user_id", user_id);
		model.addAttribute("user_pw",user_pw);
		
		int login = userService.login(model);
		
		if(login == 1 ) {//로그인성공
			session.setAttribute("login", true);
			session.setAttribute("user_id", user_id);
			logger.info("로그인 성공");
			
			return "redirect:/main";
		}
		
		else { //로그인 실패 
			logger.info("로그인 실패");
			
			return "redirect:/main";
		}
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		userService.logout(session);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String Join() {
		
		return "/user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String JoinProc(Users user, Model model) {
		
		logger.info(user.toString());
		
		//전달받은 정보로 회원가입
		userService.join(user);
		
		return "redirect:/login";
	}

	
}
