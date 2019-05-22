package com.allhotplace.www.controller.admin;

import java.io.UnsupportedEncodingException;
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

import com.allhotplace.www.dto.Chatroom;
import com.allhotplace.www.dto.Chattalk;
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.admin.ChatoneService;
import com.allhotplace.www.util.Paging;

@Controller
public class ChatoneController {

	@Autowired ChatoneService chatoneService;

	private static final Logger logger = LoggerFactory.getLogger(ChatoneController.class);

	@RequestMapping(value = "/admin/chatone/list", method = RequestMethod.GET)
	public void boardList(Model model, HttpServletRequest req, String curPage1, HttpSession session) {

        try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 요청파라미터 curPage 받기
		String param = curPage1;
		int curPage = 0;

//		// 검색요청파라미터 받기
//		String param1 = word;

		// null이나 ""이 아니면 int로 리턴
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
//		if (param1 != null && !"".equals(param1)) {
//			param1 = word;
//		} else {
//			param1 = "";
//		}
		// 총 게시글 수 얻기
		int totalCount = chatoneService.selectCntChatroom();

		// 페이지 객체 생성
		Paging paging = new Paging(totalCount, curPage);
//		paging.setSearch(param1);

		List<Chatroom> chatonelist = chatoneService.getPagingList(paging);
		System.out.println("값" + totalCount);

//		model.addAttribute("search", param1);

		model.addAttribute("paging", paging);
		model.addAttribute("chatonelist", chatonelist);
	}

	
	@RequestMapping(value = "/resultChatList", method = RequestMethod.GET)
	public String resultChatList(HttpSession session, Model model) {
		
		int chatroom_idx = (int)session.getAttribute("chatroom_idx");
		
		List<Chattalk> chatoneList = chatoneService.getChatlist(chatroom_idx);
		
	    model.addAttribute("chatoneList",chatoneList);
		
		return "jsonView";
	}

}
