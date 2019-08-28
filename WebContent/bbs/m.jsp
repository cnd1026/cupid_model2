<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/head.jsp" />
<script>
	function send(del){
		if(confirm("삭제하시렵니까?")){
			
		}else{
			return false;
		}
	}
</script>
<style>
.etc {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.del:hover{
	color:red;
}
</style>
<div style="width:100%; height:50px; min-width:1200px; float:left; background-color:#929ADD;">
	<div style="margin-top:10px; margin-left:20px;">
		<font size=4 color=white>받은메세지</font>
	</div>
</div>
<div style="width:60%; margin:0 auto; overflow:hidden; padding-top:5px;" >
<!-- 여백 -->
</div>

<c:choose>
	<c:when test="${count =='0' }">
		<div style="width:60%; margin:0 auto; overflow:hidden; margin-top:20px; margin-bottom:20px; height:300px;  box-shadow:3px 3px 8px 1px gray; display:table; padding-top:170px; text-align:center">받은메세지없음</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="m" items="${m }">
			<form name="mdel" onsubmit="return send()" action="ReceiveMessageDelete.do?sendemail=${m.sendemail }&&receiveemail=${m.receiveemail}" method="post">
			<div style="width:60%; min-width:900px; height:110px; margin:auto; border-bottom:1px solid; margin-top:20px;">
				<div onclick="location.href='Profile.do?email=${m.sendemail}'"
						style="border-radius:50px; float:left; width:10%; height:100px;
						 			background-image:url(/cupid/upload/${m.profilepicture}); background-position:50%;
						 			background-repeat:no-repeat; background-size:cover;">
				</div>
				<div style="float:left; width:80%; height:100px">
					<div style="float:left; height:50%; text-align:left; padding-left:5px;"><font size=6.5 color=#929ADD><b>${m.name }</b></font></div>
					<div style="float:left; height:50%"><img src="<c:choose>
							<c:when test="${m.level=='3' }">
								/cupid/img/platinum.png
							</c:when>
							<c:when test="${m.level=='2' }">
								/cupid/img/gold.png
							</c:when>
							<c:when test="${m.level=='1' }">
								
							</c:when>
							<c:otherwise>
								/cupid/img/god.png
							</c:otherwise>
						</c:choose>" style="height:70%; margin-top:8px; margin-left:6px;"></div>
					<div style="float:left; height:50%;"><p style="padding-top:0px; padding-left:5px;">${m.age}ㆍ${m.addr} </p></div>
					<div onclick="location.href='MessageView.do?email=${m.sendemail}'" class="etc" style="float:left; width:100%; height:50%; padding-left:10px;">
						${m.comment }
					</div>
				</div>
				<div style="float:left; width:10%; height:85px; text-align:right;">
					<span style="color:#929ADD;">${m.date }</span>
				</div>
				
				<div style="float:left; width:10%; height:20px; text-align:right">
					<button type="submit" style="cursor:pointer; border:1px solid white; color:#929ADD; background:white; padding-bottom:2px;"><span class="del">삭제</span></button>
				</div>
			</div>
			</form>
			</c:forEach>
			 
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
				
				<div style="float:left; width:100%; height:0px; padding-bottom:8%; color:#565656;">
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
					<c:if test="${block > 1 }">
						<c:set var="my_page" value="1" />
						<a href="Message.do?email=${sessionScope.email}&pageNum=${my_page }">
							<b>&#60;&#60;</b> 처음페이지
						</a>
					</c:if>
				</div>
				
				<!-- 이전페이지 -->
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
					<c:if test="${block > 1 }">
						<c:set var="my_page" value="${first_page }" />
						<a href="Message.do?email=${sessionScope.email}&pageNum=${my_page }">
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
							<a href="Message.do?email=${sessionScope.email}&pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
						</c:if>
					</c:forEach>
				</div>
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
				
				<!-- 다음페이지 -->
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
					<c:if test="${block < total_block }">
						<c:set var="my_page2" value="${last_page + 1 }" />
						<a href="Message.do?email=${sessionScope.email}&pageNum=${my_page2 }">
							다음페이지로 <b>&#62;</b>
						</a>
					</c:if>
				</div>
				
				<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
					<c:if test="${block < total_block }">
						<c:set var="my_page2" value="${count }" />
						<a href="Message.do?email=${sessionScope.email}&pageNum=${my_page2 }">
							마지막페이지 <b>&#62;&#62;</b>
						</a>
					</c:if>
				</div>
			</div>
	</c:otherwise>
</c:choose>



<jsp:include page="/tail.jsp" />
