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

	}

	@RequestMapping(value = "/admin/chatbot/write", method = RequestMethod.POST)
	public String write(SChatbot schat, Model model, HttpSession session) {
		// 게시글 작성
		chatbotService.InsertSchat(schat);
		return "redirect:/admin/chatbot/list";
	}

	@RequestMapping(value = "/admin/chatbot/modify", method = RequestMethod.GET)
	public void nboardmodifyForm(SChatbot schat, Model model) {
		model.addAttribute("view", chatbotService.viewSchat(schat));
	}

	@RequestMapping(value = "/admin/chatbot/modify", method = RequestMethod.POST)
	public String nboardmodifyProc(SChatbot schat, Model model) {
		// 게시글 수정
		chatbotService.updateSchat(schat);
		return "redirect:/admin/chatbot/list";
	}

	@RequestMapping(value = "/admin/chatbot/delete", method = RequestMethod.GET)
	public void delete(SChatbot schat, Model model) {
		chatbotService.delectSchat(schat);
	}

}
