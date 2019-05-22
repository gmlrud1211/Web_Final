package com.allhotplace.www.controller.admin;

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

import com.allhotplace.www.dao.face.admin.ChatbotDao;
import com.allhotplace.www.dto.MChatbot;
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.dto.SChatbot;
import com.allhotplace.www.dto.XChatbot;
import com.allhotplace.www.service.face.admin.ChatbotService;

@Controller
public class ChatbotListController {

	@Autowired
	ChatbotDao chatbotDao;
	@Autowired
	ChatbotService chatbotService;

	private static final Logger logger = LoggerFactory.getLogger(ChatbotListController.class);

	@RequestMapping(value = "/admin/chatbot/list", method = RequestMethod.GET)
	public void boardList(Model model, HttpServletRequest req, HttpSession session) { 

		// 대분류 목록 MODEL로 추가
		List<XChatbot> xchatlist = chatbotService.selectXchat();
		model.addAttribute("xchatlist", xchatlist);

		// 중분류 목록 MODEL로 추가
		List<MChatbot> mchatlist = chatbotService.selectMchat();
		model.addAttribute("mchatlist", mchatlist);
		
		// 소분류 목록 MODEL로 추가
		List<SChatbot> schatlist = chatbotService.selectSchat();
		model.addAttribute("schatlist", schatlist);
	}

	
	@RequestMapping(value = "/admin/chatbot/write", method = RequestMethod.GET)
	public void write(Model model, HttpSession session) {

		// 대분류 목록 MODEL로 추가
		List<XChatbot> xchatlist = chatbotService.selectXchat();
		model.addAttribute("xchatlist", xchatlist);

		// 중분류 목록 MODEL로 추가
		List<MChatbot> mchatlist = chatbotService.selectMchat();
		model.addAttribute("mchatlist", mchatlist);

		// 소분류 목록 MODEL로 추가
		List<SChatbot> schatlist = chatbotService.selectSchat();
		model.addAttribute("schatlist", schatlist);
	}

	@RequestMapping(value = "/admin/chatbot/write", method = RequestMethod.POST)
	public String write(SChatbot schat, Model model, HttpSession session, 
			   String xChat_no, String mChat_no, String sChat_no, String sChat_name, String sChat_answer) {
		
		System.out.println("대대대대대" + xChat_no);
		System.out.println("대대대대대" + mChat_no);
		System.out.println("대대대대대" + sChat_no); 
		
		// 요청파라미터 대분류 번호 받기 받기
		String param1 = xChat_no;
		int xChat_no1 = 0;
		
		// 요청파라미터 중분류 번호 받기 받기
		String param2 = mChat_no;
		int mChat_no1 = 0;

		// 요청파라미터 소분류 번호 받기 받기
		String param3 = sChat_no;
		int sChat_no1 = 0;
		
		// null이나 ""이 아니면 int로 리턴
		if (param1 != null && !"".equals(param1)) {
			xChat_no1 = Integer.parseInt(param1);
		}
		if (param2 != null && !"".equals(param2)) {
			mChat_no1 = Integer.parseInt(param2);
		}
		if (param3 != null && !"".equals(param3)) {
			sChat_no1 = Integer.parseInt(param3);
		}
		
		SChatbot sChatbot = new SChatbot();
		sChatbot.setxChat_no(xChat_no1);
		sChatbot.setmChat_no(mChat_no1);
		sChatbot.setsChat_no(sChat_no1);
		sChatbot.setsChat_name(sChat_name);
		sChatbot.setsChat_answer(sChat_answer);
		
		// 게시글 작성
		chatbotService.InsertSchat(sChatbot);
		
		return "redirect:/admin/chatbot/list";
	}

	@RequestMapping(value = "/admin/chatbot/modify", method = RequestMethod.GET)
	public void nboardmodifyForm(SChatbot schat, Model model) {
		model.addAttribute("view", chatbotService.viewSchat(schat));
	}

	@RequestMapping(value = "/admin/chatbot/modify", method = RequestMethod.POST)
	public String nboardmodifyProc(SChatbot schat, Model model,String sChat_name, String sChat_answer) {
		schat.setsChat_name(sChat_name);
		schat.setsChat_answer(sChat_answer);
		
		// 게시글 수정
		chatbotService.updateSchat(schat);
		
		return "redirect:/admin/chatbot/list";
	}

	@RequestMapping(value = "/admin/chatbot/delete", method = RequestMethod.GET)
	public void delete(SChatbot schat, Model model) {
		chatbotService.delectSchat(schat);
		
	}

}
