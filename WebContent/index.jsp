<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/head.jsp" %>

<div style="width:100%; height:50px; min-width:1200px; background-color:#929ADD;">
	<div style="padding-top:10px; margin-left:20px;">
		<font size=4 color=white>홈</font>
	</div>
</div>

<div style="width:100%; height:20px;"></div>
<div align=center style="width:1300px; margin-left:auto; margin-right:auto;">
			
	
	<div align=center style="float:left; width:60px; height:30px; font-size:14px; color:#565656; background-color:#fff;">
		
	</div>
	<div style="width: 90%; height: 97%;">
	
	<!-- 내용시작부분 -->
	
	<c:choose>
		<c:when test="${count == '0' }">
			<div style="width:100%; height:20px;"></div>
			<div align=center style="width:90%; height:180px; margin-top:50px; padding-top:120px; border:0.1px solid #CCC;">
				게시글 없음
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="posts" items="${vi }">				
				<div style="width:100%; height:20px;"></div>
					<div style="width:930px; height:200px; box-shadow:3px 3px 8px 1px gray; padding:10px; font-size:16px;">
						<a href="Profile.do?nowserver=${nowserver }&email=${posts.email}">
						<!-- 사진 -->
						<c:choose>
							<c:when test="${posts.file_rename == null }">
								<div style="width:150px; height:200px; border:0.1px solid #CCC; background-color:#DEF; float:left;"></div>
							</c:when>
							<c:when test="${posts.file_rename == '' }">
								<div style="width:150px; height:200px; border:0.1px solid #CCC; background-color:#DEF; float:left;"></div>
							</c:when>
							<c:otherwise>
								<div style="width:150px; height:200px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${posts.file_rename}); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
							</c:otherwise>
						</c:choose>
						<!-- 공백 -->
						<div style="width:29px; height:200px; float:left;"></div>
						<!-- 내용 -->
						<div style="width:590px; height:200px; float:left; text-align:left;">
							<!-- 이름 -->
							<div style="width:200px; height:30px; float:left;">
								<!-- 썸네일 사진 -->
								<div style="width:25px; height:25px; margin-top:2px; margin-left:5px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${posts.profilepicture}); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
							&nbsp; ${posts.name }
							</div>
							<!-- 이름 옆에 공백 -->
							<div style="width:390px; height:30px; float:left;"></div>
							<!-- 설명 -->
							<div style="width:590px; height:150px; margin-top:20px; float:left; overflow:hidden; font-size:16px;">
							<!-- 개행처리 -->
							<% pageContext.setAttribute("newLineChar", "\n"); %>
							${fn:replace(posts.write, newLineChar, "<br/>")}
							</div>
						</div>
						<!-- 세로공백 -->
						<div style="width:10px; height:200px; float:left; background-color:#EEE;"></div>
						<!-- 기타 -->
						<div style="width:150px; height:200px; float:left; text-align:center;">
							
							<!-- 등급 -->
							<div style="width:150px; height:90px; background-image:url(
								<c:choose>
									<c:when test="${posts.level=='3' }">
										/cupid/img/platinum.png
									</c:when>
									<c:when test="${posts.level=='2' }">
										/cupid/img/gold.png
									</c:when>
									<c:when test="${posts.level=='1' }">
										/cupid/img/dogpig.png
									</c:when>
									<c:otherwise>
										/cupid/img/god.png
									</c:otherwise>
								</c:choose>
							); background-position:50%; background-repeat:no-repeat; background-size:90px 90px;"></div>
							<!-- 조회수 -->
							<div style="width:150px; height:30px;"></div>
							<!-- 서버 -->
							<div style="width:150px; height:35px; padding-top:5px;">
								서버 : ${posts.server }
							</div>
							<!-- 날짜 -->
							<div style="width:150px; height:25px; padding-top:15px;">${posts.date }</div>
						</div>
						</a>
					</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

	</div>
	
		<!-- 목록부분 -->
		
	<div style="width: 100%; height: 0px; padding-bottom: 3%;"></div>
	<c:set var="pageNum" value="${currentPage }" />	<!-- 현재 페이지 값 -->
	<c:set var="num_per_block" value="${pageSize }" />	<!-- 한페이지당 출력할 블럭 수 -->
	<c:set var="page_per_block" value="5" />				<!-- 플럭당 출력할 링크 수 -->
	<c:set var="count" value="${count }" />					<!-- 총 게시물 수 -->
	
	<!-- 총 페이지 수 -->
	<fmt:parseNumber var="total_page" value="${Math.ceil(count / num_per_block) }" integerOnly="true" />
	<!-- 총 블럭 수 -->
	<fmt:parseNumber var="total_block" value="${Math.ceil(total_page / page_per_block) }" integerOnly="true" />
	<!-- 블럭 수 -->
	<fmt:parseNumber var="block" value="${Math.ceil(pageNum / page_per_block) }" integerOnly="true" />
	
	<!-- 첫 페이지 -->
	<c:set var="first_page" value="${(block - 1) * page_per_block }"/>
	
	<!-- 끝 페이지 -->
	<c:set var="last_page" value="${block * page_per_block }"/>
	
	<c:if test="${total_block <= block }">
		<c:set var="last_page" value="${total_page }" />
	</c:if>
	
	<div style="float:left; width:100%; height:0px; padding-bottom:8%; color:#565656;"></div>
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="1" />
			<a href="Index.do?nowserver=${nowserver }&pageNum=${my_page }">
				<b>&#60;&#60;</b> 처음페이지
			</a>
		</c:if>
	</div>
	
	<!-- 이전페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="${first_page }" />
			<a href="Index.do?nowserver=${nowserver }&pageNum=${my_page }">
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
				<a href="Index.do?nowserver=${nowserver }&pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
			</c:if>
		</c:forEach>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
	
	<!-- 다음페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${last_page + 1 }" />
			<a href="Index.do?nowserver=${nowserver }&pageNum=${my_page2 }">
				다음페이지로 <b>&#62;</b>
			</a>
		</c:if>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${count }" />
			<a href="Index.do?nowserver=${nowserver }&pageNum=${my_page2 }">
				마지막페이지 <b>&#62;&#62;</b>
			</a>
		</c:if>
	</div>
</div>

<jsp:include page="/tail.jsp" />