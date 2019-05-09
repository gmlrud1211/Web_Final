package com.allhotplace.www.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.allhotplace.www.dao.face.admin.VisitorsDao;
import com.allhotplace.www.dto.Visitors;

@Controller
public class SessionListenerController implements HttpSessionListener {

	@Autowired VisitorsDao visitDao;

	public SessionListenerController() {
		
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {

		// 세션이 새로 생성되면 execute() 실행한다.
		if (se.getSession().isNew()) {
			execute(se);
		}
	}

	@RequestMapping(value = "/admin/dashboard/list", method = RequestMethod.GET)
	public void execute(HttpSessionEvent se) {


		int todayCount = 0;
		int totalCount = 0;

		try {
			HttpSession session = se.getSession();

			// 전체 방문자 수 +1
			visitDao.setVisitTotalCount();

			// 오늘 방문자 수
			todayCount = visitDao.getVisitTodayCount();

			// 전체 방문자 수
			totalCount = visitDao.getVisitTotalCount();


////		Visitors visit = new Visitors();
////		visit.setVisit_count(todayCount);
////		visit.setVisit_totCount(totalCount);
//
//			// 세션 속성에 담아준다.
//			session.setAttribute("totalCount", totalCount); // 전체 방문자 수
//			session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
//
		} catch (Exception e) {
			System.out.println("===== 방문자 카운터 오류 =====\n");
			e.printStackTrace();
		}
		
//	     HttpSession session = se.getSession();
//         WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
//         //등록되어있는 빈을 사용할수 있도록 설정해준다
////          req = (() RequestContextHolder.currentRequestAttributes()).getRequest();
//         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
//         VisitorsDao visitDao = (VisitorsDao)wac.getBean("VisitorsDao");
//         Visitors vo = new Visitors();
//    
//         visitDao.setVisitTotalCount();

	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

	}

}
