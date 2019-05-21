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
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.admin.ChatoneService;
import com.allhotplace.www.util.Paging;

@Controller
public class ChatoneController {

	@Autowired
	 ChatoneService chatoneService;

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

	@RequestMapping(value = "/admin/chatone/view", method = RequestMethod.GET)
	public void nboardviewForm(int notice_no, Noticeboard nboard, Model model, HttpSession session) {

		// 선택된 글번호로 글정보 불러오기
//		Chatroom boardInfo = chatoneService.boardInfo(notice_no);

//		String loginId = String.valueOf(session.getAttribute("id"));
//		String boardId = boardInfo.getWriter_id();

//		nboard.setBoard_no(board_no);
//		nboard.setWriter_id(loginId);

//		boolean check = nboardService.selectgood(board);

//		System.out.println("로그인 아이디" + loginId);
//		System.out.println("로그인 아이디" + boardId);

//		if(loginId.equals(boardId)) {
//			session.setAttribute("myboard", true);
//		} else {
//			session.setAttribute("myboard", false);
//		}

//		model.addAttribute("check" , check);

//		model.addAttribute("loginId", loginId);
//		model.addAttribute("boardId" , boardId);
//		model.addAttribute("view", nboardService.selectNboard(nboard));
	}

//	view페이지 
//	댓글 등록 
//	세션으로 작성자 정보 삽입 
//	hidden으로 boardno 가져오기
	@RequestMapping(value = "/admin/chatone/view", method = RequestMethod.POST)
	public String nboardview(int board_no, Noticeboard board, Model model, HttpSession session) {

		String loginId = String.valueOf(session.getAttribute("id"));
		System.out.println(board_no);

		// loginId를 이용해 댓글 등록할 때 필요한 닉네임 아이디 넣기
//		Member member = memberService.getMemberByid(loginId);

//		comment.setBoard_no(board_no);
//		comment.setWriter_id(member.getId());
//		comment.setWriter_nick(member.getNick());
//		
		// 댓글 등록 
//		boardService.commentInsert(comment);

		return "redirect:/admin/chatone/view?board_no=" + board_no;
	}

	@RequestMapping(value = "/admin/chatone/write", method = RequestMethod.GET)
	public String write(Model model, HttpSession session) {

		return "/admin/noticeboard/write";

	}

	@RequestMapping(value = "/admin/chatone/write", method = RequestMethod.POST)
	public String write(Noticeboard nboard, Model model, HttpSession session) {

//		Member mem = nboardDao.selectByUserid(String.valueOf(session.getAttribute("id")));
//
//		nboard.setWriter_id(mem.getId());		
//		nboard.setWriter_nick(mem.getNick());

		// 게시글 작성
//		nboardService.writeNboard(nboard);
		return "redirect:/admin/chatone/list";
	}


	@RequestMapping(value = "/admin/chatone/delete", method = RequestMethod.GET)
	public void delete(Noticeboard nboard, Model model) {
//		nboardService.deleteNboard(nboard);
	}

}
