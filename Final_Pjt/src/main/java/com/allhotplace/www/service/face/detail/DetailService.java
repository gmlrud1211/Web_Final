package com.allhotplace.www.service.face.detail;

import java.util.List;

import com.allhotplace.www.dto.DetailCalendar;

public interface DetailService {

	List<DetailCalendar> getCalendar(String user_id);

}
