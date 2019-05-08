package com.allhotplace.www.dao.face.search;

import java.util.List;
import java.util.Map;

public interface SearchDao {

	public List getContentType();

	public List getAreaList();

	public List getBigCategory(String selectedType);

	public List getMunicipality(String areaSelect);

	public List getSubCategory(String cateNum, String selectedType);

	public List getSubCategory(Map<String, String> map);

	public List getSmallCategory(Map<String, String> map);


}
