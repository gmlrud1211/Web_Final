package com.allhotplace.www.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.allhotplace.www.dao.face.admin.AdminUserDao;
import com.allhotplace.www.dto.Users;
import com.allhotplace.www.service.face.admin.AdminUserService;
import com.allhotplace.www.util.Paging;

@Controller
public class AdminUserController {

	@Autowired
	ServletContext context;
	@Autowired
	AdminUserDao aduserDao;
	@Autowired
	AdminUserService aduserService;

	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);

	@RequestMapping(value = "/admin/user/list", method = RequestMethod.GET)
	public void userlistForm(String curPage1, Model model, String word, String search) {
		// 요청파라미터 curPage 받기
		String param = curPage1;
		int curPage = 0;

		// 검색요청파라미터 받기
		String param1 = word;
		String param2 = search;

//			null이나 ""이 아니면 int로 리턴
		if (param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}

		if (param1 != null && !"".equals(param1)) {
			param1 = word;
		} else {
			param1 = "";
		}


		// 총 회원 수 얻기
		int totalCount = aduserService.selectCntUser();

		// 페이지 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		paging.setSearch(param1);

		List<Users> userlist = aduserService.selectPaginglist(paging,search, param1);
		System.out.println("값" + totalCount);

		model.addAttribute("search", param1);
		System.out.println(userlist);

		model.addAttribute("paging", paging);
		model.addAttribute("userlist", userlist);
	}

	@RequestMapping(value = "/admin/user/view", method = RequestMethod.GET)
	public void userviewForm(Users user, String curPage, Model model) {

		Users userview = aduserService.selectUser(user);
		model.addAttribute("userview", userview);
	}

	@RequestMapping(value = "/admin/user/view", method = RequestMethod.POST)
	public void userview(String curPage, Model model) {
	}

	@RequestMapping(value = "/admin/user/delete", method = RequestMethod.GET)
	public void userdeleteForm(Users user, String curPage, Model model) {

		aduserDao.deleteUser(user);
	}

}
