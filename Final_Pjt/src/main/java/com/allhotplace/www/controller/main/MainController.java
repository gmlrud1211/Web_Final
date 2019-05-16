package com.allhotplace.www.controller.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.service.face.admin.BannerService;
import com.allhotplace.www.service.face.main.MainService;



@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MainService mainservice;
	@Autowired BannerService banservice;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void Main(Model model) {
		
		List<Banner> banlist =  banservice.selectBanerlist();
		
		model.addAttribute("banlist", banlist);
		
	}

	@RequestMapping("/mainsearch")
	public void Mainsearch() { 

	}
}