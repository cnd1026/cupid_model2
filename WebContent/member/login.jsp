<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/cupid/home.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--		로그인부분		-->
<script type="text/javascript">
	function send() {
		if (login.email.value == "") {
			alert("이메일을 입력하세요.");
			login.email.focus();
			return false;
		}
		if (login.email.value.length < 4) {
			alert("4자 이상 입력하세요.");
			login.email.focus();
			return false;
		}
		if (login.password.value == "") {
			alert("비밀번호를 입력하세요.");
			login.password.focus();
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
		<div style="width:25%; font-size:20px; font-weight:700; color:#FFF;">회원로그인</div>
		<form name="login" onsubmit="return send()" action="LoginProc.do" method="post">
			<div style="margin-top:5%;">
				<label>이메일</label>
				<div>
					<div style="width:100%; height:10px;"></div>
					<div>
						<input type="email" name="email" placeholder="예시)email@email.com"
							class="lgnform" style="color:#000; font-weight:700; font-size:17px;">
					</div>
					<div style="width:100%; height:10px;"></div>
				</div>
			</div>
			<div>
				<label>비밀번호</label>
				<div>
					<div style="width:100%; height:10px;"></div>
					<div>
						<input type="password" name="password" class="lgnform" minlength=6 maxlength=12 placeholder="비밀번호">
					</div>
					<div style="width:100%; height:10px;"></div>
				</div>
				<div style="width:100%; display:flex; flex:no-wrap;">
					<div align="left" style="width:50%; padding-left:10%;">
						<a href="SignIn.do" style="color:#FFF; font-weight:700;">회원 가입</a>
					</div>
					<div align="right" style="width:50%; padding-right:10%;">
						<a href="member/findid.jsp" style="color:#FFF; font-weight:700;">아이디 찾기</a>
					</div>
				</div>
				<div style="width:100%; height:20px;"></div>
			</div>
			<button type="submit" class="lgnbtn">로그인</button>
		</form>
	</div>
</body>
</html>