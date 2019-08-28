<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" type="text/css" href="/cupid/home.css"/>
<script type="text/javascript">
	function send() {
		if (login.name.value == "") {
			alert("이름을 입력하세요.");
			login.email.focus();
			return false;
		}
	}
</script>
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
	<div style="width:100%; font-size:15px; font-weight:700; color:#FFF; text-align: left;">
		<a href="/cupid/Login.do" style="cursor:pointer; color: #FFF;">뒤로</a>
	</div>
	<div style="width:35%; font-size:20px; font-weight:700; color:#FFF;">비밀번호 찾기</div>
	<div style="width:100%; font-size:15px; font-weight:700; color:#FFF;">이메일 : ${email }</div>
	<form name="login" onsubmit="return send()" action="FindPw.do" method="post">
	<input type="hidden" name="email" value="${email }">
		<div style="margin-top:5%;">
			<label>이름</label>
			<div>
				<div style="width:100%; height:10px;"></div>
				<div>
					<input type="text" name="name" placeholder="ex) 김갑환"
						class="lgnform" style="color:#000; font-weight:700; font-size:17px;">
				</div>
				<div style="width:100%; height:10px;"></div>
			</div>
		</div>
		<div style="width:100%; height:10px;"></div>
		<button type="submit" class="lgnbtn">확 인</button>
	</form>
</div>