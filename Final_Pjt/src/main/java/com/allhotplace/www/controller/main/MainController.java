package com.allhotplace.www.controller.main;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dao.face.admin.NoticeboardDao;
import com.allhotplace.www.dto.Banner;
import com.allhotplace.www.dto.Noticeboard;
import com.allhotplace.www.service.face.admin.BannerService;
import com.allhotplace.www.service.face.admin.NoticeboardService;
import com.allhotplace.www.service.face.main.MainService;
import com.allhotplace.www.util.Paging;



@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	public static final String APP_KEY = "xjgpEu7EyCrud6P0thfB9ktQ22Sfu8%2B12aVpSAOau8gHvdLeIP79PSvVvZMPxcOqBe1nNS2LBhVQCFrDJ144LA%3D%3D";

	@Autowired MainService mainservice;
	@Autowired BannerService banservice;
	
	@Autowired
	NoticeboardDao nboardDao;
	@Autowired
	NoticeboardService nboardService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void Main(Model model, String curPage1) {
		
		List<Banner> banlist =  banservice.selectBanerlist();
		
		model.addAttribute("banlist", banlist);
		
		// 요청파라미터 curPage 받기
				String param = curPage1;
				int curPage = 0;

				// null이나 ""이 아니면 int로 리턴
				if (param != null && !"".equals(param)) {
					curPage = Integer.parseInt(param);
				}
			
				// 총 게시글 수 얻기
				int totalCount = nboardService.selectCntMainNboard();

				// 페이지 객체 생성
				Paging paging = new Paging(totalCount, curPage);

				List<Noticeboard> nboardlist = nboardService.selectList(paging);
				
				int pageCnt = totalCount - (curPage-1)*10 ;
				model.addAttribute("pageCnt", pageCnt);

				model.addAttribute("paging", paging);
				model.addAttribute("mainnboardlist", nboardlist);
		
		
	}
	@RequestMapping(value="/main", method=RequestMethod.POST)
	public String Mainpost() {
		
		
		return "redirect:/mainsearch";
	}

	
	@RequestMapping(value="/mainsearch", method=RequestMethod.GET)
	public void mainSearch() {
		
		
	}
	
	@RequestMapping(value="/mainsearch", method=RequestMethod.POST)
	public List mainSearchPost(String word,Model model) {
		
		
		String result = "";
		BufferedReader br = null;
		JSONArray rowData = new JSONArray();
		List placeList = new ArrayList();
	
		try {
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="
					+ APP_KEY	// 인증키 
					+ "&_type=json&"
					+ "keyword="
					+ word
					+ "&MobileOS=ETC"	// OS 구분 :: IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC
					+ "&listYN=Y"	// 목록 구분 :: 목록 구분 (Y=목록, N=개수)
					+ "&MobileApp=KH_Hotplace"	// 서비스 명
					+ "&arrange=A"	// 정렬구분 (A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)
					+ "&numOfRows=30"	// 한 페이지 결과 수 
					+ "&pageNo=1";	// 현재페이지번호
			
			
			System.out.println("urlstr ::: " + urlstr );

			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line;
			}
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
			JSONObject jsonResonse = (JSONObject)jsonObj.get("response");
			JSONObject jsonHeader = (JSONObject)jsonResonse.get("header");
			JSONObject jsonBody = (JSONObject)jsonResonse.get("body");
			JSONObject jsonItems = (JSONObject)jsonBody.get("items");
			JSONArray jsonItemArray = (JSONArray)jsonItems.get("item");

			String resultCode = (String) jsonHeader.get("resultCode");
			System.out.println("resultCode : " +resultCode);
			// API 수신상태 정상(0000) 인 경우에 데이터 가져오기 
			
			if ("0000".equals(resultCode)) {
				for(int i=0; i<jsonItemArray.size(); i++) {
					JSONObject obj = (JSONObject)jsonItemArray.get(i);
					System.out.println("obj  : " + obj); // 여기까지 옴
					String str = String.valueOf(obj);
					placeList.add(str);
					System.out.println("placeList 1111 : " + placeList);
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("placeList 22222 : " + placeList);
		return placeList;
	}
}
	
	

