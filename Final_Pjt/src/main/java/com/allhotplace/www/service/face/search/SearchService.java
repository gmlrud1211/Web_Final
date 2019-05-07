package com.allhotplace.www.service.face.search;

import java.util.List;
import java.util.Map;

public interface SearchService {
	
	public List getContentType();

	public List getAreaList();

	public List getMunicipality(String areaSelect);
	
	public List getBigCategory(String selectedType);

	public List getSubCategory(Map<String, String> map);

	public List getSmallCategory(Map<String, String> map);

}
