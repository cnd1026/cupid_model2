<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/head.jsp" %>

<style>
	.category{
			text-align:center;
			font-size:30px;
	}
	.section{
			text-align:center;
	}
	.section div{
			margin-top: 20px;
			display: inline-table;
		    width: 100px;
		    height: 50px;
		    color:white;
		    border: 1px solid ;
			background:#5A61A0;
	}
	a{
			display: table-cell;
			vertical-align:middle;
			text-decoration:none;
			color:white;
	}
</style>
</head>
<body>
<div style="width:100%; height:50px;"></div>
<div class="category" style="height:50px;">지 역</div>
<div style="width:800px; height:250px; margin-left:auto; margin-right:auto;">
	<div class="section">
		<div><a href="ServerProc.do?nowserver=100">전체</a></div>
		<div><a href="ServerProc.do?nowserver=1">울산</a></div>
		<div><a href="ServerProc.do?nowserver=2">부산</a></div>
		<div><a href="ServerProc.do?nowserver=3">경상남도</a></div>
		<div><a href="ServerProc.do?nowserver=4">경상북도</a></div>
		<div><a href="ServerProc.do?nowserver=5">충청남도</a></div>
		<div><a href="ServerProc.do?nowserver=6">충청북도</a></div>
	</div>
	<div class="section">
		<div><a href="ServerProc.do?nowserver=7">강원도</a></div>
		<div><a href="ServerProc.do?nowserver=8">경기도</a></div>
		<div><a href="ServerProc.do?nowserver=9">대구</a></div>
		<div><a href="ServerProc.do?nowserver=10">인천</a></div>
		<div><a href="ServerProc.do?nowserver=11">광주</a></div>
		<div><a href="ServerProc.do?nowserver=12" >대전</a></div>
		<div><a href="ServerProc.do?nowserver=13">제주도</a></div>
	</div>
	<div class="section" style="width:500px; margin-left:26.5px; text-align:left;">
		<div style="text-align:center;"><a href="ServerProc.do?nowserver=14">서울</a></div>
		<div style="text-align:center;"><a href="ServerProc.do?nowserver=15">세종</a></div>
		<div style="text-align:center;"><a href="ServerProc.do?nowserver=16">전라남도</a></div>
		<div style="text-align:center;"><a href="ServerProc.do?nowserver=17">전라북도</a></div>
	</div>
</div>
<div style="width:100%; height:100px;"></div>

<%@ include file="/tail.jsp" %>