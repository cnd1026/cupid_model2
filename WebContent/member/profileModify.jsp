<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/head.jsp"%>

<script>
var area0 = new Array("-선택-","");
var area1 = new Array("춘천","원주","강릉","동해","태백","속초","삼척","홍천","횡성","영월","평창","정선","철원","화천","양구","인제","고성","양양");
var area2 = new Array("수원","성남","의정부","안양","부천","광명","평택","동두천","안산","고양","과천","구리","남양주","오산","시흥","군포","의왕","하남","용인","파주","이천","안성","김포","화성","광주","양주","포천","여주","연천","가평","양평");
var area3 = new Array("창원","진주","통영","사천","김해","밀양","거제","양산","의령","함안","창녕","고성","남해","하동","산청","함양","거창","합천");
var area4 = new Array("포항","경주","김천","안동","구미","영주","영천","상주","문경","경산","군위","의성","청송","영양","영덕","청도","고령","성주","칠곡","예천","봉화","울진","울릉");
var area5 = new Array("동구","서구","남구","북구","광산구");
var area6 = new Array("중구","동구","서구","남구","북구","수성구","달서구","달성군");
var area7 = new Array("동구","중구","서구","유성구","대덕구");
var area8 = new Array("중구","서구","동구","영도구","부산진구","동래구","남구","북구","해운대구","사하구","금정구","강서구","연제구","수영구","사상구","기장군");
var area9 = new Array("종로구","중구","용산구","성동구","광진구","동대문구","중량구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구");
var area10 = new Array("반곡동","소담동","보람동","대편동","가람동","한솥동","나성동","새롬동","다정동","어진동","종촌동","고운동","아름동","도담동","조치원읍","연기면","연동면","부강면","금남면","장군면","연서면","전의면","전동면","소정면");
var area11 = new Array("중구","남구","동구","북구","울주군");
var area12 = new Array("중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군");
var area13 = new Array("목포","여수","순천","나주","광양","담양","곡성","구례","고흥","보성","화순","장흥","강진","해남","영암","무안","함평","영광","장성","완도","진도","신안");
var area14 = new Array("전주","군산","익산","정읍","남원","김제","완주","진안","무주","장수","임실","순창","고창","부안");
var area15 = new Array("제주","서귀포");
var area16 = new Array("천안","공주","보령","아산","서산","논산","계룡","당진","금산","부여","서천","청양","홍성","예산","태안");
var area17 = new Array("청주","충주","제천","보은","옥천","영동","증평","진천","괴산","음성","단양");

function areachange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.area;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = area' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = area' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    temp.options[0].selected=true;
    return true;
}
</script>

<div style="width:100%; height:50px; min-width:1200px; background-color:#929ADD;">
	<div style="padding-top:10px; margin-left:20px;">
		<font size=4 color=white>프로필 수정</font>
	</div>
</div>
<!-- 제일 큰 테두리 -->
<div align=center style="width: 100%; min-width:1200px; max-width:1800px; margin-left:auto; margin-right:auto;">
	<!-- 최상단 여백부분 -->
	<div style="width: 100%; height: 10px;"></div>
	<!-- 내용 첫번째칸 사진과 기본내용 -->
	<form name="signform" action="ProfileModifyProc.do">
	<input type="hidden" name="nowserver" value="${nowserver }">
	<div style="width: 95%; height: 300px; border: 1px solid #CCC; box-shadow: 3px 3px 8px 1px gray;">
		<!-- 사진부분 -->
		<div
			style="box-shadow: 2px 2px 8px 1px gray; margin:10px; width: 280px; height: 280px; float: left; background-image: url(/cupid/upload/${profile.profilepicture }); background-position: 50%; background-repeat: no-repeat; background-size: cover;">
		</div>
		<!-- 여백 -->
		<div style="width: 2%;; height: 290px; float: left;"></div>
		<!-- 소개부분 -->
		<div style="width: calc(98% - 450px); height: 290px; float: left;">
			<!-- 소개 -->
			<div
				style="width: 100%; height: 300px; text-align: left; float: left;">
				<div style="width:100%; height:25px;"></div>
				<div style="width:100%; height:25px; font-size: 25px; font-weight: bold;">
					<!-- 썸네일 사진 -->
					<div style="width:25px; height:25px; margin-top:5px; margin-left:5px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${profile.profilepicture }); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
				&nbsp;${profile.name }
				</div>
				<div style="width:100%; height:20px; margin-top:20px; font-size: 15px;">
					주소 : ${profile.addr }
				</div>
				<div style="width:100%; height:15px; margin-top:15px; font-size: 13px;"></div>
				<div style="width:45%; height:150px; float:left; margin-top:10px;">
					<div style="width:100%; height:20px; font-size:17px; font-weight:700;">자기소개</div>
					<div style="width:100%; height:120px; margin-top:10px; font-size:13px; font-weight:400; overflow:hidden;">
						<!-- 채팅 글자수 200자로 제한 -->
							<script type="text/javascript">					
								$(document).ready(function() {$('#whoami,#want').on('keyup', function() {
									if($(this).val().length > 200) {
										$(this).val($(this).val().substring(0, 200));					
								        }
								    });
								});
							</script>						
																	<!-- 개행처리 -->		
						<textarea id="whoami" name="whoami" style="width:99%; height:119px; resize:none;">${profile.whoami}</textarea>
					</div>
				</div>
				<div style="width:5%; height:150px; float:left; margin-top:10px;"></div>
				<div style="width:45%; height:150px; float:left; margin-top:10px; font-size: 15px;">
					<div style="width:100%; height:20px; font-size:17px; font-weight:700;">원하는 상대</div>
					<div style="width:100%; height:120px; margin-top:10px; font-size:13px; font-weight:400; overflow:hidden;">
						<textarea id="want" name="want" style="width:99%; height:119px; resize:none;">${profile.want}</textarea>
					</div>
				</div>
			</div>
			<!-- 수정 완료 -->
		</div>
		<div style="float:left;">
			<div style="width: 150px; height: 100px; float: left; padding-top:30px; text-align: right;">
				
				<div style="width:120px; height:40px; margin-top:5px; margin-right:50px; border:0.1px solid #CCC; float:right;">
					<button type="submit" style="width:120px; height:40px; font-size:18px; box-shadow: 3px 3px 8px 1px gray;">수정완료</button>
				</div>
			</div>
		</div>
		<div style="width: 130px; height: 130px; float: left; background-image:url(
			<c:choose>
				<c:when test="${profile.level=='3' }">
					/cupid/img/platinum.png
				</c:when>
				<c:when test="${profile.level=='2' }">
					/cupid/img/gold.png
				</c:when>
				<c:when test="${profile.level=='1' }">
					/cupid/img/dogpig.png
				</c:when>
				<c:otherwise>
					/cupid/img/god.png
				</c:otherwise>
			</c:choose>); background-position:50%; background-repeat:no-repeat; background-size:cover;"></div>
	</div>
	
	<div style="width: 100%; height: 10px;"></div>
	
	<!-- 내 사진들 -->

<style>
	input[type=radio] {
	    display:none; 
	    margin:10px;
	}
	input[type=radio] + label {
	    display:inline-block;
	    background-color: #FFF;
	}
	input[type=radio]:checked + label { 
	   background-image: none;
	    background-color:#A0A0A0;
	}
</style>

	<div align="center" style="width: 80%; padding:10px; border: 1px solid #CCC; box-shadow: 3px 3px 8px 1px gray; display:flex; flex-wrap:wrap;">
		<div style="width:100%; text-align:left; margin:5px; font-size:20px; font-weight:700; color:#666;">프로필 사진 지정</div>
		<!-- 사진음슴 -->
		<input type="radio" id="radio1" name="profilepicture" value=
		<c:choose>
			<c:when test="${(profile.gender)=='남자' }">
				"nullman.jpg"
			</c:when>
			<c:otherwise>
				"nullgirl.jpg"
			</c:otherwise>
		</c:choose>
		>
   			<label for="radio1">
		<div style="width:200px; height:200px; margin:10px; box-shadow: 2px 2px 5px 1px gray; background-image:url(
		<c:choose>
			<c:when test="${(profile.gender)=='남자' }">
				/cupid/img/nullman.jpg
			</c:when>
			<c:otherwise>
				/cupid/img/nullgirl.jpg
			</c:otherwise>
		</c:choose>
		); background-position:50%; background-size:cover; background-repeat:no-repeat;"></div>
		</label>
		<!-- 내 사진들 추가 -->
		<c:set var="radioNum" value="2"/>
		<c:forEach var="picture" items="${vp }">
			<input type="radio" id="radio${radioNum }" name="profilepicture" value="${picture.file_rename }">
  				<label for="radio${radioNum }">
			<div style="width:200px; height:200px; margin:10px; box-shadow: 2px 2px 5px 1px gray; background-image:url(/cupid/upload/${picture.file_rename }); background-position:50%; background-size:cover; background-repeat:no-repeat;"></div>
			</label>
			<c:set var="radioNum" value="${radioNum + 1 }"/>	
		</c:forEach>
	</div>
	<div style="width: 100%; height: 10px;"></div>
	
	<!-- 취미 -->
	
	<div style="width:100%; display:block; text-align:left;">
		<div style="width:535px; height:1900px; margin:0 auto; border:1px solid #CCCCCC; box-shadow:3px 3px 8px 1px gray;">
		<ul>
		<li style="content:''; display:table;">
		취미 및 관심사 수정<br><br>
		여가시간에 주로 하는 것은? 
		<div style="width:475px; float:left;">
		                      
		   	 <div style="width:50%; float:left;">
			
			<c:set var="favorite" value="${profile.favo }"/>
			<c:set var="favorite1" value="${profile.favo1 }"/>
			<c:set var="favorite2" value="${profile.favo2 }"/>
			<c:set var="favorite3" value="${profile.favo3 }"/>
			
			<input type=hidden name=favo value="">
			<input type=hidden name=favo1 value="">
			<input type=hidden name=favo2 value="">
			<input type=hidden name=favo3 value="">
			
			<label><div style="width:100%;"><input type="checkbox" value="Bar" name="favo" <c:if test="${fn:contains(favorite,'Bar') }">checked</c:if>>Bar</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="나이트클럽" name="favo" <c:if test="${fn:contains(favorite,'나이트클럽') }">checked</c:if>>나이트클럽</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="클럽" name="favo" <c:if test="${fn:contains(favorite,'Club') }">checked</c:if>>Club</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="TV시청:교육/뉴스" name="favo" <c:if test="${fn:contains(favorite,'TV시청:교육/뉴스') }">checked</c:if>>TV시청:교육/뉴스</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="TV시청:오락" name="favo" <c:if test="${fn:contains(favorite,'TV시청:오락') }">checked</c:if>>TV시청:오락</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="노래방" name="favo" <c:if test="${fn:contains(favorite,'노래방') }">checked</c:if>>노래방</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="가족" name="favo" <c:if test="${fn:contains(favorite,'가족') }">checked</c:if>>가족</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="골동품" name="favo" <c:if test="${fn:contains(favorite,'골동품') }">checked</c:if>>골동품</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="공예" name="favo" <c:if test="${fn:contains(favorite,'공예') }">checked</c:if>>공예</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="과학/기술" name="favo" <c:if test="${fn:contains(favorite,'과학/기술') }">checked</c:if>>과학/기술</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="교육" name="favo" <c:if test="${fn:contains(favorite,'교육') }">checked</c:if>>교육</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="영화관" name="favo" <c:if test="${fn:contains(favorite,'영화관') }">checked</c:if>>영화관</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="글쓰기" name="favo" <c:if test="${fn:contains(favorite,'글쓰기') }">checked</c:if>>글쓰기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="뉴스/정치" name="favo" <c:if test="${fn:contains(favorite,'뉴스/정치') }">checked</c:if>>뉴스/정치</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="도서관" name="favo" <c:if test="${fn:contains(favorite,'도서관') }">checked</c:if>>도서관</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="독서" name="favo" <c:if test="${fn:contains(favorite,'독서') }">checked</c:if>>독서</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="명상" name="favo" <c:if test="${fn:contains(favorite,'명상') }">checked</c:if>>명상</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="모토사이클링" name="favo" <c:if test="${fn:contains(favorite,'모토사이클링') }">checked</c:if>>모토사이클링</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="박물관/갤러리" name="favo" <c:if test="${fn:contains(favorite,'박물관/갤러리') }">checked</c:if>>박물관/갤러리</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="발레" name="favo" <c:if test="${fn:contains(favorite,'발레') }">checked</c:if>>발레</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="보드/카드게임" name="favo" <c:if test="${fn:contains(favorite,'보드/카드게임') }">checked</c:if>>보드/카드게임</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="비디오/온라인게임" name="favo" <c:if test="${fn:contains(favorite,'비디오/온라인게임') }">checked</c:if>>비디오/온라인게임</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="사진" name="favo" <c:if test="${fn:contains(favorite,'사진') }">checked</c:if>>사진</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="사회운동/캠페인" name="favo" <c:if test="${fn:contains(favorite,'사회운동/캠페인') }">checked</c:if>>사회운동/캠페인</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="쇼핑" name="favo" <c:if test="${fn:contains(favorite,'쇼핑') }">checked</c:if>>쇼핑</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="수집" name="favo" <c:if test="${fn:contains(favorite,'수집') }">checked</c:if>>수집</div></label>
			
			</div>
			 <div style="width:50%; float:left;">
			
			
			<label><div style="width:100%;"><input type="checkbox" value="스포츠경기관람" name="favo" <c:if test="${fn:contains(favorite,'스포츠경기관람') }">checked</c:if>>스포츠경기관람</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="시읽기" name="favo" <c:if test="${fn:contains(favorite,'시읽기') }">checked</c:if>>시읽기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="여행" name="favo" <c:if test="${fn:contains(favorite,'여행') }">checked</c:if>>여행</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="애완동물" name="favo" <c:if test="${fn:contains(favorite,'애완동물') }">checked</c:if>>애완동물</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="와인시식" name="favo" <c:if test="${fn:contains(favorite,'와인시식') }">checked</c:if>>와인시식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="외식" name="favo" <c:if test="${fn:contains(favorite,'외식') }">checked</c:if>>외식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="요리/음식/와인" name="favo" <c:if test="${fn:contains(favorite,'요리/음식/와인') }">checked</c:if>>요리/음식/와인</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="음악하기" name="favo" <c:if test="${fn:contains(favorite,'음악하기') }">checked</c:if>>음악하기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="음악듣기" name="favo" <c:if test="${fn:contains(favorite,'음악듣기') }">checked</c:if>>음악듣기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="자동차/기계" name="favo" <c:if test="${fn:contains(favorite,'자동차/기계') }">checked</c:if>>자동차/기계</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="자원봉사" name="favo" <c:if test="${fn:contains(favorite,'자원봉사') }">checked</c:if>>자원봉사</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="저녘파티" name="favo" <c:if test="${fn:contains(favorite,'저녘파티') }">checked</c:if>>저녘파티</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="정원관리/조경" name="favo" <c:if test="${fn:contains(favorite,'정원관리/조경') }">checked</c:if>>정원관리/조경</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="집단장/수리" name="favo" <c:if test="${fn:contains(favorite,'집단장/수리') }">checked</c:if>>집단장/수리</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="철학/사고" name="favo" <c:if test="${fn:contains(favorite,'철학/사고') }">checked</c:if>>철학/사고</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="첨성학" name="favo" <c:if test="${fn:contains(favorite,'첨성학') }">checked</c:if>>첨성학</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="춤" name="favo" <c:if test="${fn:contains(favorite,'춤') }">checked</c:if>>춤</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="카지노/도박" name="favo" <c:if test="${fn:contains(favorite,'카지노/도박') }">checked</c:if>>카지노/도박</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="캠핑/자연체험" name="favo" <c:if test="${fn:contains(favorite,'캠핑/자연체험') }">checked</c:if>>캠핑/자연체험</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="컴퓨터/인터넷" name="favo" <c:if test="${fn:contains(favorite,'컴퓨터/인터넷') }">checked</c:if>>컴퓨터/인터넷</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="코미디클럽" name="favo" <c:if test="${fn:contains(favorite,'코미디클럽') }">checked</c:if>>코미디클럽</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="콘서트/라이브뮤직" name="favo" <c:if test="${fn:contains(favorite,'콘서트/라이브뮤직') }">checked</c:if>>콘서트/라이브뮤직</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="투자/자산관리" name="favo" <c:if test="${fn:contains(favorite,'투자/자산관리') }">checked</c:if>>투자/자산관리</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="패션이벤트" name="favo" <c:if test="${fn:contains(favorite,'패션이벤트') }">checked</c:if>>패션이벤트</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="해변가/공원" name="favo" <c:if test="${fn:contains(favorite,'해변가/공원') }">checked</c:if>>해변가/공원</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo" <c:if test="${fn:contains(favorite,'기타') }">checked</c:if>>기타</div></label>
			
			</div>
			</div>
			</li>
			
			<br>
			<li style="content:''; display:table;">
			
			<div style="width:475px; float:left;">
		        가장 좋아하는 음식은?<br>              
		   	 <div style="width:50%; float:left;">
			
			                      
		   	 
			<label><div style="width:100%;"><input type="checkbox" value="그리스식" name="favo1" <c:if test="${fn:contains(favorite1,'그리스식') }">checked</c:if>>그리스식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="남미식" name="favo1" <c:if test="${fn:contains(favorite1,'남미식') }">checked</c:if>>남미식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="남서부식" name="favo1" <c:if test="${fn:contains(favorite1,'남서부식') }">checked</c:if>>남서부식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="인도식" name="favo1" <c:if test="${fn:contains(favorite1,'인도식') }">checked</c:if>>인도식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="독일식" name="favo1" <c:if test="${fn:contains(favorite1,'독일식') }">checked</c:if>>독일식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="동유럽식" name="favo1" <c:if test="${fn:contains(favorite1,'동유럽식') }">checked</c:if>>동유럽식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="멕시코식" name="favo1" <c:if test="${fn:contains(favorite1,'멕시코식') }">checked</c:if>>멕시코식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="바베큐" name="favo1" <c:if test="${fn:contains(favorite1,'바베큐') }">checked</c:if>>바베큐</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="베트남식" name="favo1" <c:if test="${fn:contains(favorite1,'베트남식') }">checked</c:if>>베트남식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="소울푸드" name="favo1" <c:if test="${fn:contains(favorite1,'소울푸드') }">checked</c:if>>소울푸드</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="순 채식주의자" name="favo1" <c:if test="${fn:contains(favorite1,'순 채식주의자') }">checked</c:if>>순 채식주의자</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="아메리카식" name="favo1" <c:if test="${fn:contains(favorite1,'아메리카식') }">checked</c:if>>아메리카식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="유대식/코세르" name="favo1" <c:if test="${fn:contains(favorite1,'유대식/코세르') }">checked</c:if>>유대식/코세르</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="이태리식" name="favo1" <c:if test="${fn:contains(favorite1,'이태리식') }">checked</c:if>>이태리식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="인도식" name="favo1" <c:if test="${fn:contains(favorite1,'인도식') }">checked</c:if>>인도식</div></label>
			
			</div>
			 <div style="width:50%; float:left;">
			 
			<label><div style="width:100%;"><input type="checkbox" value="일본/sushi" name="favo1" <c:if test="${fn:contains(favorite1,'일본/sushi') }">checked</c:if>>일본/sushi</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="중국식/딤섬" name="favo1" <c:if test="${fn:contains(favorite1,'중국식/딤섬') }">checked</c:if>>중국식/딤섬</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="중동식" name="favo1" <c:if test="${fn:contains(favorite1,'중동식') }">checked</c:if>>중동식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="지중해식" name="favo1" <c:if test="${fn:contains(favorite1,'지중해식') }">checked</c:if>>지중해식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="채식주의/유기농식" name="favo1" <c:if test="${fn:contains(favorite1,'채식주의/유기농식') }">checked</c:if>>채식주의/유기농식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="캐리비안/쿠바" name="favo1" <c:if test="${fn:contains(favorite1,'캐리비안/쿠') }">checked</c:if>>캐리비안/쿠바</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="캘리포니아퓨전" name="favo1" <c:if test="${fn:contains(favorite1,'캘리포니아퓨전') }">checked</c:if>>캘리포니아퓨전</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="컨티넨탈" name="favo1" <c:if test="${fn:contains(favorite1,'컨티넨탈') }">checked</c:if>>컨티넨탈</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="케이준/남부" name="favo1" <c:if test="${fn:contains(favorite1,'케이준/남부') }">checked</c:if>>케이준/남부</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="태국식" name="favo1" <c:if test="${fn:contains(favorite1,'태국식') }">checked</c:if>>태국식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="패스트푸드/피자" name="favo1" <c:if test="${fn:contains(favorite1,'패스트푸드/피자') }">checked</c:if>>패스트푸드/피자</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="프랑스식" name="favo1" <c:if test="${fn:contains(favorite1,'프랑스식') }">checked</c:if>>프랑스식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="한국식" name="favo1" <c:if test="${fn:contains(favorite1,'한국식') }">checked</c:if>>한국식</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="해물요리" name="favo1" <c:if test="${fn:contains(favorite1,'해물요리') }">checked</c:if>>해물요리</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo1" <c:if test="${fn:contains(favorite1,'기타') }">checked</c:if>>기타</div></label>
			
			
			</div>
			</div>
			</li>
			
			<br>
			
			<li style="content:''; display:table;">
			
			
			<div style="width:475px; float:left;">
		        가장 좋아하는 음악은?<br>              
		   	 <div style="width:50%; float:left;">
		   	 
			<label><div style="width:100%;"><input type="checkbox" value="R&B/힙합" name="favo2" <c:if test="${fn:contains(favorite2,'R&B/힙합') }">checked</c:if>>R&B/힙합</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="뉴에이지" name="favo2" <c:if test="${fn:contains(favorite2,'뉴에이지') }">checked</c:if>>뉴에이지</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="댄스/테크노" name="favo2" <c:if test="${fn:contains(favorite2,'댄스/테크노') }">checked</c:if>>댄스/테크노</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="랩" name="favo2" <c:if test="${fn:contains(favorite2,'랩') }">checked</c:if>>랩</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="레게" name="favo2" <c:if test="${fn:contains(favorite2,'레게') }">checked</c:if>>레게</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="록" name="favo2" <c:if test="${fn:contains(favorite2,'록') }">checked</c:if>>록</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="메탈" name="favo2" <c:if test="${fn:contains(favorite2,'메탈') }">checked</c:if>>메탈</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="소프트록" name="favo2" <c:if test="${fn:contains(favorite2,'소프트록') }">checked</c:if>>소프트록</div></label>
			
			
		    
		     </div>           
		   	 <div style="width:50%; float:left;">
		   	 
			<label><div style="width:100%;"><input type="checkbox" value="얼터너티브" name="favo2" <c:if test="${fn:contains(favorite2,'얼터너티브') }">checked</c:if>>얼터너티브</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="월드" name="favo2" <c:if test="${fn:contains(favorite2,'월드') }">checked</c:if>>월드</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="종교음악" name="favo2" <c:if test="${fn:contains(favorite2,'종교음악') }">checked</c:if>>종교음악</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="재즈/블루스" name="favo2" <c:if test="${fn:contains(favorite2,'재즈/블루스') }">checked</c:if>>재즈/블루스</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="컨츄리/포크" name="favo2" <c:if test="${fn:contains(favorite2,'컨츄리/포크') }">checked</c:if>>컨츄리/포크</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="클래식/오페라" name="favo2" <c:if test="${fn:contains(favorite2,'클래식/오페라') }">checked</c:if>>클래식/오페라</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="팝" name="favo2" <c:if test="${fn:contains(favorite2,'팝') }">checked</c:if>>팝</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo2" <c:if test="${fn:contains(favorite2,'기타') }">checked</c:if>>기타</div></label>
			
			
			
			</div>
			</div>
			</li>
			<br>
			
			<li style="content:''; display:table;">
			
			
			<div style="width:475px; float:left;">
		        가장 좋아하는 스포츠 경기는?<br>          
		   	 <div style="width:50%; float:left;">
		   	 
			<label><div style="width:100%;"><input type="checkbox" value="BMX/산악자전거" name="favo3" <c:if test="${fn:contains(favorite3,'BMX/산악자전거') }">checked</c:if>>BMX/산악자전거</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="걷기" name="favo3" <c:if test="${fn:contains(favorite3,'걷기') }">checked</c:if>>걷기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="격투기" name="favo3" <c:if test="${fn:contains(favorite3,'격투기') }">checked</c:if>>격투기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="골프" name="favo3" <c:if test="${fn:contains(favorite3,'골프') }">checked</c:if>>골프</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="극한스포츠" name="favo3" <c:if test="${fn:contains(favorite3,'극한스포츠') }">checked</c:if>>극한스포츠</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="낙하산/번지점프" name="favo3" <c:if test="${fn:contains(favorite3,'낙하산/번지점프') }">checked</c:if>>낙하산/번지점프</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="낚시" name="favo3" <c:if test="${fn:contains(favorite3,'낚시') }">checked</c:if>>낚시</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="넷볼" name="favo3" <c:if test="${fn:contains(favorite3,'넷볼') }">checked</c:if>>넷볼</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="농구" name="favo3" <c:if test="${fn:contains(favorite3,'농구') }">checked</c:if>>농구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="다이빙" name="favo3" <c:if test="${fn:contains(favorite3,'다이빙') }">checked</c:if>>다이빙</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="다트" name="favo3" <c:if test="${fn:contains(favorite3,'다트') }">checked</c:if>>다트</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="등산/압벽등반" name="favo3" <c:if test="${fn:contains(favorite3,'등산/압벽등반') }">checked</c:if>>등산/압벽등반</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="라크로스" name="favo3" <c:if test="${fn:contains(favorite3,'라크로스') }">checked</c:if>>라크로스</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="럭비" name="favo3" <c:if test="${fn:contains(favorite3,'럭비') }">checked</c:if>>럭비</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="레슬링" name="favo3" <c:if test="${fn:contains(favorite3,'레슬링') }">checked</c:if>>레슬링</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="모토스포츠" name="favo3" <c:if test="${fn:contains(favorite3,'모토스포츠') }">checked</c:if>>모토스포츠</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="미식축구" name="favo3" <c:if test="${fn:contains(favorite3,'미식축구') }">checked</c:if>>미식축구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="배구" name="favo3" <c:if test="${fn:contains(favorite3,'배구') }">checked</c:if>>배구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="보디빌딩" name="favo3" <c:if test="${fn:contains(favorite3,'보디빌딩') }">checked</c:if>>보디빌딩</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="보트/요트" name="favo3" <c:if test="${fn:contains(favorite3,'보트/요트') }">checked</c:if>>보트/요트</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="복싱" name="favo3" <c:if test="${fn:contains(favorite3,'복싱') }">checked</c:if>>복싱</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="볼링" name="favo3" <c:if test="${fn:contains(favorite3,'볼링') }">checked</c:if>>볼링</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="사냥/사격" name="favo3" <c:if test="${fn:contains(favorite3,'사냥/사격') }">checked</c:if>>사냥/사격</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="서핑" name="favo3" <c:if test="${fn:contains(favorite3,'서핑') }">checked</c:if>>서핑</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="설상차운전" name="favo3" <c:if test="${fn:contains(favorite3,'설상차운전') }">checked</c:if>>설상차운전</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="수영" name="favo3" <c:if test="${fn:contains(favorite3,'수영') }">checked</c:if>>수영</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="스케이트보드" name="favo3" <c:if test="${fn:contains(favorite3,'스케이트보드') }">checked</c:if>>스케이트보드</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="스쿠버다이빙/스노클링" name="favo3" <c:if test="${fn:contains(favorite3,'스쿠버다이빙/스노클링') }">checked</c:if>>스쿠버다이빙/스노클링</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="스쿼시/라켓볼" name="favo3" <c:if test="${fn:contains(favorite3,'스쿼시/라켓볼') }">checked</c:if>>스쿼시/라켓볼</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="스키/스노보드" name="favo3" <c:if test="${fn:contains(favorite3,'스키/스노보드') }">checked</c:if>>스키/스노보드</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="승마" name="favo3" <c:if test="${fn:contains(favorite3,'승마') }">checked</c:if>>승마</div></label>
			
			
		    
		     </div>                
		   	 <div style="width:50%; float:left;">
		   	 
			<label><div style="width:100%;"><input type="checkbox" value="싸이클링" name="favo3" <c:if test="${fn:contains(favorite3,'싸이클링') }">checked</c:if>>싸이클링</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="아이스스케이팅/아이스하키" name="favo3" <c:if test="${fn:contains(favorite3,'아이스스케이팅/아이스하키') }">checked</c:if>>아이스스케이팅/아이스하키</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="야구/소프트볼" name="favo3" <c:if test="${fn:contains(favorite3,'야구/소프트볼') }">checked</c:if>>야구/소프트볼</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="양궁" name="favo3" <c:if test="${fn:contains(favorite3,'양궁') }">checked</c:if>>양궁</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="에어로빅" name="favo3" <c:if test="${fn:contains(favorite3,'에어로빅') }">checked</c:if>>에어로빅</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="요가/필라테스" name="favo3" <c:if test="${fn:contains(favorite3,'요가/필라테스') }">checked</c:if>>요가/필라테스</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="윈드서핑/연날리기" name="favo3" <c:if test="${fn:contains(favorite3,'윈드서핑/연날리기') }">checked</c:if>>윈드서핑/연날리기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="육상" name="favo3" <c:if test="${fn:contains(favorite3,'육상') }">checked</c:if>>육상</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="인라인스케이팅" name="favo3" <c:if test="${fn:contains(favorite3,'인라인스케이팅') }">checked</c:if>>인라인스케이팅</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="자동차경주" name="favo3" <c:if test="${fn:contains(favorite3,'자동차경주') }">checked</c:if>>자동차경주</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="자전거타기" name="favo3" <c:if test="${fn:contains(favorite3,'자전거타기') }">checked</c:if>>자전거타기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="제트/수상스키" name="favo3" <c:if test="${fn:contains(favorite3,'제트/수상스키') }">checked</c:if>>제트/수상스키</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="조깅/달리기" name="favo3" <c:if test="${fn:contains(favorite3,'조깅/달리기') }">checked</c:if>>조깅/달리기</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="조정" name="favo3" <c:if test="${fn:contains(favorite3,'조정') }">checked</c:if>>조정</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="체조" name="favo3" <c:if test="${fn:contains(favorite3,'체조') }">checked</c:if>>체조</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="축구" name="favo3" <c:if test="${fn:contains(favorite3,'축구') }">checked</c:if>>축구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="카누/카약" name="favo3" <c:if test="${fn:contains(favorite3,'카누/카약') }">checked</c:if>>카누/카약</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="크리켓" name="favo3" <c:if test="${fn:contains(favorite3,'크리켓') }">checked</c:if>>크리켓</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="탁구" name="favo3" <c:if test="${fn:contains(favorite3,'탁구') }">checked</c:if>>탁구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="테니스/배드민턴" name="favo3" <c:if test="${fn:contains(favorite3,'테니스/배드민턴') }">checked</c:if>>테니스/배드민턴</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="포켓볼/당구" name="favo3" <c:if test="${fn:contains(favorite3,'포켓볼/당구') }">checked</c:if>>포켓볼/당구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="폴로" name="favo3" <c:if test="${fn:contains(favorite3,'폴로') }">checked</c:if>>폴로</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="피겨스케이팅" name="favo3" <c:if test="${fn:contains(favorite3,'피겨스케이팅') }">checked</c:if>>피겨스케이팅</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="하이킹" name="favo3" <c:if test="${fn:contains(favorite3,'하이킹') }">checked</c:if>>하이킹</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="하키" name="favo3" <c:if test="${fn:contains(favorite3,'하키') }">checked</c:if>>하키</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="행글라이딩/패러글라이딩" name="favo3" <c:if test="${fn:contains(favorite3,'행글라이딩/패러글라이딩') }">checked</c:if>>행글라이딩/패러글라이딩</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="헬스클럽/웨이트트레이닝" name="favo3" <c:if test="${fn:contains(favorite3,'헬스클럽/웨이트트레이닝') }">checked</c:if>>헬스클럽/웨이트트레이닝</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="협곡타기/동굴탐험" name="favo3" <c:if test="${fn:contains(favorite3,'협곡타기/동굴탐험') }">checked</c:if>>협곡타기/동굴탐험</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="호주식축구" name="favo3" <c:if test="${fn:contains(favorite3,'호주식축구') }">checked</c:if>>호주식축구</div></label>
			<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo3" <c:if test="${fn:contains(favorite3,'기타') }">checked</c:if>>기타</div></label>
			
			</div>
			
			
			</li>
			
			</ul>
	</div>
	</div>
		<div style="width: 100%; height: 30px;"></div>
			<div style="width: 100%; height: 30px;">
				<button type="submit" style="width:120px; height:40px; font-size:18px; box-shadow: 3px 3px 8px 1px gray;">수정완료</button>
			</div>
	</form>
</div>
<div style="width: 100%; height: 30px;"></div>
	
	
	<jsp:include page="/tail.jsp" />