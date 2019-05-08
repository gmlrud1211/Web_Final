package com.allhotplace.www.controller.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.allhotplace.www.service.face.main.MainService;



@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@Autowired MainService mainservice;
	
	@RequestMapping("/main")
	public void Main() {
		
		
		
	}

	@RequestMapping("/mainsearch")
	public void Mainsearch() { 

	}
}