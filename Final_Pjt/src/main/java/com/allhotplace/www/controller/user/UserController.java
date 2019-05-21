package com.allhotplace.www.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.user.UserService;
import com.fasterxml.jackson.databind.JsonNode;


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
		
		if(login == 1 && user_id.equals("admin")) {//관리자로그인성공
			session.setAttribute("login", true);
			session.setAttribute("user_id", user_id);
			
			model.addAttribute("user_id", user_id);
			logger.info("로그인 성공");
			
			return "redirect:/admin/dashboard/list";
		}
		
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
	
	@RequestMapping(value="/kakaologin", produces = "application/json",method = {RequestMethod.GET, RequestMethod.POST})
	public String KakaoLogin(@RequestParam("code") String code , 
							HttpServletRequest request, HttpServletResponse response, 
							HttpSession session,
							Users user) throws IOException{
		
		  JsonNode token = KakaoLogin.getAccessToken(code);

		  JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		  System.out.println(profile);
		  Users vo = KakaoLogin.changeData(profile);
		  vo.setUser_id("k"+vo.getUser_id());

		  System.out.println(session);
		  session.setAttribute("login", true);
		  System.out.println(vo.toString());
		  session.setAttribute("user_id", vo.getUser_name());
			
		return "/user/kakaoLogin";
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
	public String JoinProc( Users user, HttpServletRequest req,
							@RequestParam("birth_day")String birth_day,
							@RequestParam("birth_month")String birth_month,
							@RequestParam("birth_year")String birth_year) {
		
		req.getAttribute(birth_year);
		req.getAttribute(birth_month);
		req.getAttribute(birth_day);
				
		String user_birth = birth_year+"/"+birth_month+"/"+birth_day;
		
		user.setUser_birth(user_birth);
		System.out.println(user_birth);
		
		//전달받은 정보로 회원가입
		userService.join(user);
		
		return "redirect:/login";
	}

	
}
