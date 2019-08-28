<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="/cupid/home.css"/>

<style>
	html, body {
		margin:0px;
		padding:0px;
	}
	.loginform {
	width:500px;  color: #FFF;
    box-shadow: inset 0 1px 3px #ddd;
    border-radius: 10px; padding:20px;
    margin-left:auto; margin-right:auto;
    background-color:rgba(0,0,0,0.5);
	}
</style>
</head>
<body>
<div style="width:100%; height:100%; background-image: url(/cupid/img/hhhhh.png);  background-repeat: no-repeat; background-position:50%; background-size: cover; opacity : 0.8; z-index:-1; position:absolute;">
</div>
<div style="height:1%;"></div>
<div style="width:200px; height:100px; margin-left:1%; background-repeat: no-repeat; background-image: url(/cupid/img/logo3.png);"></div>
<div class="loginform" align=center>
	<div style="width:25%; font-size:20px; font-weight:700; color:#FFF;">찾기 완료</div>
	<form name="login" action="/cupid/Login.do" method="post">
		<div style="margin-top:5%;">
			<label>이메일</label>
			<div>
				<div style="width:100%; height:10px;">${email }</div>
					
				<div style="width:100%; height:10px;"></div>
			</div>
		</div>
		<div style="margin-top:5%;">
			<label>비밀번호</label>
			<div>
				<div style="width:100%; height:10px;">${password }</div>
				<div style="width:100%; height:10px;"></div>
			</div>
		</div>
		<div style="width:100%; height:10px;"></div>
		<button type="submit" class="lgnbtn">로그인 하러가기</button>
	</form>
</div>
</body>
</html>