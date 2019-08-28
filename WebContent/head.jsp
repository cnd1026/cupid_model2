<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="head_addr" value="/cupid"/>

<c:set var="nowserver" value="${param.nowserver }" />

<c:choose>
	<c:when test="${nowserver == '1' }">
		<c:set var="joinserver" value="울산"/>
	</c:when>
	<c:when test="${nowserver == '2' }">
		<c:set var="joinserver" value="부산"/>
	</c:when>
	<c:when test="${nowserver == '3' }">
		<c:set var="joinserver" value="경상남도"/>
	</c:when>
	<c:when test="${nowserver == '4' }">
		<c:set var="joinserver" value="경상북도"/>
	</c:when>
	<c:when test="${nowserver == '5' }">
		<c:set var="joinserver" value="충청남도"/>
	</c:when>
	<c:when test="${nowserver == '6' }">
		<c:set var="joinserver" value="충청북도"/>
	</c:when>
	<c:when test="${nowserver == '7' }">
		<c:set var="joinserver" value="강원도"/>
	</c:when>
	<c:when test="${nowserver == '8' }">
		<c:set var="joinserver" value="경기도"/>
	</c:when>
	<c:when test="${nowserver == '9' }">
		<c:set var="joinserver" value="대구"/>
	</c:when>
	<c:when test="${nowserver == '10' }">
		<c:set var="joinserver" value="인천"/>
	</c:when>
	<c:when test="${nowserver == '11' }">
		<c:set var="joinserver" value="광주"/>
	</c:when>
	<c:when test="${nowserver == '12' }">
		<c:set var="joinserver" value="대전"/>
	</c:when>
	<c:when test="${nowserver == '13' }">
		<c:set var="joinserver" value="제주도"/>
	</c:when>
	<c:when test="${nowserver == '14' }">
		<c:set var="joinserver" value="서울"/>
	</c:when>
	<c:when test="${nowserver == '15' }">
		<c:set var="joinserver" value="세종"/>
	</c:when>
	<c:when test="${nowserver == '16' }">
		<c:set var="joinserver" value="전라남도"/>
	</c:when>
	<c:when test="${nowserver == '17' }">
		<c:set var="joinserver" value="전라북도"/>
	</c:when>
	<c:otherwise>
		<c:set var="joinserver" value="전체"/>
	</c:otherwise>
</c:choose>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="/cupid/img/gogo.png">
		
		<title>Cupid</title>
	
		<!-- 스타일 -->
		<style type="text/css">
			html,body{ padding:0px; margin:0px; }
			
			a{	text-decoration:none;	}
			
			.wrap{}
			.wrap div{width:100%; text-align:center; font-size:20px; font-weight:700; color:#fff;}
			
			.top_bar_fix{position:fixed; top:0; left:0; width:100%; z-index:1}
			.pd_top_50{padding-top:50px;}

			.wrap .top_bn_zone{width:100%; min-width:1200px; height:100px; background:#444444; line-height:100px; text-align:center; overflow:hidden;}
			.wrap .top_fix_zone{width:100%; min-width:1200px; height:50px; background:#5A61A0; line-height:50px;}
			
			.wrap .top_fix_zone ul{
			height:50px;
			list-style:none;
			margin:0;
			padding:0;
			}
			
			.wrap .top_fix_zone li{
			width:12.5%;
			height:50px;
			float:left;
			padding:0px;
			}
			
			.wrap .top_fix_zone li a{
			background: #5A61A0;
			color:#EEEEEE;
			display:block;
			height:50px;
			margin:0px;
			padding:0px 25px;
			text-align:center;
			text-decoration:none;
			}
			
			.wrap .top_fix_zone li a:hover, .wrap .top_fix_zone ul li:hover a{
			background: #6A81C0;
			color:#FFFFFF;
			text-decoration:none;
			}
			
			.wrap .top_fix_zone li ul{
			display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
			height:auto;
			padding:0px;
			margin:0px;
			border:0px;
			position:absolute;
			z-index:200;
			/*top:1em;
			/*left:0;*/
			}
			
			.wrap .top_fix_zone li:hover ul{
			display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
			}
			
			.wrap .top_fix_zone li li {
			background: #858290;
			display:block;
			float:none;
			margin:0px;
			padding:0px;
			width:200px;
			}
			
			.wrap .top_fix_zone .menu100 li {
			background: #858290;
			display:block;
			float:none;
			margin:0px;
			padding:0px;
			width:170%;
			}
			
			.wrap .top_fix_zone .air a{
			background: #445555;
			heigt:10px;
			line-height:20px;
			display:block;
			float:none;
			margin:0px;
			padding:0px;
			width:100%;
			}
			
			.wrap .top_fix_zone li:hover li a{
			background:none;
			}
			
			.wrap .top_fix_zone li ul a{
			display:block;
			height:50px;
			font-size:14px;
			font-style:normal;
			margin:0px;
			padding:0px 10px 0px 15px;
			text-align:left;
			}
			
			.wrap .top_fix_zone li ul a:hover, .wrap .top_fix_zone li ul li:hover a{
			background: rgb(71,71,71);
			border:0px;
			color:#ffffff;
			text-decoration:none;
			}
			
			.wrap .top_fix_zone p{
			clear:left;
			}
			
			.wrap .top_fix_zone .server {
			margin-top : 5px;
			margin-left : calc(100% - 160px);
			width : 150px;
			height : 40px;
			padding-bottom : 10px;
			border : 2px solid #B0A;
			border-radius: 10px;
			background-color : black;
			opacity:0.7;
			color : #FFF;
			font-size : 15px;
			font-weight : 500;
			text-align : center;
			}
			
			.bubble {
			position: relative;
			width: 250px;
			height: 120px;
			padding: 0px;
			background: #FFFFFF;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			border: #7F7F7F solid 2px;
			}
			
			.bubble:after {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 15px 15px 15px 0;
			border-color: transparent #FFFFFF;
			display: block;
			width: 0;
			z-index: 0;
			left: -15px;
			top: 45px;
			}
			
			.bubble:before {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 16px 16px 16px 0;
			border-color: transparent #7F7F7F;
			display: block;
			width: 0;
			z-index: 0;
			left: -18px;
			top: 44px;
			}
			
			.bubbleme {
			position: relative;
			width: 250px;
			height: 120px;
			padding: 0px;
			background: #FFFFFF;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			border: #7F7F7F solid 2px;
			}

			.bubbleme:after {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 15px 0 15px 15px;
			border-color: transparent #FFFFFF;
			display: block;
			width: 0;
			z-index: 0;
			left: calc(100% - 1px);
			top: 45px;
			}
			
			.bubbleme:before {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 17px 0 17px 17px;
			border-color: transparent #7F7F7F;
			display: block;
			width: 0;
			z-index: 0;
			left: calc(100%);
			top: 43px;
			}
		</style>
		
		<!-- 제이쿼리 -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

		<!-- 스크립트 -->
		<script type="text/javascript">
			$(document).ready(function(){
				
				var topBar = $("#topBar").offset();
				
				$(window).scroll(function(){
					
					var docScrollY = $(document).scrollTop()
					var barThis = $("#topBar")
					var fixNext = $("#fixNextTag")

					if ( docScrollY > topBar.top ) {
						barThis.addClass("top_bar_fix");
						fixNext.addClass("pd_top_50");
					} else {
						barThis.removeClass("top_bar_fix");
						fixNext.removeClass("pd_top_50");
					}
				});
			})
			
			var sessionTime = true;
			
			window.onbeforeunload = doSessionTime;
			
			function doSessionTime() {
			  if (sessionTime == true) {
			    window.open("/cupid/SessionTimeProc.do", "Synchronizing cluster....", "location=0,menubar=0,statusbar=1,width=10,height=10");
			  }
			  else {
			    return;
			  }
			}
			/* 세션값 없을때 로그인처리 */
			if (${sessionScope.level==null}) {
							alert("로그인 하셔야 이용할 수 있습니다.");
							document.location.href="Login.do";
						}
			
		</script>
	</head>
	<body>
		<div class="wrap">
			<div class="top_bn_zone">
				<img src="/cupid/img/ads.jpg" style="height:100px;">
			</div>			
			<div class="top_fix_zone" id="topBar">
				<ul>
					 <li><a href="Index.do?nowserver=${nowserver}">홈</a></li>
					 <li><a href="Server.do?nowserver=${nowserver}">지 역</a></li>
					 <li><a href="NowLoginMember.do?nowserver=${nowserver}">접속중회원</a></li>
					 <li><a href="AllMember.do?nowserver=${nowserver}">모든회원</a></li>
					<!-- 플레티넘, 운영자만 접근가능 -->
					 <c:if test="${sessionScope.level == 3  || sessionScope.level == 10}">
					 	<li><a href="Chat.do?nowserver=${nowserver}">실시간채팅</a></li>
					 </c:if>
					 <c:if test="${sessionScope.level != 3 && sessionScope.level != 10 }">
					 	<li><a href="Hogu1.do?nowserver=${nowserver }" onclick="alert('플레티넘만 이용가능한 페이지입니다. 결제페이지로 이동합니다.');"> 실시간채팅</a></li>
					 </c:if>
					 <li><a style="cursor:default;">메세지</a>
						<ul>
					     <li><a href="MessageReceiveView.do?nowserver=${nowserver}&&email=${sessionScope.email}">받은 메세지</a></li>
					     <li><a href="MessageSendView.do?nowserver=${nowserver}&&email=${sessionScope.email}">보낸 메세지</a></li>
					    </ul>
					 </li>
					 <li><a id="current" style="cursor:default;">활 동</a>
						<ul>
						     <li><a href="ActiveHeartMe.do?nowserver=${nowserver}">나에게 호감이 있는 회원</a></li>
						     <li><a href="ActiveLookMe.do?nowserver=${nowserver}">나의 프로필을 본 상대</a></li>
						     <li class="air"></li>
						     <li><a href="ActiveHeartYou.do?nowserver=${nowserver}">내가 보낸 호감</a></li>
						     <li><a href="ActiveLookYou.do?nowserver=${nowserver}">내가 본 상대 프로필</a></li>
					    </ul>
					 </li>
					 <li><a style="cursor:default;">마이페이지</a>
						<ul class="menu100">
							<li><a href="Profile.do?nowserver=${nowserver}&&email=${sessionScope.email }">프로필 보기</a></li>
							<li><a href="ProfileModify.do?nowserver=${nowserver}">프로필 수정</a></li>
							<!-- 운영자만 접근가능 -->
							<c:if test="${sessionScope.level == 10}">
								<li><a href="AdminMemlv.do?nowserver=${nowserver}">회원관리</a></li>
							</c:if>
							<c:if test="${sessionScope.level != 10}">
								<li><a href="Hogu1.do?nowserver=${nowserver}">결제</a></li>
							</c:if>
							<li><a href="MemberModify.do?nowserver=${nowserver}">회원정보 수정</a></li>
							<li><a href="Logout.do">로그아웃</a></li>
							
						</ul>
					 </li>
				</ul>
				<div class="server" style="z-index:2;">
					지역 : ${joinserver }
				</div>
			</div>
			<div id="fixNextTag">	</div>
		</div>

