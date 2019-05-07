package com.allhotplace.www.service.impl.search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.search.SearchDao;
import com.allhotplace.www.service.face.search.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired SearchDao searchDao;
	
	@Override	
	public List getContentType() {
		List contentType = searchDao.getContentType();
		return contentType;
	}

	@Override
	public List getAreaList() {
		List areaList = searchDao.getAreaList();
		return areaList;
	}

	@Override
	public List getMunicipality(String areaSelect) {
		List Municipality = searchDao.getMunicipality(areaSelect);
		return Municipality;
	}
	
	@Override
	public List getBigCategory(String selectedType) {
		List bigCategory = searchDao.getBigCategory(selectedType);
		return bigCategory;
	}

	@Override
	public List getSubCategory(Map<String, String> map) {
		List subCategory = searchDao.getSubCategory(map);
		return subCategory;
	}

	@Override
	public List getSmallCategory(Map<String, String> map) {
		List smallCategory = searchDao.getSmallCategory(map);
		return smallCategory;
	}


}
