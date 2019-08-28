<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="date" class="java.util.Date"/>
<fmt:formatDate var="years" value="${date }" type="date" pattern="yyyy"/>

<!--		회원가입부분		-->
<style type="text/css">
	html, body {
	margin:0px;
	padding:0px;
	}
	table{	border-spacing:0px;	}
	td{	padding:0px; }
	a{	text-decoration:none;	}
	.loginform{width:500px;  color: #FFF;
    box-shadow: inset 0 1px 3px #ddd;
    border-radius: 10px; padding:20px;
    margin-left:auto; margin-right:auto;
	}
	.lgnform{width:400px;  color: #565656;
    padding: .5rem; border: 1px solid #ccc; box-shadow: inset 0 1px 3px #ddd;
    border-radius: 4px; vertical-align: middle; box-sizing: border-box; font-size: inherit; margin-left: 10px;
	}
	.lgnbtn{
	background-color:#929add; color:#fff; position:relative; overflow:hidden; font-size: 1.2rem; width:400px; padding:.5rem;
	}
	.age{
	width:80px; padding:.5rem; border: 1px solid #ccc; box-shadow: inset 0 1px 3px #ddd; border-radius: 4px; vertical-align: middle; box-sizing: border-box; font-size: inherit; margin-left: 10px; padding-top: 5px; padding-bottom: 5px;
	}
	.loginform {
    border-radius: 10px;
    margin-left:auto; margin-right:auto;
    background-color:rgba(0,0,0,0.5);
	}
</style>

<script type="text/javascript">
	function send() {
		if (signin.name.value == "") {
			alert("이름을 입력하세요.");
			signin.name.focus();
			return false;
		}
		if (signin.gender.value == "") {
			alert("성별을 입력하세요.");
			signin.gender.focus();
			return false;
		}
		if (signin.password.value == "") {
			alert("비밀번호를 입력하세요.");
			signin.password.focus();
			return false;
		}
		if (signin.password_re.value != signin.password.value) {
			alert("비밀번호가 같지 않습니다..");
			signin.password_re.focus();
			return false;
		}
		if (signin.email.value == "") {
			alert("이메일을 입력하세요.");
			signin.email.focus();
			return false;
		}
		if (signin.month.value == "") {
			alert("생년월일을 입력하세요.");
			signin.email.focus();
			return false;
		}
		if (signin.day.value == "") {
			alert("생년월일을 입력하세요.");
			signin.email.focus();
			return false;
		}
		if(signin.terms.checked == false){
			alert("개인정보 취급 방침에 동의해주세요.");
			signin.terms.focus();
			return false;
		}
	}
</script>

</head>
<body>
<!-- 배경 사진 -->
<div style="width:100%; height:100%; background-image: url(/cupid/img/hhhhh.png);  background-repeat: no-repeat; background-position:50%; background-size: cover; opacity : 0.8; z-index:-1; position:absolute;">
</div>

<div style="width:100%; height:100px;"></div>
<div class="loginform" style="width:600px; height:550px;">
	<form name="signin" onsubmit="return send()" action="MemberModifyProc.do" method="post">
		<input type="hidden" name="nowserver" value="${nowserver }">
	<table width="600px" height="500px" align="center" style="font-size: 15px;">
		<tr>
			<td height="15%" colspan="3" align="center">
				<font size="5" color="#FFF"><b>회원정보 수정</b></font>
			</td>
		</tr>
		<tr>
			<td colspan=3 height=40px align=center style="
				<c:choose>
					<c:when test="${sessionScope.level == '1' }">
							color:#FFF 
					</c:when>
					<c:when test="${sessionScope.level == '2' }">
							color:gold 
					</c:when>
					<c:when test="${sessionScope.level == '3' }">
							color:blue
					</c:when>
					<c:otherwise>
							color:#FFF
					</c:otherwise>
				</c:choose>
				;">
				${nongrock }
			</td>
		</tr>
		<tr>
			<td width="20%" height="8%" align="right" style="color:#DDD;">
				이메일
			</td>
			<td colspan="2">
				<input type="email" name="email" placeholder="email@example.com" class="lgnform" value="${me.email }">
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				비밀번호
			</td>
			<td colspan="2">
				<input type="password" name="password" minlength="6" maxlength="12" placeholder="비밀번호 " class="lgnform">
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				비밀번호 확인
			</td>
			<td colspan="2">
				<input type="password" name="password_re" minlength="6" maxlength="20" placeholder="비밀번호 재입력 " class="lgnform">
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				이름
			</td>
			<td colspan="2">
				<input type="text" name="name" class="lgnform" value="${me.name }">
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				생년월일
			</td>
			<td colspan="2">

				<c:set var="age" value="${me.age }" />
				<c:set var="myyear" value="${fn:substring(age,0,4) }" />
				<c:set var="mymonth" value="${fn:substring(age,4,6) }" />
				<c:set var="myday" value="${fn:substring(age,6,8) }" />

				<input type="text" name="year" class="age" value="${myyear }" readonly>
				
				<font style="color:white;">&nbsp;년</font>
				
				<input type="text" name="month" class="age" value="${mymonth }" readonly>
				
				<font style="color:white;">&nbsp;월</font>
				
				<input type="text" name="day" class="age" value="${myday }" readonly>
				
				<font style="color:white;">&nbsp;일</font>
				
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				성별
			</td>
			<td colspan="2" style="color:#DDD; padding-left:30px;">
				<c:choose>
					<c:when test="${me.gender=='남자' }">
						<label title="남성"> <input type="radio" name="gender" value="남자" checked style="width:20px; height:20px; position:relative; top:6px;"><font size=4>&nbsp;남자</font></label>
						<label title="여성"> <input type="radio" name="gender" value="여자" style="width:20px; height:20px; position:relative; top:6px;"><font size=4>&nbsp;여자</font></label>
					</c:when>
					<c:otherwise>
						<label title="남성"> <input type="radio" name="gender" value="남자" style="width:20px; height:20px; position:relative; top:6px;"><font size=4>&nbsp;남자</font></label>
						<label title="여성"> <input type="radio" name="gender" value="여자" checked style="width:20px; height:20px; position:relative; top:6px;"><font size=4>&nbsp;여자</font></label>
					</c:otherwise>
				</c:choose>
				
			</td>
		</tr>
		<tr>
			<td></td>
			<td style="color:#DDD;">
				알파벳 또는 숫자 (6~12 자)를 사용할 수 있습니다. <br>
				추가 보안을 위해 이메일의 패스워드와<br>
				같은 패스워드를 사용하지 마세요.
			</td>
			<td></td>
		</tr>
		<tr>
			<td height="12%"></td>
			<td width="65%" style="color:#DDD;">
				<input type="checkbox" name="terms" checked style="width:17px; height:17px; position:relative; top:6px;"> 예,<a href="" style="color:#F99;">이용 약관</a> 및 <a href="" style="color:#F99;">개인 정보 취급 방침</a> 에 동의합니다
			</td>
			<td></td>
		</tr>
		<tr>
			<td height="9%" colspan="3" align="center">
				<button type="submit" class="lgnbtn">회원수정하기</button>
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>