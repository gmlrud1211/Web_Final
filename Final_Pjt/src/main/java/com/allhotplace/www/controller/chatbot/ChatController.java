package com.allhotplace.www.controller.chatbot;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dao.face.chatbot.ChatBotDao;
import com.allhotplace.www.dto.JChatbot;
import com.allhotplace.www.dto.MChatbot;
import com.allhotplace.www.dto.SChatbot;
import com.allhotplace.www.dto.XChatbot;
import com.allhotplace.www.service.face.chatbot.ChatBotService;

@Controller
public class ChatController {
	
	@Autowired ChatBotService chatBotService;
	@Autowired ChatBotDao chatBotDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	

	//梨꾪똿ajax
	@RequestMapping(value="/chatAjax", method=RequestMethod.POST)
	public String chatAjax(Model model, String content1, HttpSession session) {
		
		logger.info(content1);
		
		//梨꾪똿?낅젰媛믪쑝濡?吏덈Ц紐⑸줉 遺덈윭?ㅺ린
		List<JChatbot> replyContent = chatBotService.reply(content1);
		logger.info(replyContent.toString());
		
		if(content1.isEmpty()) {
			model.addAttribute("reply", "?щ컮瑜?硫붿떆吏瑜?蹂대궡二쇱꽭??");
		} else if(!content1.isEmpty()){
			
			if(replyContent.isEmpty()) {
				model.addAttribute("reply", "議고쉶??寃곌낵媛 ?놁뒿?덈떎.");
			} else {
				model.addAttribute("reply", replyContent);
			}
		}
		
		
		//?몄뀡?쇰줈 濡쒓렇?명븳 ?꾩씠??媛?몄샂
		String userid = (String) session.getAttribute("user_id");
		model.addAttribute("login", !userid.equals(null));
		
		//濡쒓렇?명뻽?꾨븣
		if(!userid.equals(null)) {
			model.addAttribute("userid", session.getAttribute("user_id"));
			model.addAttribute("content1", content1);
			
		//濡쒓렇???덊뻽?꾨뻹
		}else {
			return "jsonView";
		}
		
//		model.addAttribute("reply", replyContent);
//		logger.info(replyContent.getsChat_answer());
		
		return "jsonView";
	}
	
	//吏덈Ц由ъ뒪???遺꾨쪟)ajax
	@RequestMapping(value="/chatAjax_ansList")
	public String chatAjax_ansList(Model model) {
		
		logger.info("AJAX 吏덈Ц由ъ뒪??遺덈윭?ㅺ린");
		
		
		List<XChatbot> xlist = chatBotDao.selectAnswerListAll();
		logger.info(xlist.toString());
		
		model.addAttribute("xlist", xlist);
		
		return "jsonView";
	}
	
	//吏덈Ц?낅젰(?遺꾨쪟) -> ?섏쐞吏덈Ц異쒕젰(以묐텇瑜? ajax
	@RequestMapping(value="/chatAjax_XChatList", method=RequestMethod.POST)
	public String chatAjax_XChatList(Model model, HttpSession session, int a) {
		
		logger.info("AJAX ?遺꾨쪟 踰꾪듉 ?대┃");
		
		model.addAttribute("userid", session.getAttribute("user_id"));
		
		List<XChatbot> xlist = chatBotDao.selectAnswerListAll();
		logger.info(xlist.toString());
		
		model.addAttribute("xlist", xlist);
		
		System.out.println("$(\"btnXChatList\") : "+a);
		
		List<MChatbot> mlist = chatBotDao.selectMAnswerListByXno(a);
		logger.info(mlist.toString());
		
		model.addAttribute("mlist", mlist);
		
		return "jsonView";
	}
	
	//吏덈Ц?낅젰(以묐텇瑜? -> ?섏쐞吏덈Ц異쒕젰(?뚮텇瑜? ajax
	@RequestMapping(value="/chatAjax_MChatList", method=RequestMethod.POST)
	public String chatAjax_MChatList(Model model, HttpSession session, int a) {
		
		logger.info("AJAX 以묐텇瑜?踰꾪듉 ?대┃");
		
		model.addAttribute("userid", session.getAttribute("user_id"));
		
		List<MChatbot> mlist = chatBotDao.selectMAnswerListAll();
		logger.info(mlist.toString());
		
		model.addAttribute("mlist", mlist);
		
		System.out.println("$(\"btnMChatList\") : "+a);
		
		List<SChatbot> slist = chatBotDao.selectSAnswerListByMno(a);
		logger.info(slist.toString());
		
		model.addAttribute("slist", slist);
		
		return "jsonView";
	}
	
	//吏덈Ц?낅젰(?뚮텇瑜? -> ?섏쐞吏덈Ц異쒕젰(?뚮텇瑜??듬?) ajax
	@RequestMapping(value="/chatAjax_SChatList", method=RequestMethod.POST)
	public String chatAjax_SChatList(Model model, HttpSession session, int a) {
		
		logger.info("AJAX ?뚮텇瑜?踰꾪듉 ?대┃");
		
		model.addAttribute("userid", session.getAttribute("user_id"));
		
		List<SChatbot> slist = chatBotDao.selectSAnswerListAll();
		logger.info(slist.toString());
		
		model.addAttribute("slist", slist);
		
		SChatbot slistAnswer = chatBotDao.selectSAnswerBySno(a);
		logger.info(slistAnswer.toString());
		
		model.addAttribute("answer", slistAnswer);
		
		return "jsonView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
