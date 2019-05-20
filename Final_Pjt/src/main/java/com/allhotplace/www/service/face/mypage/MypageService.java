package com.allhotplace.www.service.face.mypage;


import java.util.List;

import com.allhotplace.www.dto.Bookmark;
import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.Schedule;
import com.allhotplace.www.dto.Users;

public interface MypageService {

	//로그인 한 회원정보 조회
	public Users viewUserInfo(String user_id);

	//회원정보 업뎃
	public void updateInfo(Users user);

	//로그인 한 회원의 캘린더 리스트조회
	public List<Calendar> viewUserCalendarList(String user_id);

	//캘린더 등록
	public void addCalendar(String user_id, Calendar cal);

	//선택한 캘린더삭제
	public void removeCalendar(int calendar_no);

	//로그인 한 회원의 찜 리스트조회
	public List<Bookmark> getBookmarkList(String user_id);

	//찜한 일정 삭제
	public void deleteBookmark(int bookmark_no);

	//선택한 캘린더-일정조회하기  
	public List<Schedule> viewSchedule(int calendar_no);

	//선택한 일정 삭제
	public int deleteSchedule(int schedule_no);

	//캘린더 공개여부 체크
	public int isOpenCheck(int calendar_no);

	//캘린더 공개여부 설정 - 공개로 변경
	public void calChangeYes(int calendar_no);

	//캘린더 공개여부 설정 - 비공개로 변경
	public void calChangeNo(int calendar_no);

}
