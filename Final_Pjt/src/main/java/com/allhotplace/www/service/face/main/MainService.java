package com.allhotplace.www.service.face.main;

import java.util.List;

import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.util.Paging;

public interface MainService {

	int totalCount();

	List<Noticeboard> selectAll(Paging paging);

	List mainsearch();

}
