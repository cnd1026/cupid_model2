<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
		if (signin.land.value == "") {
			alert("주소를 입력하세요.");
			return false;
		}
		if (signin.area.value == "") {
			alert("주소를 입력하세요.");
			return false;
		}
		if(signin.terms.checked == false){
			alert("개인정보 취급 방침에 동의해주세요.");
			signin.terms.focus();
			return false;
		}
	}
</script>
<script>
var area0 = new Array("-선택-","");
var area1 = new Array("춘천","원주","강릉","동해","태백","속초","삼척","홍천","횡성","영월","평창","정선","철원","화천","양구","인제","고성","양양");
var area2 = new Array("수원","성남","의정부","안양","부천","광명","평택","동두천","안산","고양","과천","구리","남양주","오산","시흥","군포","의왕","하남","용인","파주","이천","안성","김포","화성","광주","양주","포천","여주","연천","가평","양평");
var area3 = new Array("창원","진주","통영","사천","김해","밀양","거제","양산","의령","함안","창녕","고성","남해","하동","산청","함양","거창","합천");
var area4 = new Array("포항","경주","김천","안동","구미","영주","영천","상주","문경","경산","군위","의성","청송","영양","영덕","청도","고령","성주","칠곡","예천","봉화","울진","울릉");
var area5 = new Array("동구","서구","남구","북구","광산구");
var area6 = new Array("중구","동구","서구","남구","북구","수성구","달서구","달성군");
var area7 = new Array("동구","중구","서구","유성구","대덕구");
var area8 = new Array("중구","서구","동구","영도구","부산진구","동래구","남구","북구","해운대구","사하구","금정구","강서구","연제구","수영구","사상구","기장군");
var area9 = new Array("종로구","중구","용산구","성동구","광진구","동대문구","중량구","성북구","강북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","금천구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구");
var area10 = new Array("반곡동","소담동","보람동","대편동","가람동","한솥동","나성동","새롬동","다정동","어진동","종촌동","고운동","아름동","도담동","조치원읍","연기면","연동면","부강면","금남면","장군면","연서면","전의면","전동면","소정면");
var area11 = new Array("중구","남구","동구","북구","울주군");
var area12 = new Array("중구","동구","미추홀구","연수구","남동구","부평구","계양구","서구","강화군","옹진군");
var area13 = new Array("목포","여수","순천","나주","광양","담양","곡성","구례","고흥","보성","화순","장흥","강진","해남","영암","무안","함평","영광","장성","완도","진도","신안");
var area14 = new Array("전주","군산","익산","정읍","남원","김제","완주","진안","무주","장수","임실","순창","고창","부안");
var area15 = new Array("제주","서귀포");
var area16 = new Array("천안","공주","보령","아산","서산","논산","계룡","당진","금산","부여","서천","청양","홍성","예산","태안");
var area17 = new Array("청주","충주","제천","보은","옥천","영동","증평","진천","괴산","음성","단양");

function areachange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signin.area;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = area' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = area' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    temp.options[0].selected=true;
    return true;
}
</script>
<script>
var day0 = new Array("-선택-","");
var day1 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
var day2 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29");
var day3 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
var day4 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
var day5 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
var day6 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
var day7 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
var day8 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
var day9 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
var day10 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");
var day11 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
var day12 = new Array("01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31");

function daychange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signin.day;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = day' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = day' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect); 
    }
    temp.options[0].selected=true;
    return true;
}
</script>
</head>
<body>
<!-- 배경 사진 -->
<div style="width:100%; height:100%; background-image: url(/cupid/img/hhhhh.png);  background-repeat: no-repeat; background-position:50%; background-size: cover; opacity : 0.8; z-index:-1; position:absolute;">
</div>

<div style="width:100%; height:50px;"></div>
<div class="loginform" style="width:600px; height:610px;">
	<form name="signin" onsubmit="return send()" action="SignInProc.do" method="post">
	<table width="600px" height="600px" align="center" style="font-size: 15px;">
		<tr>
			<td height="12%" colspan="3" align="center">
				<font size="5" color="#FFF"><b>간단한 회원가입</b></font>
			</td>
		</tr>
		<tr>
			<td width="20%" height="8%" align="right" style="color:#DDD;">
				이메일
			</td>
			<td colspan="2">
				<input type="email" name="email" placeholder="email@example.com" class="lgnform">
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				비밀번호
			</td>
			<td colspan="2">
				<input type="password" name="password" minlength="6" maxlength="12" placeholder="6자리 이상 입력해주세요 " class="lgnform">
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
				<input type="text" name="name" class="lgnform" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				생년월일
			</td>
			<td colspan="2">

				<select name="year" class="age">
					<c:forEach var="i" begin="1900" end="${years }" step="1">
						<option value=${i }
							<c:if test="${i == '2000' }">
								selected
							</c:if>
						>${i }</option>
					</c:forEach>
				</select>
				<font style="color:white;">&nbsp;년</font>
				<select class=age name="month" onChange=javascript:daychange(document.signin.month.options.selectedIndex);>
					<option selected value="">-선택-</option>
					<option value=01>1</option>
					<option value=02>2</option>
					<option value=03>3</option>
					<option value=04>4</option>
					<option value=05>5</option>
					<option value=06>6</option>
					<option value=07>7</option>
					<option value=08>8</option>
					<option value=09>9</option>
					<option value=10>10</option>
					<option value=11>11</option>
					<option value=12>12</option>
				</select>
				<font style="color:white;">&nbsp;월</font>
				<select class=age name="day" size=1>
					<option selected value="">-선택-</option>
					<option value=""></option>
				</select>
				<font style="color:white;">&nbsp;일</font>
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				성별
			</td>
			<td colspan="2" style="color:#DDD; padding-left:30px;">
				<label title="남성"> <input type="radio" name="gender" value="남자" style="width:20px; height:20px; position:relative; top:6px;"><font size=4>&nbsp;남자</font></label>
				<label title="여성"> <input type="radio" name="gender" value="여자" style="width:20px; height:20px; position:relative; top:6px;"><font size=4>&nbsp;여자</font></label>
			</td>
		</tr>
		<tr>
			<td height="8%" align="right" style="color:#DDD;">
				간편주소
			</td>
			<td colspan="2" style="color:#DDD; padding-left:30px;">
				<select class=age name="land" onChange=javascript:areachange(document.signin.land.options.selectedIndex); style="width:100px; padding-left:10px;">
					<option selected value="">-선택-</option>
					<option value=강원도>강원도</option>
					<option value=경기도>경기도</option>
					<option value=경상남도>경상남도</option>
					<option value=경상북도>경상북도</option>
					<option value=광주>광주</option>
					<option value=대구>대구</option>
					<option value=대전>대전</option>
					<option value=부산>부산</option>
					<option value=서울>서울</option>
					<option value=세종>세종</option>
					<option value=울산>울산</option>
					<option value=인천>인천</option>
					<option value=전라남도>전라남도</option>
					<option value=전라북도>전라북도</option>
					<option value=제주도>제주도</option>
					<option value=충청남도>충청남도</option>
					<option value=충청북도>충청북도</option>
				</select>
				<select class=age name="area" size=1 style="width:100px; padding-left:10px;">
					<option selected value="">-선택-</option>
					<option value=""></option>
				</select>
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
				<input type="checkbox" name="terms" style="width:17px; height:17px; position:relative; top:6px;"> 예,<a href="" style="color:#F99;">이용 약관</a> 및 <a href="" style="color:#F99;">개인 정보 취급 방침</a> 에 동의합니다
			</td>
			<td></td>
		</tr>
		<tr>
			<td height="9%" colspan="3" align="center">
				<button type="submit" class="lgnbtn">회원가입하기</button>
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>