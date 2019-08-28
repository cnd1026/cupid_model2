<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/head.jsp" />

 <style>
 	html {
 	color : #666666;
 	}
 	select {
 	color : #666666;
 	}
 </style>
  <meta charset="UTF-8">
  <title>Document</title>
 </head>
 <body>
<script>
	function searchThere() {
		if (parseInt(firstAge.value) > parseInt(lastAge.value)) {
			alert("최소나이가 최대나이보다 많을 수 없습니다.");
		} else {
			document.searchThat.submit();
		}
	}
</script>

<div style="width:100%; height:50px; min-width:1200px; float:left; background-color:#929ADD;">
	<div style="margin-top:10px; margin-left:20px;">
		<font size=4 color=white>
		<c:choose>
			<c:when test="${nowserver == 100 }">
				접속 회원 검색
			</c:when>
			<c:otherwise>
				서버에 접속 회원 검색
			</c:otherwise>
		</c:choose>
		</font>
	</div>
</div>

<div style="width:100%; min-width:1200px; height:6%; float:left;">
	<div style="width:95%; min-width:950px; height:100px; margin-left:auto; margin-right:auto; box-shadow:3px 3px 8px 1px gray;">
		<form name="searchThat" action="SearchNowLoginMember.do" method="post">
		<div style="width:20%; height:100px; float:left; text-align:center;">
			<div style="width:100%; height:15px; float:left;"></div>
			<div style="width:100%; height:35px; float:left; text-align:center;">
				성 별
			</div>
			<div style="width:20%; height:50px; float:left;"></div>
			<div style="width:60%; height:50px; float:left;">
					<select name="searchgender" style="width:100%; height:30px; padding-left:10%; font-size:100%; border:0px solid black; border-bottom:1px solid black;">
						<option value="남자" <c:if test="${gender == '남자' }">selected</c:if>>남 자</option>
						<option value="여자" <c:if test="${gender == '여자' }">selected</c:if>>여 자</option>
					</select>
			</div>
		</div>
	
		<div style="width:20%; height:100px; float:left; text-align:center;">
			<div style="width:100%; height:15px; float:left;"></div>
			<div style="width:100%; height:35px; float:left; text-align:center;">
				거 주 지
			</div>
			<div style="width:20%; height:50px; float:left;"></div>
			<div style="width:60%; height:50px; float:left; text-align:center;">
					<select name="searchserver" style="width:100%; height:30px; padding-left:10%; font-size:100%; border:0px solid black; border-bottom:1px solid black;">
						<option value="100" <c:if test="${nowserver == 100 }">selected</c:if>>상관없음</option>
						<option value="1" <c:if test="${nowserver == 1 }">selected</c:if>>울 산</option>
						<option value="2" <c:if test="${nowserver == 2 }">selected</c:if>>부 산</option>
						<option value="3" <c:if test="${nowserver == 3 }">selected</c:if>>경상남도</option>
						<option value="4" <c:if test="${nowserver == 4 }">selected</c:if>>경상북도</option>
						<option value="5" <c:if test="${nowserver == 5 }">selected</c:if>>충청남도</option>
						<option value="6" <c:if test="${nowserver == 6 }">selected</c:if>>충청북도</option>
						<option value="7" <c:if test="${nowserver == 7 }">selected</c:if>>강원도</option>
						<option value="8" <c:if test="${nowserver == 8 }">selected</c:if>>경기도</option>
						<option value="9" <c:if test="${nowserver == 9 }">selected</c:if>>대 구</option>
						<option value="10" <c:if test="${nowserver == 10 }">selected</c:if>>인 천</option>
						<option value="11" <c:if test="${nowserver == 11 }">selected</c:if>>광 주</option>
						<option value="12" <c:if test="${nowserver == 12 }">selected</c:if>>대 전</option>
						<option value="13" <c:if test="${nowserver == 13 }">selected</c:if>>제주도</option>
						<option value="14" <c:if test="${nowserver == 14 }">selected</c:if>>서 울</option>
						<option value="15" <c:if test="${nowserver == 15 }">selected</c:if>>세 종</option>
						<option value="16" <c:if test="${nowserver == 16 }">selected</c:if>>전라남도</option>
						<option value="17" <c:if test="${nowserver == 17 }">selected</c:if>>전라북도</option>
					</select>
			</div>
		</div>
	
		<div style="width:20%; height:100px; float:left; text-align:center;">
			<div style="width:100%; height:15px; float:left;"></div>
			<div style="width:100%; height:35px; float:left; text-align:center;">
				회 원 등 급
			</div>
			<div style="width:20%; height:50px; float:left;"></div>
			<div style="width:60%; height:50px; float:left; text-align:center;">
					<select name="searchlevel" style="width:100%; height:30px; padding-left:10%; font-size:100%; border:0px solid black; border-bottom:1px solid black;">
						<option value="4" <c:if test="${levelgo == 4 }">selected</c:if>>상관없음</option>
						<option value="3" <c:if test="${levelgo == 3 }">selected</c:if>>플레티넘 회원</option>
						<option value="2" <c:if test="${levelgo == 2 }">selected</c:if>>골드 회원</option>
						<option value="1" <c:if test="${levelgo == 1 }">selected</c:if>>일반 회원</option>
					</select>
			</div>
		</div>
	
		<div style="width:20%; height:100px; float:left; text-align:center;">
			<div style="width:100%; height:15px; float:left;"></div>
			<div style="width:100%; height:35px; float:left; text-align:center;">
				나 이
			</div>
			<div style="width:20%; height:50px; float:left;"></div>
			<div style="width:20%; height:50px; float:left; text-align:center;">
					<select id="firstAge"  name="searchfirstage" style="width:100%; height:30px; padding-left:10%; font-size:100%; border:0px solid black; border-bottom:1px solid black;">
						<c:forEach var="i" begin="1" end="121" step="1">
							<option value="${i }" <c:if test="${firstage == i }">selected</c:if>>${i }</option>
						</c:forEach>
					</select>
			</div>
			<div style="width:20%; height:50px; float:left; text-align:center;">
				<div style="width:100%; height:5px; float:left;"></div>
				~
			</div>
			<div style="width:20%; height:50px; float:left; text-align:center;">
				<select id="lastAge" name="searchlastage" style="width:100%; height:30px; padding-left:10%; font-size:100%; border:0px solid black; border-bottom:1px solid black;">
						<c:forEach var="i" begin="1" end="121" step="1">
							<option value="${i }" <c:if test="${lastage == i }">selected</c:if>>${i }</option>
						</c:forEach>
					</select>
			</div>
		</div>
		</form>
	
		<div style="width:19%; height:100px; float:left; text-align:center;">
			<div style="width:100%; height:30px; float:left;"></div>
			<div style="width:20%; height:70px; float:left; text-align:center;"></div>
			<div onclick="searchThere()" style="width:50%; height:35px; float:left; text-align:center; border:1px solid #EEEEEE; cursor:pointer; box-shadow:3px 3px 8px 1px gray;">
				<div style="width:100%; height:5px; float:left;"></div>
					<font size=4><b>검 색</b></font>
			</div>
		</div>
	</div>
</div>

<!--margin-top 2%-->
<div style="width:100%; height:30px; float:left;"></div>

<!-- 몇명중 몇명 -->
<div style="width:100%; min-width:1200px; height:40px; float:left;">
	<div style="width:100px; height:40px; float:left; margin-left:100px;">
		<font size=4>total : ${count }</font>
	</div>
	<div style="width:20%; height:40px; float:right; margin-right:50px; text-align:right;">
		
	</div>
</div>

<!-- 회원 보기 -->
<div style="width:100%; min-width:1200px; float:left;">
	<div style="width:90%; margin-left:auto; margin-right:auto; padding-left:10%;">
	
		<c:forEach var="vs" items="${vs }">
			<a href="Profile.do?nowserver=${nowserver}&&email=${vs.email }">
				<!-- 플레티넘일때 -->
				<c:choose>
					<c:when test="${vs.level == '3' }">
						<!--플레티넘껍질-->
						<div style="width:30%; height:0px; padding-bottom:27%; float:left; overflow:hidden;">
							<!--플레티넘실제껍질-->
							<div style="margin:5px; overflow:hidden; border:1px solid #CCCCCC; box-shadow:3px 3px 8px 1px gray;">
								<!--플레사진-->
								<div style="background-image:url(/cupid/upload/${vs.profilepicture }); background-position:50%; background-repeat:no-repeat; background-size:cover; width:48%; height:0px; padding-bottom:84%; float:left; overflow:hidden;">
									<div style="width:30%; float:right;">
										<image src="/cupid/img/platinum.png" style="width:100%;">
									</div>
								</div>
								<!--플레설명-->
								<div style="width:50%; height:0px; padding-bottom:84%; float:left;">
									<div style="width:100%; height:0px; padding-bottom:8%;"></div>
									<!--이름-->
									<div style="width:100%; text-align:center;">
										<font size=5><b>${vs.name }</b></font>
									</div>
									<div style="width:100%; height:0px; padding-bottom:5%;"></div>
									<div style="width:95%; padding-bottom:5%; padding-left:5%;">
										<font size=3>${vs.addr }, ${vs.age }</font>
									</div>
									<div style="width:100%; height:0px; padding-bottom:5%;"></div>
									<div style="width:90%; height:0px; padding-bottom:85.8%; padding-left:5%; overflow:hidden;">
										<font size=3>자기소개<br>${vs.whoami }</font>
									</div>
									<div style="width:100%; height:0px; padding-bottom:3%;"></div>
									<div style="width:100%; position:relitive; height:0px; padding-bottom:21.3%; overflow:hidden; padding-left:5%; padding-right:5%;">
										
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
					<!-- 그 외에 -->
						<!--일반껍질-->
						<div style="width:15%; height:0px; padding-bottom:27%; float:left;">
							<!--일반실제껍질-->
							<div style="margin:5px; overflow:hidden; border:1px solid #CCCCCC; box-shadow:3px 3px 8px 1px gray;">
								<!--일반사진-->
								<div style="background-image:url(/cupid/upload/${vs.profilepicture }); background-position:50%; background-repeat:no-repeat; background-size:cover; width:100%; height:0px; padding-bottom:84%; float:left; overflow:hidden; border-bottom:1px solid #CCCCCC;">
									<div style="width:30%; float:right;">
											<c:if test="${vs.level == '10' }">
												<image src="/cupid/img/god.png" style="width:100%;">
											</c:if>
											<c:if test="${vs.level == '2' }">
												<image src="/cupid/img/gold.png" style="width:100%;">
											</c:if>
									</div>
								</div>
								<!--일반설명-->
								<div style="width:100%; height:0px; padding-bottom:89%; float:left;">
									<!--이름-->
									<div style="width:100%; text-align:center;">
										<font size=4><b>${vs.name }</b></font>
									</div>
									<div style="width:100%; height:0px; padding-bottom:2%;"></div>
									<div style="width:95%; padding-left:5%;">
										<font size=2>${vs.addr }, ${vs.age }</font>
									</div>
									<div style="width:100%; height:0px; padding-bottom:2%;"></div>
									<div style="width:95%; height:0px; padding-bottom:35%; padding-left:5%; overflow:hidden;">
										<font size=2>${vs.whoami }</font>
									</div>
									<div style="width:90%; height:0px; padding-bottom:25%; overflow:hidden; padding-left:5%; padding-right:5%;">
										
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</a>
		</c:forEach>
	</div>
</div>


	<!-- 목록부분 -->
	<c:set var="platinum" value="${searchPlatinumCount }" />	<!-- 현재 페이지 값 -->
	<c:set var="count" value="${count }" />					<!-- 총 게시물 수 -->
	<c:set var="pageNum" value="${currentPage }" />	<!-- 현재 페이지 값 -->
	<c:set var="page_per_block" value="5" />				<!-- 블럭당 출력할 링크 수 -->
	
	<!-- 총 페이지 수 -->
	<fmt:parseNumber var="total_page" value="${Math.ceil((( platinum ) + count ) / 18) }" integerOnly="true" />
	<!-- 총 블럭 수 -->
	<fmt:parseNumber var="total_block" value="${Math.ceil( total_page / page_per_block) }" integerOnly="true" />
	<!-- 현재 블럭 -->
	<fmt:parseNumber var="block" value="${Math.ceil( pageNum / page_per_block) }" integerOnly="true" />
	
	<!-- 첫 페이지 -->
	<c:set var="first_page" value="${(block - 1) * page_per_block }"/>
	
	<!-- 끝 페이지 -->
	<c:set var="last_page" value="${block * page_per_block }"/>
	
	<c:if test="${total_block <= block }">
		<c:set var="last_page" value="${total_page }" />
	</c:if>
	
<div style="float:left; width:100%; min-width:1200px; height:0px; padding-bottom:8%; color:#565656;">
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="1" />
			<a href="SearchNowLoginMember.do?searchserver=${nowserver }&pageNum=${my_page }&searchgender=${gender }&searchlevel=${levelgo }&searchfirstage=${firstage }&searchlastage=${lastage }">
				<b>&#60;&#60;</b> 처음페이지
			</a>
		</c:if>
	</div>
	
	<!-- 이전페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="${first_page }" />
			<a href="SearchNowLoginMember.do?searchserver=${nowserver }&pageNum=${my_page }&searchgender=${gender }&searchlevel=${levelgo }&searchfirstage=${firstage }&searchlastage=${lastage }">
				<b>&#60;</b> 이전페이지로
			</a>
		</c:if>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%;"></div>
	
	<!-- 페이징 출력 처리 -->
	
	<div style="float:left; width:30%; height:0px; padding-bottom:8%; text-align:center;">
		<c:forEach var="i" begin="${first_page + 1 }" end="${last_page }">
			<c:if test="${pageNum == i }">
				<font style="font-size:28px; color:#000;">${i }&nbsp;</font>
			</c:if>
			<c:if test="${pageNum != i }">
				<a href="SearchNowLoginMember.do?searchserver=${nowserver }&pageNum=${i }&searchgender=${gender }&searchlevel=${levelgo }&searchfirstage=${firstage }&searchlastage=${lastage }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
			</c:if>
		</c:forEach>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
	
	<!-- 다음페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${last_page + 1 }" />
			<a href="SearchNowLoginMember.do?searchserver=${nowserver }&pageNum=${my_page2 }&searchgender=${gender }&searchlevel=${levelgo }&searchfirstage=${firstage }&searchlastage=${lastage }">
				다음페이지로 <b>&#62;</b>
			</a>
		</c:if>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${total_page }" />
			<a href="SearchNowLoginMember.do?searchserver=${nowserver }&pageNum=${my_page2 }&searchgender=${gender }&searchlevel=${levelgo }&searchfirstage=${firstage }&searchlastage=${lastage }">
				마지막페이지 <b>&#62;&#62;</b>
			</a>
		</c:if>
	</div>
</div>


<!-- 광고 -->
<div style="width:100%; min-width:1200px; float:left; height:150px;">
	<div style="width:25%; float:left; height:0px; padding-bottom:7%;"></div>
	<div style="width:50%; float:left; height:0px; padding-bottom:7%;">
		<img src="/cupid/img/ads2.jpg" style="width:100%;">
	</div>
	<div style="width:25%; float:left; height:0px; padding-bottom:7%;"></div>
</div>


<jsp:include page="/tail.jsp" />
