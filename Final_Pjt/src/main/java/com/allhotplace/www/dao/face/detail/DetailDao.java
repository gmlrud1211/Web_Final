package com.allhotplace.www.dao.face.detail;

import java.util.List;

import com.allhotplace.www.dto.Calendar;
import com.allhotplace.www.dto.DetailCalendar;

public interface DetailDao {

	List<DetailCalendar> getCalendar(String user_id);

}
