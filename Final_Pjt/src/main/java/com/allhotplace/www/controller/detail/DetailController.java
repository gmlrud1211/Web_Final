package com.allhotplace.www.controller.detail;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.allhotplace.www.dto.DetailResult;

@Controller
public class DetailController {

private static final Logger logger = LoggerFactory.getLogger(DetailController.class);
	
	public static final String APP_KEY = "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D";

	//@Autowired DetailService detailService;
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	
	public String placeInfoAPI(Model model, String contentId, String contentTypeId) {

		String result = "";
		BufferedReader br = null;
		String result2 = "";
		BufferedReader br2 = null;
		String result3 = "";
		BufferedReader br3 = null;
		String result4 = "";
		BufferedReader br4 = null;
		
		List<DetailResult> imgList = new ArrayList<DetailResult>();
		List<DetailResult> commonList = new ArrayList<DetailResult>();
		List<DetailResult> introList = new ArrayList<DetailResult>();
		List<DetailResult> infoList = new ArrayList<DetailResult>();
		
/*		
		상세페이지 관련 API 4EA
		String detailImage = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&imageYN=Y&MobileOS=ETC&MobileApp=AppTest";
		String detailCommon = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTest";
		String detailIntro = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&contentTypeId=15&MobileOS=ETC&MobileApp=AppTest";
		String detailInfo = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&contentTypeId=15&MobileOS=ETC&MobileApp=AppTest";
*/
		
		try {
			
			// 이미지 API 연동 영역  (detailImage) 시작
			String detailImage = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?_type=json"
					+ "&ServiceKey="
					+ APP_KEY
					+ "&contentId="
					+ contentId
					+ "&imageYN=Y"
					+ "&MobileOS=ETC"
					+ "&MobileApp=KH_Hotplace";
			
			
			URL url = new URL(detailImage);
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
			if ("0000".equals(resultCode)) {
				for(int i=0; i<jsonItemArray.size(); i++) {
					JSONObject obj = (JSONObject)jsonItemArray.get(i);
					
					DetailResult data = new DetailResult();
					
					System.out.println(obj);
					
					data.setOriginimgurl(String.valueOf(obj.get("originimgurl")));
					data.setSmallimageurl(String.valueOf(obj.get("smallimageurl")));
					
					imgList.add(data);
				}
			}

			// 이미지 API 연동 영역  (detailImage) 끝
 

			// 기본정보 API 연동 영역  (detailCommon) 시작
			
			String detailCommon = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?_type=json&"
					+ "ServiceKey="
					+ APP_KEY
					+ "&contentId="
					+ contentId
					+ "&defaultYN=Y&"
					+ "addrinfoYN=Y"
					+ "&overviewYN=Y&MobileOS=ETC&MobileApp=KH_Hotplace";

			System.out.println("detailCommon : " + detailCommon);
			URL url2 = new URL(detailCommon);
			HttpURLConnection urlconnection2 = (HttpURLConnection) url2.openConnection();
			urlconnection2.setRequestMethod("GET");
			br2 = new BufferedReader(new InputStreamReader(urlconnection2.getInputStream(), "UTF-8"));
			
			String line2;
			while ((line2 = br2.readLine()) != null) {
				result2 = result2 + line2;
			}
			
			JSONParser jsonParser2 = new JSONParser();
			JSONObject jsonObj2 = (JSONObject)jsonParser2.parse(result2);
			JSONObject jsonResonse2 = (JSONObject)jsonObj2.get("response");
			JSONObject jsonHeader2 = (JSONObject)jsonResonse2.get("header");
			JSONObject jsonBody2 = (JSONObject)jsonResonse2.get("body");
			JSONObject jsonItems2 = (JSONObject)jsonBody2.get("items");
			JSONObject jsonItemArray2 = (JSONObject)jsonItems2.get("item");
			
			String resultCode2 = (String) jsonHeader2.get("resultCode");

			if ("0000".equals(resultCode2)) {
				
				JSONObject obj = jsonItemArray2;
	
				DetailResult data = new DetailResult();
	
				data.setAddr1(String.valueOf(obj.get("addr1")));
				data.setAddr2(String.valueOf(obj.get("addr2")));
				data.setTitle(String.valueOf(obj.get("title")));
				data.setTelname(String.valueOf(obj.get("telname")));
				data.setTel(String.valueOf(obj.get("tel")));
				data.setHomepage(String.valueOf(obj.get("homepage")));
				data.setOverview(String.valueOf(obj.get("overview")));
				data.setZipcode(String.valueOf(obj.get("zipcode")));
				System.out.println("data : " + data);
				commonList.add(data);
				
			}
			
			// 기본정보 API 연동 영역  (detailCommon) 끝
			
			
			// 기본정보 API 연동 영역  (detailIntro) 시작
			
			String detailIntro = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?_type=json"
					+ "&ServiceKey="
					+ "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D"
					+ "&contentId="
					+ contentId
					+ "&contentTypeId="
					+ contentTypeId
					+ "&MobileOS=ETC&MobileApp=KH_Hotplace";

			System.out.println("detailIntro : " + detailIntro);
			URL url3 = new URL(detailIntro);
			HttpURLConnection urlconnection3 = (HttpURLConnection) url3.openConnection();
			urlconnection3.setRequestMethod("GET");
			br3 = new BufferedReader(new InputStreamReader(urlconnection3.getInputStream(), "UTF-8"));
			
			String line3;
			while ((line3 = br3.readLine()) != null) {
				result3 = result3 + line3;
			}
			
			JSONParser jsonParser3 = new JSONParser();
			JSONObject jsonObj3 = (JSONObject)jsonParser3.parse(result3);
			JSONObject jsonResonse3 = (JSONObject)jsonObj3.get("response");
			JSONObject jsonHeader3 = (JSONObject)jsonResonse3.get("header");
			JSONObject jsonBody3 = (JSONObject)jsonResonse3.get("body");
			JSONObject jsonItems3 = (JSONObject)jsonBody3.get("items");
			JSONObject jsonItemArray3 = (JSONObject)jsonItems3.get("item");
			
			String resultCode3 = (String) jsonHeader3.get("resultCode");
			System.out.println("jsonItems3 : " + jsonItems3);

			if ("0000".equals(resultCode3)) {
				
				JSONObject obj = jsonItemArray3;
	
				DetailResult data = new DetailResult();
				
				data.setPlaytime(String.valueOf(obj.get("playtime")));
				data.setSponsor1(String.valueOf(obj.get("sponsor1")));
				data.setEventplace(String.valueOf(obj.get("eventplace")));
				introList.add(data);
			}
			
			// 기본정보 API 연동 영역  (detailIntro) 끝


			// 기본정보 API 연동 영역  (detailInfo) 시작
			
			String detailInfo = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?_type=json&"
					+ "ServiceKey="
					+ "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D"
					+ "&contentId="
					+ contentId
					+ "&contentTypeId="
					+ contentTypeId
					+ "&MobileOS=ETC&MobileApp=KH_Hotplace";


			System.out.println("detailInfo : " + detailInfo);
			URL url4 = new URL(detailIntro);
			HttpURLConnection urlconnection4 = (HttpURLConnection) url4.openConnection();
			urlconnection4.setRequestMethod("GET");
			br4 = new BufferedReader(new InputStreamReader(urlconnection4.getInputStream(), "UTF-8"));
			
			String line4;
			while ((line4 = br4.readLine()) != null) {
				result4 = result4 + line4;
			}
			
			JSONParser jsonParser4 = new JSONParser();
			JSONObject jsonObj4 = (JSONObject)jsonParser4.parse(result4);
			JSONObject jsonResonse4 = (JSONObject)jsonObj4.get("response");
			JSONObject jsonHeader4 = (JSONObject)jsonResonse4.get("header");
			JSONObject jsonBody4 = (JSONObject)jsonResonse4.get("body");
			JSONObject jsonItems4 = (JSONObject)jsonBody4.get("items");
			JSONObject jsonItemArray4 = (JSONObject)jsonItems4.get("item");
			
			String resultCode4 = (String) jsonHeader4.get("resultCode");
			System.out.println("jsonItems4 : " + jsonItems3);

			if ("0000".equals(resultCode4)) {
				
				JSONObject obj = jsonItemArray4;
	
				DetailResult data = new DetailResult();
				
				data.setPlaytime(String.valueOf(obj.get("playtime")));
				data.setSponsor1(String.valueOf(obj.get("sponsor1")));
				data.setEventplace(String.valueOf(obj.get("eventplace")));
				infoList.add(data);
			}
			
			// 기본정보 API 연동 영역  (detailInfo) 끝

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		model.addAttribute("imgList", imgList);
		model.addAttribute("commonList", commonList);
		model.addAttribute("introList", introList);
		model.addAttribute("infoList", infoList);
		
		return "detail/detail";
	}
}
