package com.allhotplace.www.controller.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allhotplace.www.controller.detail.DetailController;
import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Schedule;
import com.allhotplace.www.service.face.community.CommunityService;
import com.google.gson.Gson;

@Controller
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);

	@Autowired CommunityService communityService;
	@RequestMapping(value="/community", method=RequestMethod.GET) 
	public String communityView(Model model) {
		
		logger.info("community page view");
		
		// 공개설정된 캘린더 목록 가져오기
		List<Calendar> calendarList = new ArrayList<Calendar>();
		calendarList = communityService.getCalendarList();
		
		model.addAttribute("calendarList", calendarList);
		
		
		// 베스트 캘린더 가져오기
		List<Calendar> bestCalList = new ArrayList<Calendar>();
		bestCalList = communityService.getbestCalList();
		System.out.println(bestCalList);
		model.addAttribute("bestCalList", bestCalList);
		
		return "/community/community";
		
	}

	@RequestMapping(value="/community/detail", method=RequestMethod.GET) 
	public String communityDetail(Model model, String calNo, HttpServletRequest req) {
		
		String user_id = (String) req.getSession().getAttribute("user_id");
		
		if(user_id == null) {
			System.out.println("00000000000000000");
			System.out.println(user_id);
			System.out.println("00000000000000000");
			model.addAttribute("msg", "메시지"); 
			model.addAttribute("url", "/user/login");
			model.addAttribute("login", false);
		} else {

			model.addAttribute("login", true);
			// 조회수 증가 
			communityService.viewCntadd(calNo);
			
			// 캘린더 정보 가져오기 
			
			Calendar calendar = new Calendar();
			calendar = communityService.getCalendar(calNo);
			model.addAttribute("calendar", calendar);
			
			// 선택한 캘린더의 일정 정보 가져오기
			List<Schedule> schedule_list = communityService.getSchedule(calNo);
			model.addAttribute("schedule_list",schedule_list);
			System.out.println(schedule_list);
			
			List s_list = new ArrayList();
			
			for(Schedule s : schedule_list) {
				Map map = new HashMap();
				
				map.put("title", s.getSchedule_title());
				map.put("start", s.getSchedule_startTime());
				map.put("end", s.getSchedule_endTime());
				map.put("no", String.valueOf(s.getSchedule_no()));
	//			map.put("id", );
				map.put("resourceId", "schedule");
				
				s_list.add(map);
				
				System.out.println(s.getSchedule_startTime());
			}
			
			Gson gson = new Gson();
			req.setAttribute("s_list", gson.toJson(s_list));
			System.out.println(s_list);
			
			
			// 해당 캘린더에 대한 추천 여부 가져오기
			
			boolean isRecommend;
			
			Map map = new HashMap();
			
			map.put("user_id", user_id);
			map.put("calNo", calNo);
			
			isRecommend = communityService.isRecommend(map);
			
			model.addAttribute("isRecommend", isRecommend);
			
		}
		return "/community/commdetail";
	}

	@RequestMapping(value="/community/recommend", method=RequestMethod.POST) 
	@ResponseBody
	public int Recommend(Model model, String cal_no, String user_id, HttpServletRequest req) {
		
		Map map = new HashMap();
		
		map.put("user_id", user_id);
		map.put("cal_no", cal_no);
		
		int calRecommCnt = communityService.recommend(map);
		System.out.println(calRecommCnt);
		// 추천후 총 추천수 리턴
		//int calRecommCnt = communityService.getRecommend(cal_no);
		return calRecommCnt;
	}
	
	@RequestMapping(value="/community/recommendCancel", method=RequestMethod.POST) 
	@ResponseBody
	public int RecommendCancel(Model model, String cal_no, String user_id, HttpServletRequest req) {
		
		logger.info("cancel here!!");
		Map map = new HashMap();
		
		map.put("user_id", user_id);
		map.put("cal_no", cal_no);
		
		int calRecommCnt = communityService.recommendCancel(map);
		System.out.println(calRecommCnt);
		return calRecommCnt;
	}
}

















