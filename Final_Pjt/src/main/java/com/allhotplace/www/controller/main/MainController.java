package com.allhotplace.www.controller.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.main.MainService;
import com.allhotplace.www.util.Paging;

import dto.board.ban.Ban;
import util.Serachword;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired MainService mainservice;
	
	@RequestMapping("/main")
	public String Main() {
		
		return "/main";
		
	}

	@RequestMapping("/mainsearch")
	public void Mainsearch(@RequestParam(defaultValue="title")) { 

	}
}