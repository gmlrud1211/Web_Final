package com.allhotplace.www.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dao.face.admin.DashboardDao;
import com.allhotplace.www.service.face.admin.DashboardService;

@Controller
public class DashboardController {
	
	@Autowired ServletContext context;
	@Autowired DashboardDao dboardDao;
	@Autowired DashboardService dboardSer;

	private static final Logger logger = LoggerFactory.getLogger(DashboardController.class);

	@RequestMapping(value = "/admin/dashboard/list", method = RequestMethod.GET)
	public void newUser(Model model, String word, String search) {
		
		int calno = dboardSer.getCalendarNo();
		
		int calyes = dboardSer.getCalendarYes();
		
		int newuser = dboardSer.getNewUser();
		
		Map count = new HashMap();
		count.put("calno", calno);
		count.put("calyes", calyes);
		count.put("newuser", newuser);
		
		model.addAllAttributes(count);
	}

}