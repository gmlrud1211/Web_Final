package com.allhotplace.www.service.impl.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.allhotplace.www.dao.face.admin.BannerDao;
import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.service.face.admin.BannerService;
import com.allhotplace.www.util.Paging;

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired BannerDao banDao;

	@Override
	public int selectCntBanner() {
		return banDao.selectCntBanner();
	}

	@Override
	public List<Banner> selectPaginglist(Paging paging) {
		return banDao.selectPaginglist(paging);
	}

	@Override
	public void deleteBanner(Banner bannerDel) {
		banDao.deleteBanner(bannerDel);
	}

	@Override
	public void insertBanner(Banner bannerInsert) {
		banDao.insertBanner(bannerInsert);
	}

	@Override
	public void modifyBanner(Banner banner) {
		banDao.modifyBanner(banner);
	}
	
	@Override
	public void updateFile(Banner fileupload) {
		
	}

	@Override
	public Banner view(Banner bannerview) {
		return null;
	}



	
	
	
	
}

















