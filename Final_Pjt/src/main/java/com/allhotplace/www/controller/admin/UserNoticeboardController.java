package com.allhotplace.www.controller.admin;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dao.face.admin.NoticeboardDao;
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.admin.NoticeboardService;
import com.allhotplace.www.util.Paging;

@Controller
public class UserNoticeboardController {

	@Autowired
	NoticeboardDao nboardDao;
	@Autowired
	NoticeboardService nboardService;

	private static final Logger logger = LoggerFactory.getLogger(UserNoticeboardController.class);

	@RequestMapping(value = "/noticeboard/list", method = RequestMethod.GET)
	public void boardList(Model model, HttpServletRequest req, String curPage1, HttpSession session, String word
			                ,String search) {

        try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 요청파라미터 curPage 받기
		String param = curPage1;
		int curPage = 0;

		// 검색요청파라미터 받기
		String param1 = word;

		// null이나 ""이 아니면 int로 리턴
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		if (param1 != null && !"".equals(param1)) {
			param1 = word;
		} else {
			param1 = "";
		}
		// 총 게시글 수 얻기
		int totalCount = nboardService.selectCntNboard(param1);

		// 페이지 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		paging.setSearch(param1);

		List<Noticeboard> nboardlist = nboardService.getPagingList(paging,search, param1);
		
		int pageCnt = totalCount - (curPage-1)*10 ;
		model.addAttribute("pageCnt", pageCnt);

		model.addAttribute("search", param1);
		model.addAttribute("paging", paging);
		model.addAttribute("nboardlist", nboardlist);
	}

	@RequestMapping(value = "/noticeboard/view", method = RequestMethod.GET)
	public void nboardviewForm(int notice_no, Noticeboard nboard, Model model, HttpSession session) {

		// 선택된 글번호로 글정보 불러오기
		Noticeboard boardInfo = nboardService.boardInfo(notice_no);

		String loginId = String.valueOf(session.getAttribute("id"));

		// 다음글값
		Noticeboard min = nboardService.getMaxNo(notice_no);

		// 이전글값
		Noticeboard max = nboardService.getMinNo(notice_no);
		System.out.println("min" + min);
		System.out.println("max" + max);
		model.addAttribute("loginId", loginId);
		if(max != null) {
			model.addAttribute("max_no", max.getMax_no());
			model.addAttribute("max_title", max.getMax_title());
		}
		if(min!=null) {
			model.addAttribute("min_no", min.getMin_no());
			model.addAttribute("min_title", min.getMin_title());
		}
		model.addAttribute("view", nboardService.selectNboard(nboard));
		
		
		
	}

//	view페이지 
//	댓글 등록 
//	세션으로 작성자 정보 삽입 
//	hidden으로 boardno 가져오기
	@RequestMapping(value = "/noticeboard/view", method = RequestMethod.POST)
	public String nboardview(int board_no, Noticeboard board, Model model, HttpSession session) {

		String loginId = String.valueOf(session.getAttribute("id"));


		// loginId를 이용해 댓글 등록할 때 필요한 닉네임 아이디 넣기
//		Member member = memberService.getMemberByid(loginId);

//		comment.setBoard_no(board_no);
//		comment.setWriter_id(member.getId());
//		comment.setWriter_nick(member.getNick());
//		
		// 댓글 등록 
//		boardService.commentInsert(comment);

		return "redirect:/noticeboard/view?board_no=" + board_no;
	}

	

}
