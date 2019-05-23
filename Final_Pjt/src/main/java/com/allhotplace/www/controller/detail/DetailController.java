package com.allhotplace.www.controller.detail;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.allhotplace.www.dto.Comments;
import com.allhotplace.www.dto.DetailCalendar;
import com.allhotplace.www.dto.DetailResult_common;
import com.allhotplace.www.dto.DetailResult_image;
import com.allhotplace.www.dto.DetailResult_intro_course;
import com.allhotplace.www.dto.DetailResult_intro_culture;
import com.allhotplace.www.dto.DetailResult_intro_festival;
import com.allhotplace.www.dto.DetailResult_intro_hotel;
import com.allhotplace.www.dto.DetailResult_intro_report;
import com.allhotplace.www.dto.DetailResult_intro_restaurant;
import com.allhotplace.www.dto.DetailResult_intro_shopping;
import com.allhotplace.www.dto.DetailResult_intro_tour;
import com.allhotplace.www.service.face.detail.DetailService;

@Controller
public class DetailController {

private static final Logger logger = LoggerFactory.getLogger(DetailController.class);
	
	public static final String APP_KEY = "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D";

	@Autowired DetailService detailService;
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	
	public String placeInfoAPI(Model model, String contentId, String contentTypeId, HttpServletRequest request, HttpSession session) {

		System.out.println("=================contentId");
		System.out.println(contentId);
		String result = "";
		BufferedReader br = null;
		String result2 = "";
		BufferedReader br2 = null;
		String result3 = "";
		BufferedReader br3 = null;
		String result4 = "";
		BufferedReader br4 = null;
		
		List<DetailResult_image> imgList = new ArrayList<DetailResult_image>();
		List<DetailResult_common> commonList = new ArrayList<DetailResult_common>();
		List<DetailResult_intro_tour> tourIntro = new ArrayList<DetailResult_intro_tour>();
		List<DetailResult_intro_culture> cultureIntro = new ArrayList<DetailResult_intro_culture>();
		List<DetailResult_intro_festival> festivalIntro = new ArrayList<DetailResult_intro_festival>();
		List<DetailResult_intro_course> courseIntro = new ArrayList<DetailResult_intro_course>();
		List<DetailResult_intro_report> reportIntro = new ArrayList<DetailResult_intro_report>();
		List<DetailResult_intro_hotel> hotelIntro = new ArrayList<DetailResult_intro_hotel>();
		List<DetailResult_intro_shopping> shoppingIntro = new ArrayList<DetailResult_intro_shopping>();
		List<DetailResult_intro_restaurant> restaurantIntro = new ArrayList<DetailResult_intro_restaurant>();
/*		
		상세페이지 관련 API 4EA
		String detailImage = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&imageYN=Y&MobileOS=ETC&MobileApp=KH_Hotplace";
		String detailCommon = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=KH_Hotplace";
		String detailIntro = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&contentTypeId=15&MobileOS=ETC&MobileApp=KH_Hotplace";
		
		String detailInfo = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&contentTypeId=15&MobileOS=ETC&MobileApp=KH_Hotplace";
			“숙박”은 객실정보를 제공합니다.
			“여행코스”는 코스정보를 제공합니다.
			나머지타입은 반복내용임.
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
					
					DetailResult_image data = new DetailResult_image();
					
					data.setOriginimgurl(String.valueOf(obj.get("originimgurl")));
					data.setSmallimageurl(String.valueOf(obj.get("smallimageurl")));
					
					imgList.add(data);
				}
			}

			// 이미지 API 연동 영역  (detailImage) 끝
 

			// 기본정보 API 연동 영역  (detailCommon) 시작
			
			String detailCommon = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?_type=json&mapinfoYN=Y&"
					+ "ServiceKey="
					+ APP_KEY
					+ "&contentId="
					+ contentId
					+ "&defaultYN=Y&"
					+ "addrinfoYN=Y"
					+ "&overviewYN=Y&MobileOS=ETC&MobileApp=KH_Hotplace";

			
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
				DetailResult_common data = new DetailResult_common();
	
				data.setContentid(String.valueOf(obj.get("contentid")));
				data.setAddr1(String.valueOf(obj.get("addr1")));
				data.setAddr2(String.valueOf(obj.get("addr2")));
				data.setTitle(String.valueOf(obj.get("title")));
				data.setTelname(String.valueOf(obj.get("telname")));
				data.setTel(String.valueOf(obj.get("tel")));
				data.setHomepage(String.valueOf(obj.get("homepage")));
				data.setOverview(String.valueOf(obj.get("overview")));
				data.setMapx(String.valueOf(obj.get("mapx")));
				data.setMapy(String.valueOf(obj.get("mapy")));
				data.setMlevel(String.valueOf(obj.get("mlevel")));
				
				commonList.add(data);
				
			}
			
			// 기본정보 API 연동 영역  (detailCommon) 끝
			
			// 기본정보 API 연동 영역  (detailIntro) 시작
			
			String detailIntro = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?_type=json"
					+ "&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D"
					+ "&contentId="
					+ contentId
					+ "&contentTypeId="
					+ contentTypeId
					+ "&MobileOS=ETC&MobileApp=KH_Hotplace";
			
			
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

			if ("0000".equals(resultCode3)) {
				
				if( "12".equals(contentTypeId) ) {
					// 관광지

					JSONObject obj = jsonItemArray3;
					DetailResult_intro_tour data = new DetailResult_intro_tour();

					data.setAccomcount(String.valueOf(obj.get("accomcount")));
					data.setChkbabycarriage(String.valueOf(obj.get("chkbabycarriage")));
					data.setChkcreditcard(String.valueOf(obj.get("chkcreditcard")));
					data.setChkpet(String.valueOf(obj.get("chkpet")));
					data.setExpagerange(String.valueOf(obj.get("expagerange")));
					data.setExpguide(String.valueOf(obj.get("expguide")));
					data.setHeritage1(String.valueOf(obj.get("heritage1")));
					data.setHeritage2(String.valueOf(obj.get("heritage2")));
					data.setHeritage3(String.valueOf(obj.get("heritage3")));
					data.setInfocenter(String.valueOf(obj.get("infocenter")));
					data.setOpendate(String.valueOf(obj.get("opendate")));
					data.setParking(String.valueOf(obj.get("parking")));
					data.setRestdate(String.valueOf(obj.get("restdate")));
					data.setUseseason(String.valueOf(obj.get("useseason")));
					data.setUsetime(String.valueOf(obj.get("usetime")));
					
				} else if ( "14".equals(contentTypeId) ) {
					// 문화시설

					JSONObject obj = jsonItemArray3;
					DetailResult_intro_culture data = new DetailResult_intro_culture();

					data.setAccomcountculture(String.valueOf(obj.get("accomcountculture")));
					data.setChkbabycarriageculture(String.valueOf(obj.get("chkbabycarriageculture")));
					data.setChkpetculture(String.valueOf(obj.get("chkcreditcard")));
					data.setChkpetculture(String.valueOf(obj.get("chkpetculture")));
					data.setDiscountinfo(String.valueOf(obj.get("discountinfo")));
					data.setInfocenterculture(String.valueOf(obj.get("infocenterculture")));
					data.setParkingculture(String.valueOf(obj.get("parkingculture")));
					data.setParkingfee(String.valueOf(obj.get("parkingfee")));
					data.setRestdateculture(String.valueOf(obj.get("restdateculture")));
					data.setUsefee(String.valueOf(obj.get("usefee")));
					data.setUsetimeculture(String.valueOf(obj.get("usetimeculture")));
					data.setScale(String.valueOf(obj.get("scale")));
					data.setSpendtime(String.valueOf(obj.get("spendtime")));
					
					cultureIntro.add(data);
					
					
				} else if ( "15".equals(contentTypeId) ) {
					// 행사/공연/축제

					JSONObject obj = jsonItemArray3;
					DetailResult_intro_festival data = new DetailResult_intro_festival();

					data.setAgelimit(String.valueOf(obj.get("agelimit")));
					data.setBookingplace(String.valueOf(obj.get("bookingplace")));
					data.setDiscountinfofestival(String.valueOf(obj.get("discountinfofestival")));
					data.setEventenddate(String.valueOf(obj.get("eventenddate")));
					data.setEventhomepage(String.valueOf(obj.get("eventhomepage")));
					data.setEventplace(String.valueOf(obj.get("eventplace")));
					data.setEventstartdate(String.valueOf(obj.get("eventstartdate")));
					data.setFestivalgrade(String.valueOf(obj.get("festivalgrade")));
					data.setPlaceinfo(String.valueOf(obj.get("placeinfo")));
					data.setPlaytime(String.valueOf(obj.get("playtime")));
					data.setProgram(String.valueOf(obj.get("program")));
					data.setSpendtimefestival(String.valueOf(obj.get("spendtimefestival")));
					data.setSponsor1(String.valueOf(obj.get("sponsor1")));
					data.setSponsor1tel(String.valueOf(obj.get("sponsor1tel")));
					data.setSponsor2(String.valueOf(obj.get("sponsor2")));
					data.setSponsor2tel(String.valueOf(obj.get("sponsor2tel")));
					data.setSubevent(String.valueOf(obj.get("subevent")));
					data.setUsetimefestival(String.valueOf(obj.get("usetimefestival")));
					
					festivalIntro.add(data);
					
				} else if ( "25".equals(contentTypeId) ) {
					// 여행코스

					JSONObject obj = jsonItemArray3;
					DetailResult_intro_course data = new DetailResult_intro_course();


					data.setDistance(String.valueOf(obj.get("distance")));
					data.setInfocentertourcourse(String.valueOf(obj.get("infocentertourcourse")));
					data.setSchedule(String.valueOf(obj.get("schedule")));
					data.setTaketime(String.valueOf(obj.get("taketime")));
					data.setTheme(String.valueOf(obj.get("theme")));
					data.setAccomcountleports(String.valueOf(obj.get("accomcountleports")));
					
					
					courseIntro.add(data);
					
				} else if ( "28".equals(contentTypeId) ) {
					// 레포츠
					

					JSONObject obj = jsonItemArray3;
					DetailResult_intro_report data = new DetailResult_intro_report();


					data.setAccomcountleports(String.valueOf(obj.get("accomcountleports")));
					data.setChkbabycarriageleports(String.valueOf(obj.get("chkbabycarriageleports")));
					data.setChkcreditcardleports(String.valueOf(obj.get("chkcreditcardleports")));
					data.setChkpetleports(String.valueOf(obj.get("chkpetleports")));
					data.setExpagerangeleports(String.valueOf(obj.get("expagerangeleports")));
					data.setInfocenterleports(String.valueOf(obj.get("infocenterleports")));
					data.setOpenperiod(String.valueOf(obj.get("openperiod")));
					data.setParkingfeeleports(String.valueOf(obj.get("parkingfeeleports")));
					data.setParkingleports(String.valueOf(obj.get("parkingleports")));
					data.setReservation(String.valueOf(obj.get("reservation")));
					data.setRestdateleports(String.valueOf(obj.get("setRestdateleports")));
					data.setScaleleports(String.valueOf(obj.get("scaleleports")));
					data.setUsefeeleports(String.valueOf(obj.get("usefeeleports")));
					data.setUsetimeleports(String.valueOf(obj.get("usetimeleports")));
					
					reportIntro.add(data);
			
				} else if ( "32".equals(contentTypeId) ) {
					// 숙박 
					

					JSONObject obj = jsonItemArray3;
					DetailResult_intro_hotel data = new DetailResult_intro_hotel();


					data.setCheckintime(String.valueOf(obj.get("checkintime")));
					data.setCheckouttime(String.valueOf(obj.get("checkouttime")));
					data.setChkcooking(String.valueOf(obj.get("chkcooking")));
					data.setInfocenterlodging(String.valueOf(obj.get("infocenterlodging")));
					data.setParkinglodging(String.valueOf(obj.get("parkinglodging")));
					data.setPickup(String.valueOf(obj.get("pickup")));
					data.setRoomcount(String.valueOf(obj.get("roomcount")));
					data.setReservationlodging(String.valueOf(obj.get("reservationlodging")));
					data.setReservationurl(String.valueOf(obj.get("reservationurl")));
					data.setRoomtype(String.valueOf(obj.get("roomtype")));
					data.setScalelodging(String.valueOf(obj.get("scalelodging")));
					data.setBarbecue(String.valueOf(obj.get("barbecue")));
					data.setBeverage(String.valueOf(obj.get("beverage")));
					data.setBicycle(String.valueOf(obj.get("bicycle")));
					data.setCampfire(String.valueOf(obj.get("campfire")));
					data.setFitness(String.valueOf(obj.get("fitness")));
					data.setKaraoke(String.valueOf(obj.get("karaoke")));
					data.setSeminar(String.valueOf(obj.get("seminar")));
					data.setSports(String.valueOf(obj.get("sports")));
					
					hotelIntro.add(data);
				
				} else if ( "38".equals(contentTypeId) ) {
					// 쇼핑 
					
					JSONObject obj = jsonItemArray3;
					DetailResult_intro_shopping data = new DetailResult_intro_shopping();

					data.setChkbabycarriageshopping(String.valueOf(obj.get("chkbabycarriageshopping")));
					data.setChkcreditcard(String.valueOf(obj.get("chkcreditcard")));
					data.setShopping(String.valueOf(obj.get("shopping")));
					data.setChkpetshopping(String.valueOf(obj.get("chkpetshopping")));
					data.setCulturecenter(String.valueOf(obj.get("culturecenter")));
					data.setFairday(String.valueOf(obj.get("fairday")));
					data.setInfocentershopping(String.valueOf(obj.get("infocentershopping")));
					data.setOpendateshopping(String.valueOf(obj.get("opendateshopping")));
					data.setOpentime(String.valueOf(obj.get("opentime")));
					data.setParkingshopping(String.valueOf(obj.get("parkingshopping")));
					data.setRestdateshopping(String.valueOf(obj.get("restdateshopping")));
					data.setRestroom(String.valueOf(obj.get("restroom")));
					data.setSaleitem(String.valueOf(obj.get("saleitem")));
					data.setSaleitemcost(String.valueOf(obj.get("saleitemcost")));
					data.setShopguide(String.valueOf(obj.get("shopguide")));
					
					shoppingIntro.add(data);
				
				}	else if ( "39".equals(contentTypeId) ) {
					// 음식점 
					
					JSONObject obj = jsonItemArray3;
					DetailResult_intro_restaurant data = new DetailResult_intro_restaurant();

					data.setChkcreditcardfood(String.valueOf(obj.get("chkcreditcardfood")));
					data.setDiscountinfofood(String.valueOf(obj.get("discountinfofood")));
					data.setFirstmenu(String.valueOf(obj.get("firstmenu")));
					data.setInfocenterfood(String.valueOf(obj.get("infocenterfood")));
					data.setKidsfacility(String.valueOf(obj.get("kidsfacility")));
					data.setOpendatefood(String.valueOf(obj.get("opendatefood")));
					data.setOpentimefood(String.valueOf(obj.get("opentimefood")));
					data.setPacking(String.valueOf(obj.get("packing")));
					data.setParkingfood(String.valueOf(obj.get("parkingfood")));
					data.setReservationfood(String.valueOf(obj.get("reservationfood")));
					data.setRestdatefood(String.valueOf(obj.get("restdatefood")));
					data.setScalefood(String.valueOf(obj.get("scalefood")));
					data.setSeat(String.valueOf(obj.get("chkcreditcardfood")));
					data.setChkcreditcardfood(String.valueOf(obj.get("seat")));
					data.setSmoking(String.valueOf(obj.get("smoking")));
					data.setTreatmenu(String.valueOf(obj.get("treatmenu")));
					
					restaurantIntro.add(data);
				}
			}
			
			// 기본정보 API 연동 영역  (detailCommon) 끝
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		

		
//		User별 북마크 정보 가져오기 
		
		String user_id = (String) request.getSession().getAttribute("user_id");
		model.addAttribute("user_id", user_id);
		if(user_id != null) { 
			Map map = new HashMap<>();
			map.put("user_id", user_id);
			map.put("contentid", contentId);
	
			int isBookmark = detailService.isBookmark(map);
			
			if(isBookmark > 0 ) {
				model.addAttribute("isBookmark", true);
			} else {
				model.addAttribute("isBookmark", false);
			}
		} else {
			model.addAttribute("isBookmark", false);
		}
		
		
//		댓글 정보 가져오기
		
		List<Comments> commentList = new ArrayList<Comments>();
		commentList = detailService.getComment(contentId);
		
		
		model.addAttribute("contentTypeId", contentTypeId);
		model.addAttribute("imgList", imgList);
		model.addAttribute("commonList", commonList);
		model.addAttribute("tourIntro", tourIntro);
		model.addAttribute("cultureIntro", cultureIntro);
		model.addAttribute("festivalIntro", festivalIntro);
		model.addAttribute("courseIntro", courseIntro);
		model.addAttribute("reportIntro", reportIntro);
		model.addAttribute("hotelIntro", hotelIntro);
		model.addAttribute("shoppingIntro", shoppingIntro);
		model.addAttribute("restaurantIntro", restaurantIntro);
		model.addAttribute("commentList", commentList);
		
		
		return "detail/detail";
	}
	
	@RequestMapping(value="/detail/getCalendar")
	public String getCalendar(Model model, String user_id) {
		
		List<DetailCalendar> calList = new ArrayList<DetailCalendar>();
		calList	= detailService.getCalendar(user_id);
		model.addAttribute("calList", calList);
		return "detail/addCalendar";
	}
	
	@RequestMapping(value="/detail/addSchedule")
	public String addSchedule
		(Model model, String schedule, String startTime, String endTime, String calNo, 
				String contentid, String date, String contentTypeId) {
		String startDateTime = date + " " + startTime;
		String endDateTime = date + " " + endTime;

		Map map = new HashMap();
		map.put("schedule_title", schedule);
		map.put("startTime", startDateTime);
		map.put("endTime", endDateTime);
		map.put("calendar_no", calNo);
		map.put("schedule_id", contentid);
		
		detailService.addSchedule(map);
			
		return "redirect:/detail?contentId=" + contentid + "&contentTypeId=" + contentTypeId ;
	}
	


	@RequestMapping(value="/detail/bookmark")
	@ResponseBody
	public void addBookmark(Model model, String contentid, String contenttypeid, String userid, String image) {

		Map map = new HashMap();
			
		map.put("contentid", contentid);
		map.put("contenttypeid", contenttypeid);
		map.put("userid", userid);
		map.put("image", image);
		
		detailService.addBookmark(map);
		
	}
	@RequestMapping(value="/detail/bookmarkCancel")
	@ResponseBody
	public void deleteBookmark(Model model, String contentid, String user_id) {
		
		Map map = new HashMap();
		map.put("contentid", contentid);
		map.put("user_id", user_id);
		
		detailService.deleteBookmark(map);
		
	}
	
	@RequestMapping(value="/detail/comment")
	public String commentSubmit(Model model, String contentid, String user_id, String content, String contentTypeId) {
		
		
		Map map = new HashMap();
		
		map.put("contentid", contentid);
		map.put("user_id", user_id);
		map.put("content", content);
		
		detailService.commentSubmit(map);
		
		return "redirect:/detail?contentId=" + contentid + "&contentTypeId=" + contentTypeId + "#commentArea";
		
	}
	
	@RequestMapping(value="/detail/commentDelete")
	public String commentDelete(Model model, String comment_no, String contentid, String contentTypeId) {
		
		detailService.commentDelete(comment_no);
		
		return "redirect:/detail?contentId=" + contentid + "&contentTypeId=" + contentTypeId + "#commentArea";
	}
}
