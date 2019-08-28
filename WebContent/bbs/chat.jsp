<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<style>
	.arrow {
		position:relative;
		top:2px;
	}
</style>
<jsp:include page="/head.jsp" />
<%
request.setCharacterEncoding("utf-8");
String nowserver = request.getParameter("nowserver");
%>
<c:set var="nowserver" value="<%=nowserver %>" />
<%
 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String date = sf.format(now);
%>

<c:set var="date" value="<%=date %>" />

<div style="width:97%; height:0px; padding-bottom:3%; float:left; background-color:#929ADD; padding-left:3%; padding-top:1%;">
	<font size=4 color=white>채팅</font>
</div>
<table width=1300px align="center">
	<tr>
		<td align=center>
			<div style="width: 80%; height:100px;">
			<form action="ChatWrite.do?nowserver=${nowserver}&&email=${sessionScope.email }&&date=${date}" method="post">
				<div style="width:80%; margin-top:20px; display:flex; flex-wrap:nowrap;">
					<div style="width:10%; padding-top:10px;">
						채팅
					</div>
					<div style="width:80%; padding-top:11px;">
						<input type=text name="comment" maxlength="150" placeholder="150자 이내로 작성하시오." style="width:100%; height:25px;">
					</div>
					<div style="width:10%; padding-top:10px;">
						<button type="submit">입력</button>
					</div>
				</div>
			</form>
			</div>
			<div style="width: 80%;">
				<c:forEach var="view" items="${v }">
				<div style="width: 90%; height:120px; margin-top:10px; display:flex; flex-wrap:nowrap;">
					<c:choose>
						<c:when test="${view.email == sessionScope.email }">
							<div style="width:13.5%; height:120px;"></div>
							<div style="width:71%; display:flex; flex-wrap:wrap;" class="bubbleme">
								<div style="width:73%; text-align:left; padding-left:10px;">${view.name }</div>
								<div style="width:23%; text-align:right;padding-right:5px;">${view.date }</div>
								 <div style="width:99%; text-align:left; padding-top:10px; padding-left:10px;">${view.comment }</div>
							</div>
							<div style="width:1.5%; height:120px;"></div>
							<div style="width: 110px; height:110px; border-radius:50%; overflow:hidden; border:0.5px solid #CCC; 
										background-image: url(/cupid/upload/${view.profilepicture });
										background-position: 50%; background-repeat: no-repeat;
										background-size: cover; height:120px;">
							</div>
						</c:when>
						<c:otherwise>
							<a href="Profile.do?nowserver=${nowserver }&email=${view.email}">
							<div style="width: 110px; height:110px; border-radius:50%; overflow:hidden; border:0.5px solid #CCC; 
										background-image: url(/cupid/upload/${view.profilepicture });
										background-position: 50%; background-repeat: no-repeat;
										background-size: cover; height:120px;">
							</div>
							</a>							
							<div style="width:1.5%; height:120px;"></div>
							<div style="width:71%; display:flex; flex-wrap:wrap;" class="bubble">
								<div style="width:73%; text-align:left; padding-left:10px;">${view.name }</div>
								<div style="width:23%; text-align:right;padding-right:5px;">${view.date }</div>
								 <div style="width:99%; text-align:left; padding-top:10px; padding-left:10px;">${view.comment }</div>  
							</div>							
						</c:otherwise>
					</c:choose>
				</div>
				</c:forEach>
			</div>
			<div style="width:100%; height:50px;"></div>
				<!-- 목록부분 -->
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
				
				<div style="float:left; width:100%; height:0px; padding-bottom:8%; color:#565656;">
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
					<c:if test="${block > 1 }">
						<c:set var="my_page" value="1" />
						<a href="Chat.do?nowserver=${nowserver }&pageNum=${my_page }">
							<img src="/cupid/img/leftArrow.png" class="arrow"><img src="/cupid/img/leftArrow.png" class="arrow"> 처음페이지
						</a>
					</c:if>
				</div>
				
				<!-- 이전페이지 -->
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
					<c:if test="${block > 1 }">
						<c:set var="my_page" value="${first_page }" />
						<a href="Chat.do?nowserver=${nowserver }&pageNum=${my_page }">
							<img src="/cupid/img/leftArrow.png" class="arrow"> 이전페이지로
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
							<a href="Chat.do?nowserver=${nowserver }&pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
						</c:if>
					</c:forEach>
				</div>
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
				
				<!-- 다음페이지 -->
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
					<c:if test="${block < total_block }">
						<c:set var="my_page2" value="${last_page + 1 }" />
						<a href="Chat.do?nowserver=${nowserver }&pageNum=${my_page2 }">
							다음페이지로 <img src="/cupid/img/rightArrow.png" class="arrow">
						</a>
					</c:if>
				</div>
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
					<c:if test="${block < total_block }">
						<c:set var="my_page2" value="${total_page }" />
						<a href="Chat.do?nowserver=${nowserver }&pageNum=${my_page2 }">
							마지막페이지 <img src="/cupid/img/rightArrow.png" class="arrow"><img src="/cupid/img/rightArrow.png" class="arrow">
						</a>
					</c:if>
				</div>
			</div>
		
		</td>
	</tr>
</table>
<jsp:include page="/tail.jsp" />
