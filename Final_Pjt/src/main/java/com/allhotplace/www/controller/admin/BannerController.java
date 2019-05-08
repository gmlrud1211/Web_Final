package com.allhotplace.www.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.allhotplace.www.dao.face.admin.BannerDao;
import com.allhotplace.www.dao.face.admin.FileDao;
import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.dto.Fileupload;
import com.allhotplace.www.service.face.admin.BannerService;
import com.allhotplace.www.util.Paging;



@Controller
public class BannerController {
	
	@Autowired ServletContext context; 
	@Autowired BannerDao banDao;
	@Autowired BannerService banService;
	@Autowired FileDao fileDao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BannerController.class);

	@RequestMapping(value="/admin/banner/list", method=RequestMethod.GET)
	public void fileForm(String curPage, Model model) {
	//요청파라미터 curPage 받기
	String param = curPage;
	int curPage1 = 0;
	
	System.out.println(curPage);
	// 검색요청파라미터 받기 
//	    String param1 = word;
	
//		null이나 ""이 아니면 int로 리턴
	if( param != null && !"".equals(param) ) {
		curPage1 = Integer.parseInt(param);
	}
	
//		if( param1 != null && !"".equals(param1) ) {
//			param1 = word;
//		}else {
//			param1="";
//		}
	
	//총 게시글 수 얻기
	int totalCount = banService.selectCntBanner();
	
	//페이지 객체 생성
	Paging paging = new Paging(totalCount, curPage1);
//		paging.setSearch(param1);
	
	List<Banner> banlist = banService.selectPaginglist(paging);
	System.out.println("값"+totalCount);
	
//		model.addAttribute("search", param1);
	System.out.println(banlist);
	
	model.addAttribute("paging", paging);
	model.addAttribute("banlist", banlist);
	}
	
	@RequestMapping(value="/admin/banner/list", method=RequestMethod.POST)
	public String fileupload( String curPage, Model model) {
		return null;
	}
		
	
	@RequestMapping(value="/admin/banner/fileup", method=RequestMethod.GET)
	public void bannerfileForm() {}
	
	@RequestMapping(value="/admin/banner/fileup", method=RequestMethod.POST)
	public String bannerfileupload(MultipartFile file,
			Fileupload upFile, Model model, HttpServletResponse resp) {
		
		// 고유 식별자 
		String uId = UUID.randomUUID().toString().split("-")[0];
		
		//저장될 파일 이름
		String stored_name = null;
		stored_name = file.getOriginalFilename()+"_"+uId;
		

		// 파일 저장 경로
		String path = context.getRealPath("upload");
		
		// 저장될 파일 
		File dest = new File(path,stored_name);
		
		// 파일 업로드 
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		upFile.setFile_name(file.getOriginalFilename());
		upFile.setFile_storedName(stored_name);
		
		logger.info(file.toString());
		
		// DB에 파일 저장
		banDao.insertFile(upFile);
		
		//파일정보를 부모창에 전달하며 팝업닫기
		resp.setCharacterEncoding("UTF-8");
		try {
			resp.getWriter().print(""
					+ "<html>"
					+ "<head><meta charset=\"UTF-8\">"
					+ "</head>"
					+ "<script type='text/javascript'>"
					+ "window.onload = function() {"
					+ "opener.sendData("+upFile.getFile_no()+",'"+upFile.getFile_name()+"'); "
					+ " window.close();}"
					+ "</script></html>");
		} catch (IOException e) {
			System.out.println("전달 실패 !!!!!!");
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/admin/banner/updatefileup", method=RequestMethod.GET)
	public void bannerupdatefileForm() {
		
	}
	
	@RequestMapping(value="/admin/banner/updatefileup", method=RequestMethod.POST)
	public String bannerupdatefile(MultipartFile file,
			Fileupload upFile, Model model, HttpServletResponse resp) {
		
		// 고유 식별자 
		String uId = UUID.randomUUID().toString().split("-")[0];
		
		//저장될 파일 이름
		String stored_name = null;
		stored_name = file.getOriginalFilename()+"_"+uId;
		

		// 파일 저장 경로
		String path = context.getRealPath("upload");
		
		// 저장될 파일 
		File dest = new File(path,stored_name);
		
		// 파일 업로드 
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		upFile.setFile_name(file.getOriginalFilename());
		upFile.setFile_storedName(stored_name);
		
		logger.info(file.toString());
		
		// DB에 파일 저장
		banDao.updateFile(upFile);
		
		//파일정보를 부모창에 전달하며 팝업닫기
		resp.setCharacterEncoding("UTF-8");
		try {
			resp.getWriter().print(""
					+ "<html>"
					+ "<head><meta charset=\"UTF-8\">"
					+ "</head>"
					+ "<script type='text/javascript'>"
					+ "window.onload = function() {"
					+ "opener.sendData("+upFile.getFile_no()+",'"+upFile.getFile_name()+"'); "
					+ " window.close();}"
					+ "</script></html>");
		} catch (IOException e) {
			System.out.println("전달 실패 !!!!!!");
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/admin/banner/write" , method=RequestMethod.GET)
	public void bannerwrite(Model model, HttpSession session, HttpServletRequest req) {
	
	}
	
	@RequestMapping(value="/admin/banner/write" , method=RequestMethod.POST)
	public String bannerwrite(Banner banner , Model model, HttpSession session, HttpServletRequest req) {
		
		String title = req.getParameter("title");
		System.out.println("배너명 ===  ====" + title);
		
		String filenoParam = req.getParameter("file_no");
		System.out.println("파일넘버 ===  ====" + req.getParameter("file_no"));
		int file_no = -1;

		if (filenoParam != null && !"".equals(filenoParam)) {
			file_no = Integer.parseInt(filenoParam);
			System.out.println("file_no:" + file_no);

		}
		System.out.println("구하기 : " + file_no);
		
		// 배너 정보 입력
		Banner ban = new Banner();
		ban.setFile_no(file_no);
		ban.setBanner_name(title);
		
		banService.insertBanner(ban);
		
		return "redirect:/admin/banner/list";
	}
	
	
	@RequestMapping(value="/admin/banner/delete" , method=RequestMethod.GET)
	public void delete(Banner banner, Model model) {
		banService.deleteBanner(banner);
	}
	
	
	@RequestMapping(value="/admin/banner/modify" , method=RequestMethod.GET)
	public void bannermodify(Banner banner, Model model, HttpSession session, HttpServletRequest req ) {
		Banner bannerview = banDao.view(banner);
		model.addAttribute("bannerview", bannerview);
	}
	
	@RequestMapping(value="/admin/banner/modify" , method=RequestMethod.POST)
	public String bannermodify(Banner banner, Model model, HttpServletRequest req) {
		
		String banner_name = req.getParameter("banner_name");
		System.out.println("배너명 ===  ====" + banner_name);
		
		String filenoParam = req.getParameter("file_no");
		System.out.println("파일넘버 ===  ====" + req.getParameter("file_no"));
		int file_no = -1;

		if (filenoParam != null && !"".equals(filenoParam)) {
			file_no = Integer.parseInt(filenoParam);
			System.out.println("file_no:" + file_no);

		}
		System.out.println("구하기 : " + file_no);
		
		// 배너 정보 입력
		Banner ban = new Banner();
		ban.setFile_no(file_no);
		ban.setBanner_name(banner_name);
		
		banService.modifyBanner(banner);
		
		return "redirect:/admin/banner/list";
	}


}
