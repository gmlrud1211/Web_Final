<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
   
   
   /* 관광지타입 SELECT BOX 변경 시 값에 맞는 서비스 대분류 호출 Ajax */
   function typeChange(obj) {
      
      $("#category1").empty();
      $("#category1").append("<option value='' selected='selected'>대분류</option>")
      
      
      $("#category2").empty();
      $("#category2").append("<option value='' selected='selected'>중분류</option>")
      
      
      $("#category3").empty();
      $("#category3").append("<option value='' selected='selected'>소분류</option>")
      
      var selectedType = $("#contentType option:selected").val();
      
      $.ajax({
         type: "post"
         , url: "/searchCategory_1"
         , data: {
            "selectedType":selectedType, 
            }
         , dataType: "json"
         , success: function(result){
            $(result).each(function(i){
               $("#category1").append("<option value=" + result[i].CAT1 + ">" + result[i].CAT1_NAME + "</option>");
            });
         }
         , error: function(e) {
            console.log(e);
         }
      });
   };
   
   /* 서비스 대분류 SELECT BOX 변경 시 값에 맞는 중분류 호출 Ajax */
   function cate1Change(obj) {
      
      $("#category2").empty();
      $("#category2").append("<option value='' selected='selected'>중분류</option>")
      
      
      $("#category3").empty();
      $("#category3").append("<option value='' selected='selected'>소분류</option>")
      
      var selectedType = $("#contentType option:selected").val();
      var cateNum = $("#category1 option:selected").val();
      
      $.ajax({
         type: "post"
         , url: "/searchCategory_2"
         , data: {
            "cateNum":cateNum, 
            "selectedType":selectedType,
            }
         , dataType: "json"
         , success: function(result){
            $(result).each(function(i){
               $("#category2").append("<option value=" + result[i].CAT2 + ">" + result[i].CAT2_NAME + "</option>");
            });
         }
         , error: function(e) {
            console.log(e);
         }
      });
   };
   
   /* 서비스 중분류 SELECT BOX 변경 시 값에 맞는 소분류 호출 Ajax */
   function cate2Change(obj) {
      
      $("#category3").empty();
      $("#category3").append("<option value='' selected='selected'>소분류</option>")
      
      var cateNum = $("#category1 option:selected").val();
      var subCateNum = $("#category2 option:selected").val();
      
      $.ajax({
         type: "post"
         , url: "/searchCategory_3"
         , data: {
            "cateNum":cateNum, 
            "subCateNum":subCateNum,
            }
         , dataType: "json"
         , success: function(result){
            $(result).each(function(i){
               $("#category3").append("<option value=" + result[i].CAT3 + ">" + result[i].CAT3_NAME + "</option>");
            });
         }
         , error: function(e) {
            console.log(e);
         }
      });
   };
   
   /* 지역선택 SELECT BOX 변경 시 값에 맞는 시군구 호출 Ajax */
   function areaChange(obj) {
      
      $("#Municipality").empty();
      $("#Municipality").append("<option value='' selected='selected'>시군구선택</option>")
      
      var areaSelect = $("#areaSelect option:selected").val();
      
      $.ajax({
         type: "post"
         , url: "/searchArea"
         , data: {
            "areaSelect":areaSelect, 
            }
         , dataType: "json"
         , success: function(result){
            $(result).each(function(i){
               $("#Municipality").append("<option value=" + result[i].AREA2 + ">" + result[i].AREA2_NAME + "</option>");
            });
         }
         , error: function(e) {
            console.log(e);
         }
      });
   };
   
   $(document).ready(function() {
      
      $("#btnSearch").click(function() {
         
         var contentType = $("#contentType option:selected").val();
         var category1 = $("#category1 option:selected").val();
         var category2 = $("#category2 option:selected").val();
         var category3 = $("#category3 option:selected").val();
         var areaSelect = $("#areaSelect option:selected").val();
         var municipality = $("#Municipality option:selected").val();
         
         $.ajax({
            type: "post"
            , url: "/searchPlaceResult"
            , data: {
               "contentType":contentType, 
               "category1":category1, 
               "category2":category2, 
               "category3":category3, 
               "areaSelect":areaSelect, 
               "municipality":municipality, 
               }
            , dataType: "json"
            , success: function(placeList){
               
               console.log('ajax success!');
               console.log("placeList : " + placeList);
               
               
               $(placeList).each(function(i){
                  $("#resultPlace").append("<br><br>");
                  
                  var place = JSON.parse(this);
                  //console.log(place.title);
                  
                  if( (place.firstimage) == undefined){
                     // 이미지를 표시할 수 없습니다  --> 이미지로 대체
                     place.firstimage = "http://api.visitkorea.or.kr/static/images/common/noImage.gif";
                  } else if (place.title == undefined || place.title == null) {
                     place.title = "";
                  } else if (place.contentid == undefined || place.contentid == null ) {
                     place.title = "";
                  } else if (place.addr1 == undefined || place.addr1 == null ) {
                     place.addr1 = "";
                  } else if (place.addr2 == undefined || place.addr2 == null ) {
                     place.addr2 = "";
                  }

                  var innerHtml = "";
                  
                  innerHtml += "<ul class='list_thumType flnon'>"; 
                  innerHtml +=    "<li>";
                  innerHtml += "   <div>";
                  innerHtml += "      <div class='div1'>";
                  innerHtml += "         <img src='" + place.firstimage + "' alt='대표이미지' style='width:300px; height:200px'>";
                  innerHtml += "         <hr>";
                  innerHtml += "      </div>";
                  innerHtml += "   </div>";
                  innerHtml += "   <div class='area_txt'>";
                  innerHtml += "      <div class='" + place.contentid + "'>";
                  innerHtml += "         <a href='" + place.contentid +  "'>" + place.title + "</a>";
                  innerHtml += "      </div>";
                  innerHtml += "      <div class='addr'>";
                  innerHtml += "         <p> " + place.addr1 + place.addr2 + " </p>";
                  innerHtml += "      </div>";
                  innerHtml += "   </div>";
                  innerHtml += "</li>";
                  innerHtml += "</ul>";
                  
                  $("#resultPlace").append(innerHtml);
               });
            }
            , error: function(e) {
               console.log('error!');
               console.log(e);
            }
         });
         
         $.ajax({
            type: "post"
            , url: "/searchResultCnt"
            , data: {
               "contentType":contentType, 
               "category1":category1, 
               "category2":category2, 
               "category3":category3, 
               "areaSelect":areaSelect, 
               "municipality":municipality, 
               }
            , dataType: "json"
            , success: function(cnt){
               var cnt = JSON.cnt(this);
               $("#resultCnt").append(cnt);
            }
            , error: function(e) {
               console.log('error!');
               console.log(e);
            }
      });
      
      $("#category1").click(function() {
         
         var content_num = $("#contentType option:selected").val();
         if( content_num == "" ){
            alert("관광지타입을 먼저 선택해주세요");
             $("#contentType").focus();
         }
      });
   });
   
</script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js">
   
</script>

</head>
<body>
   <div id="filter" style="padding: 40px 300px 0px 300px">
   <h2 style="font-weight: 700; line-height: 2.5;">지역별 관광정보</h2>
      <form name="searchPlace" id="search" method="get" action="/searchPlace">
         <div class="form-group">
         <table class="table">
            <tbody>
               <tr>
                  <th scope="row">관광타입</th>
                  <td>
                     <div class="col-xs-4">
                     <select id="contentType" name="contentType" class="form-control" onchange="typeChange(this)">
                           <option value="" selected="selected">타입선택</option>
                        <c:forEach var="contentType" items="${contentType}" varStatus="i">
                           <option value="${contentType.CONTENT_TYPE}">${contentType.CONTENT_TYPE_NAME}</option>
                        </c:forEach>
                     </select>
                     </div>
                  </td>
               </tr>

               <tr>
                  <th scope="row">서비스분류</th>
                  <td >
                     <div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
                        <select class="form-control" name="category1" id="category1" onchange="cate1Change(this)">
                           <option value="" selected="selected">대분류</option>
                        </select>
                     </div>
                     <div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
                        <select class="form-control" name="category2" id="category2" onchange="cate2Change(this)">
                           <option value="" selected="selected">중분류</option>
                        </select>
                     </div>
                     <div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
                        <select class="form-control" name="category3" id="category3">
                           <option value="" selected="selected">소분류</option>
                        </select>
                     </div>
                  </td>            
               </tr>
               
               <tr>
                  <th scope="row">지역</th>
                  <td>
                     <div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
                        <select id="areaSelect" name="areaSelect" class="form-control" onchange="areaChange(this)">
                              <option value="" selected="selected">지역선택</option>
                           <c:forEach var="areaList" items="${areaList}" varStatus="i">
                              <option value="${areaList.AREA1}">${areaList.AREA1_NAME}</option>
                           </c:forEach>
                        </select>
                     </div>
                     <div class="col-sm-2 col-sm-offset-3 control-div" style="width: 190px; margin-left:0px">
                        <select class="form-control" name="Municipality" id="Municipality">
                           <option value="" selected="selected">시군구선택</option>
                        </select>
                     </div>
                  </td>
               </tr>
            </tbody>
         </table>
         </div>
         
         <div id="btnArea" style="text-align:center;">
            <button type="button" id="btnSearch" class="btn btn-primary btn-mm">검색하기</button>
            <button type="button" id="btnClear" class="btn btn-warning btn-mm">필터 초기화</button>
         </div>
      </form>
   </div>
   
   <div id="content" style="padding: 40px 300px 0px 300px">
      <div class="box_leftType1">
         <div class="total_check">
            <strong>총<span id="resultCnt"></span>건 </strong>
         </div>
         <div id="resultPlace">
         </div>
      </div>
   </div>
</body>
</html>