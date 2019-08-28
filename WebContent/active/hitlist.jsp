<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/head.jsp" />

<style type="text/css">
	.allzz {
		color: #666666;
	}
</style>
<!-- 나우서버 변수선언 -->
<c:set var="nows" value="${param.nowserver }"/>
<div class="allzz" style="width:100%; min-width:1200px; max-width:1800px;">
	<!-- 몇명중 몇명 -->
	<div style="width:100%; min-width:1200px; height:40px; float:left; margin-top:20px;">
		<div style="width:100px; height:40px; float:left; margin-left:100px;">
			
		</div>
		<div style="width:20%; height:40px; float:right; margin-right:50px; text-align:right;">
			
		</div>
	</div>		

	<!-- 회원정보를 담을 큰 DIV -->
	<div style="width:80%; margin-left:auto; margin-right:auto; display:flex; flex-wrap:wrap;">
	
	<!-- 하트에서 온건지 룩에서 온건지 확인 -->
	<c:choose>		
		<c:when test="${itis == 'way1' }">
			<!-- 룩미 -->
			<!-- 회원 없을때 -->	
				<c:if test="${lmvcount == '0' }">
					<div style="width:100%; height:20px;"></div>
					<div align=center style="width:90%; height:180px; margin-top:50px; padding-top:120px; border:0.1px solid #CCC;">
						본 회원 없음
					</div>
				</c:if>
			<c:forEach var="lmv" items="${lmv }">
				
				<!-- 회원한명 -->
				<div style="width:31%; min-width:300px; height:0px; padding-bottom:15%; margin:10px; display:flex; flex-wrap:wrap; background-color:white; overflow:hidden; box-shadow:3px 3px 8px 1px gray;">					
					<!-- 회원사진 -->
					<div style="width:50%; height:0px; padding-bottom:50%; background-color:white;">
						<div style="background-image:url(/cupid/upload/${lmv.profilepicture }); background-position:50%; background-repeat:no-repeat; background-size:cover; width:80%; height:0px; padding-bottom:84%; float:left; overflow:hidden;">
						</div>
					</div>
					<a href="Profile.do?nowserver=${nows }&email=${lmv.email}">
					<!-- 회원정보 -->
					<div style="width:50%; height:0px; padding-bottom:58%; overflow:hidden;">
						<div style="width:100%; height:0px; padding-bottom:15%; margin-top:5%; text-align:center; font-weight:600;">
							<font size=4>${lmv.name }</font>
						</div>
						<div style="width:100%; height:0px; padding-bottom:15%; margin-top:5%;">
							<font size=3 style="margin-left:10%;">${lmv.addr},${lmv.age }</font>
						</div>						
						<div style="width:100%; height:0px; padding-bottom:15%; margin-top:5%;">
							<font size=2 style="margin-left:5%;">${lmv.whoami }</font>
						</div>
						</a>
						<div style="width:100%; height:0px; padding-bottom:18%; margin-top:15%; display:flex; flex-wrap:wrap;">
						</div>
						
					</div>					
				</div>				
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:if test="${mvcount == '0' }">
					<div style="width:100%; height:20px;"></div>
					<div align=center style="width:90%; height:180px; margin-top:50px; padding-top:120px; border:0.1px solid #CCC;">
						호감 있는 회원 없음
					</div>
			</c:if>
			<c:forEach var="mv" items="${mv }">
				<!-- 회원한명 -->
				<div style="width:31%; min-width:300px; height:0px; padding-bottom:15%; margin:10px; display:flex; flex-wrap:wrap; background-color:white; overflow:hidden; box-shadow:3px 3px 8px 1px gray;">					
					<!-- 회원사진 -->
					<div style="width:50%; height:0px; padding-bottom:50%; background-color:white;">
						<div style="background-image:url(/cupid/upload/${mv.profilepicture }); background-position:50%; background-repeat:no-repeat; background-size:cover; width:80%; height:0px; padding-bottom:84%; float:left; overflow:hidden;">							
						</div>
					</div>
					<a href="Profile.do?nowserver=${nows }&email=${mv.email}">
					<!-- 회원정보 -->
					<div style="width:50%; height:0px; padding-bottom:58%; overflow:hidden;">
						<div style="width:100%; height:0px; padding-bottom:15%; margin-top:5%; text-align:center; font-weight:600;">
							<font size=4>${mv.name } </font>
						</div>
						<div style="width:100%; height:0px; padding-bottom:15%; margin-top:5%;">
							<font size=3 style="margin-left:10%;">${mv.addr },${mv.age }</font>
						</div>						
						<div style="width:100%; height:0px; padding-bottom:15%; margin-top:5%;">
							<font size=2 style="margin-left:5%;">${mv.whoami }</font>
						</div>
					</a>
						<div style="width:100%; height:0px; padding-bottom:18%; margin-top:15%; display:flex; flex-wrap:wrap;">
						</div>
					</div>
				</div>							
			</c:forEach>
		</c:otherwise>
	</c:choose>

	
<!-- 페이지이동 -->
<!-- 목록부분 -->
<c:set var="pageNum" value="${currentPage }" />	<!-- 현재 페이지 값 -->
<c:set var="num_per_block" value="${pageSize }" />	<!-- 한페이지당 출력할 블럭 수 -->
<c:set var="page_per_block" value="12" />	<!-- 블럭당 출력할 링크 수 -->
<c:set var="count" value="${count }" />		<!-- 총 게시물 수 -->

<!-- 총 페이지 수 -->
<fmt:parseNumber var="total_page" value="${Math.ceil(count / num_per_block) }" integerOnly="true" />
<!-- 총 블럭 수 -->
<fmt:parseNumber var="total_block" value="${Math.ceil(total_page / page_per_block) }" integerOnly="true" />
<!-- 블럭 수 -->
<fmt:parseNumber var="block" value="${Math.ceil(pageNum / page_per_block) }" integerOnly="true" />

<!-- 첫 페이지 -->
<c:set var="first_page" value="${(block - 1)  * page_per_block}"/>

<!-- 끝 페이지 -->
<c:set var="last_page" value="${block * page_per_block }"/>
<c:if test="${total_block <= block}">
	<c:set var="last_page" value="${total_page }"/>
</c:if>

<!-- 하트에서 넘어온건지 룩미에서 온건지 체크 -->
<c:if test="${lv == null }">
	<div style="float:left; width:100%; height:0px; padding-bottom:8%; color:#565656;">
		<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
			<c:if test="${block > 1 }">
				<c:set var="my_page" value="1" />
				<a href="ActiveHeartMe.do?pageNum=${my_page }">
					<b>&#60;&#60;</b> 처음페이지
				</a>
			</c:if>
		</div>
		
		<!-- 이전페이지 -->
		
		<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
			<c:if test="${block > 1 }">
				<c:set var="my_page" value="${first_page }" />
				<a href="ActiveHeartMe.do?pageNum=${my_page }">
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
					<a href="ActiveHeartMe.do?pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
				</c:if>
			</c:forEach>
		</div>
		
		<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
		
		<!-- 다음페이지 -->
		
		<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
			<c:if test="${block < total_block }">
				<c:set var="my_page2" value="${last_page + 1 }" />
				<a href="ActiveHeartMe.do?pageNum=${my_page2 }">
					다음페이지로 <b>&#62;</b>
				</a>
			</c:if>
		</div>
		
		<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
			<c:if test="${block < total_block }">
				<c:set var="my_page2" value="${count }" />
				<a href="ActiveHeartMe.do?pageNum=${my_page2 }">
					마지막페이지 <b>&#62;&#62;</b>
				</a>
			</c:if>
		</div>
	</div>
</c:if>
<c:if test="${cv == null }">
	<div style="float:left; width:100%; height:0px; padding-bottom:8%; color:#565656;">
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="1" />
			<a href="ActiveLookMe.do?pageNum=${my_page }">
				<b>&#60;&#60;</b> 처음페이지
			</a>
		</c:if>
	</div>
	
	<!-- 이전페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="${first_page }" />
			<a href="ActiveLookMe.do?pageNum=${my_page }">
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
				<a href="ActiveLookMe.do?pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
			</c:if>
		</c:forEach>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
	
	<!-- 다음페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${last_page + 1 }" />
			<a href="ActiveHeartMe.do?pageNum=${my_page2 }">
				다음페이지로 <b>&#62;</b>
			</a>
		</c:if>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${count }" />
			<a href="ActiveLookMe.do?pageNum=${my_page2 }">
				마지막페이지 <b>&#62;&#62;</b>
			</a>
		</c:if>
	</div>
</div>
</c:if>

<!-- 광고 -->
<div style="width:100%; min-width:1200px; float:left; height:150px;">
	<div style="width:25%; float:left; height:0px; padding-bottom:7%;"></div>
	<div style="width:50%; float:left; height:0px; padding-bottom:7%;">
		<img src="/cupid/img/ads2.jpg" style="width:100%;">
	</div>
	<div style="width:25%; float:left; height:0px; padding-bottom:7%;"></div>
</div>	
</div>		
<jsp:include page="/tail.jsp" />