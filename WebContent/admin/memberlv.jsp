<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/head.jsp"%>

<style>
	.admem{
		background: #5A61A0; color:#EEEEEE; font-weight:bold; font-style:normal; border:1px solid #5A61A0;
	}
	.admem1{
		border:2px solid #5A61A0; text-align:center;
	}
</style>
<form name=lvch action="AdminLvModify.do" method="post">
<table width=1000 align=center>
	<tr>
		<td colspan=5 height=50>
		</td>
	</tr>
	<tr>
		<td class="admem" style="width:300px; height:30px; text-align:center;">이&nbsp;메&nbsp;일
		</td>
		<td class="admem" style="width:200px; height:30px; text-align:center;">이&nbsp;름
		</td>
		<td class="admem" style="width:100px; height:30px; text-align:center;">성&nbsp;별
		</td>
		<td class="admem" style="width:100px; height:30px; text-align:center;">나&nbsp;이
		</td>
		<td class="admem" style="width:140px; height:30px; text-align:center;">등&nbsp;급
		</td>
	</tr>
	<tr>
		<td colspan=5 width=100% height=1>
		</td>
	</tr>
	<c:forEach var="kkk" items="${v }">
	<tr>
		<td class="admem1"><input type=text name="email" value="${kkk.email }" readonly style="border:0px solid black; font-size:15px;">
		</td>
		<td class="admem1">${kkk.name }
		</td>
		<td class="admem1">${kkk.gender }
		</td>
		<!-- 생년월일에서 연도를 불러오고 현재연도 - 생년 +1 처리를 2018-생년처리 -->
		<td class="admem1">${2018-fn:substring(kkk.age,0,4) }
		</td>
		<td class="admem1"><select name="level" value="${kkk.level}" style="width:160px; height:30px; padding-left:10%; font-size:100%; border:0px solid black; border-bottom:1px solid black;">
						<option value="${kkk.level }" selected="">
							<c:if test="${kkk.level == 1 }">일반 회원</c:if>
							<c:if test="${kkk.level == 2 }">골드 회원</c:if>
							<c:if test="${kkk.level == 3 }">플레티넘 회원</c:if>
							<c:if test="${kkk.level == 10 }">운영자</c:if>						
						</option>
						<option value="1">일반 회원</option>
						<option value="2">골드 회원</option>
						<option value="3">플레티넘 회원</option>						
						<option value="10">운영자</option>						
			</select>
		</td>
	</tr>
	</c:forEach>
</table>
<div style="width:100%; height:50px; margin-top:15px; text-align:center;">
	<button onclick="AdminLvModify.do" style="width:90px; height:35px; box-shadow:3px 3px 8px 1px gray;">수정완료</button>
</div>
</form>

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
		<a href="AdminMemlv.do?pageNum=${my_page }">
			<b>&#60;&#60;</b> 처음페이지
		</a>
	</c:if>
</div>

<!-- 이전페이지 -->

<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
	<c:if test="${block > 1 }">
		<c:set var="my_page" value="${first_page }" />
		<a href="AdminMemlv.do?pageNum=${my_page }">
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
			<a href="AdminMemlv.do?pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
		</c:if>
	</c:forEach>
</div>

<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>

<!-- 다음페이지 -->

<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
	<c:if test="${block < total_block }">
		<c:set var="my_page2" value="${last_page + 1 }" />
		<a href="AdminMemlv.do?pageNum=${my_page2 }">
			다음페이지로 <b>&#62;</b>
		</a>
	</c:if>
</div>

<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
	<c:if test="${block < total_block }">
		<c:set var="my_page2" value="${total_page }" />
		<a href="AdminMemlv.do?pageNum=${my_page2 }">
			마지막페이지 <b>&#62;&#62;</b>
		</a>
	</c:if>
</div>








<jsp:include page="/tail.jsp" />