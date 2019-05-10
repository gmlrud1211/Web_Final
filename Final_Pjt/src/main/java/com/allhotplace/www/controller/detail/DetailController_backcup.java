package com.allhotplace.www.controller.detail;
/*package com.allhotplace.www.controller.detail;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailController {

private static final Logger logger = LoggerFactory.getLogger(DetailController.class);
	
	public static final String APP_KEY = "8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D";

	//@Autowired DetailService detailService;
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	
	public String detailView(Model model
//			, String contentId, String contentTypeId
			) {
		
		logger.info("here!");
		String result = "";
		BufferedReader br = null;
		JSONArray rowData = new JSONArray();
	
		try {
			String urlstr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?"
					+ "ServiceKey="
					+ APP_KEY 
					+ "&contentId=12"
					+ contentId 
					+ "&contentTypeId="
					+ contentTypeId 
					+ "&MobileOS=ETC&MobileApp=AppTest";
			
			
			String detailImage = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&imageYN=Y&MobileOS=ETC&MobileApp=AppTest";
			String detailCommon = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTest";
			String detailIntro = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&contentTypeId=15&MobileOS=ETC&MobileApp=AppTest";
			String detailInfo = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?_type=json&ServiceKey=8q31GAJwwNMz571K7eTL7BPpMIsivagfYAbl3xJeUqGhpmGE1V5Md5czX9eJ1aXXsHLMLRiB8XNtcyGLDst5xA%3D%3D&contentId=2508997&contentTypeId=15&MobileOS=ETC&MobileApp=AppTest";

			URL url = new URL(detailImage);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line;
			}
			
			System.out.println("result : " + result);
			
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
					rowData.add(jsonItemArray.get(i));
					System.out.println("rowData : " + rowData );
				}
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("rowData :::: " + rowData);
		
		model.addAllAttributes(rowData);
		return "detail/detail";
	}
}
*/