package com.allhotplace.www.controller.search;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.allhotplace.www.service.face.search.SearchService;

@Controller
public class SearchController {
   private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
   
   public static final String APP_KEY = "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D";

   @Autowired SearchService searchService;


   @RequestMapping(value="/searchPlace", method=RequestMethod.GET)
   public String searchPlaceView(Model model) {
      
      logger.info("im here!");
      List contentTypeLis = new ArrayList();
      contentTypeLis = searchService.getContentType();
      
      model.addAttribute("contentType", contentTypeLis);
      
      // 지역 DB 조회하여 전달
      List areaList = new ArrayList();
      areaList = searchService.getAreaList();
      
      model.addAttribute("areaList", areaList);
      return "search/searchPlace";
   }
   
   
   // 관광타입에 맞는 대분류 조회
   @RequestMapping(value="/searchCategory_1", method=RequestMethod.POST)
   @ResponseBody
   public List searchCategory_1(String selectedType) {
      logger.info("GET 1 DEPTH CATEGORY");
      List category = searchService.getBigCategory(selectedType);
      System.out.println(category);
      return category;
   }
   
   // 대분류에 맞는 중분류 조회
   @RequestMapping(value="/searchCategory_2", method=RequestMethod.POST)
   @ResponseBody
   public List searchCategory_2(String cateNum, String selectedType) {
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("cateNum", cateNum);
      map.put("selectedType", selectedType);
      
      List subCategory = searchService.getSubCategory(map);
      System.out.println("subCategory "  + subCategory);
      return subCategory;
   }

   // 중분류에 맞는 소분류 조회
   @RequestMapping(value="/searchCategory_3", method=RequestMethod.POST)
   @ResponseBody
   public List searchCategory_3(String cateNum, String subCateNum) {
      
      Map<String, String> map = new HashMap<String, String>();
      map.put("cateNum", cateNum);
      map.put("subCateNum", subCateNum);
      
      List smallCategory = searchService.getSmallCategory(map);
      System.out.println(smallCategory);
      return smallCategory;
   }

   // 지역에 맞는 시군구 조회
   @RequestMapping(value="/searchArea", method=RequestMethod.POST)
   @ResponseBody
   public List searchArea(String areaSelect) {
      logger.info("GET Municipality");
      List Municipality = searchService.getMunicipality(areaSelect);
      return Municipality;
   }
   
   // 검색 결과 조회 
   @RequestMapping(value="/searchPlaceResult")
   @ResponseBody
   public List searchPlace(
         Model model, String contentType, String category1, String category2, String category3, String areaSelect, String municipality
         ) {
      
      String result = "";
      BufferedReader br = null;
      JSONArray rowData = new JSONArray();
      List placeList = new ArrayList();
   
      try { 
         String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
               + APP_KEY   // 인증키 
               + "&_type=json&"
               + "contentTypeId="
               + contentType // 관광지 타입코드
               + "&areaCode="
               + areaSelect // 지역 도시코드
               + "&sigunguCode="
               + municipality   // 지역 시군구 코드
               + "&cat1="
               + category1   // 서비스 대분류 코드
               + "&cat2="
               + category2   //서비스 중분류 코드
               + "&cat3="
               + category3   // 서비스 소분류 코드 
               + "&listYN=Y"   // 목록 구분 :: 목록 구분 (Y=목록, N=개수)
               + "&MobileOS=ETC"   // OS 구분 :: IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC
               + "&MobileApp=KH_Hotplace"   // 서비스 명
               + "&arrange=C"   // 정렬구분 (A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)
               + "&numOfRows=30"   // 한 페이지 결과 수 
               + "&pageNo=1";      // 현재페이지번호
         
         
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
               System.out.println("placeList 11 : " + placeList);
            }
         }
         
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      System.out.println("placeList 22 : " + placeList);
      return placeList;
   }
   
   // 검색 결과 갯수 카운트  
      @RequestMapping(value="/searchResultCnt")
      @ResponseBody
      public String searchResultCnt(
            Model model, String contentType, String category1, String category2, String category3, String areaSelect, String municipality
            ) {
         
         System.out.println("11111111111111");
         
         String result2 = "";
         BufferedReader br2 = null;
         JSONArray rowData2 = new JSONArray();
         List placeList2 = new ArrayList();
         
         try {
            String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="
                  + APP_KEY   // 인증키 
                  + "&_type=json&"
                  + "contentTypeId="
                  + contentType // 관광지 타입코드
                  + "&areaCode="
                  + areaSelect // 지역 도시코드
                  + "&sigunguCode="
                  + municipality   // 지역 시군구 코드
                  + "&cat1="
                  + category1   // 서비스 대분류 코드
                  + "&cat2="
                  + category2   //서비스 중분류 코드
                  + "&cat3="
                  + category3   // 서비스 소분류 코드 
                  + "&listYN=N"   // 목록 구분 :: 목록 구분 (Y=목록, N=개수)
                  + "&MobileOS=ETC"   // OS 구분 :: IOS (아이폰), AND (안드로이드), WIN (윈도우폰), ETC
                  + "&MobileApp=KH_Hotplace"   // 서비스 명
                  + "&arrange=C"   // 정렬구분 (A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순, Q=수정일순, R=생성일순)
                  + "&numOfRows=30"   // 한 페이지 결과 수 
                  + "&pageNo=1";      // 현재페이지번호
            
            
            System.out.println("urlstr ::: " + urlstr );

            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            br2 = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
            
            String line;
            while ((line = br2.readLine()) != null) {
               result2 = result2 + line;
             }
             
             JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject)jsonParser.parse(result2);
             
         } catch (Exception e) {
            System.out.println(e.getMessage());
         }
         System.err.println("result2 : " + result2);
         return result2;
            
   }
}