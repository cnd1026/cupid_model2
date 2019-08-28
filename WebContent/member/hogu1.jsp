<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/head.jsp" %>

<style>
	.hoguslevel input[type=radio] {
	    display:none; 
	}
	input[type=radio] + label {
	    display:inline-block;
	    background-color: #FFF;
	}
	input[type=radio],[id=radio1]:checked + label { 
	   background-image: none;
	   background-color:#2A3393;
	   color:#FFF;
	}
	input[type=radio],[id=radio2]:checked + label { 
	   background-image: none;
	   background-color:#EC0;
	}
</style>

<script type="text/javascript">
	function platinum() {
		document.getElementById("12month_1").value="₩ 11,667원";
		document.getElementById("12month_2").value="₩ 140,000 원";
		document.getElementById("3month_1").value="₩ 23,333원";
		document.getElementById("3month_2").value="₩ 70,000 원";
		document.getElementById("1month_1").value="₩ 35,000원";
		document.getElementById("sale1").style.backgroundColor = "#2A3393";
		document.getElementById("sale1").style.color = "#FFF";
		document.getElementById("sale2").style.backgroundColor = "#2A3393";
		document.getElementById("sale2").style.color = "#FFF";
		document.getElementById("check1").style.border = "3px solid #2A3393";
		document.getElementById("check2").style.border = "3px solid #2A3393";
		document.getElementById("check3").style.border = "3px solid #2A3393";
	}

	function gold() {
		document.getElementById("12month_1").value="₩ 10,000원";
		document.getElementById("12month_2").value="₩ 120,000 원";
		document.getElementById("3month_1").value="₩ 20,000원";
		document.getElementById("3month_2").value="₩ 60,000 원";
		document.getElementById("1month_1").value="₩ 30,000원";
		document.getElementById("sale1").style.backgroundColor = "#EC0";
		document.getElementById("sale1").style.color = "#444";
		document.getElementById("sale2").style.backgroundColor = "#EC0";
		document.getElementById("sale2").style.color = "#444";
		document.getElementById("check1").style.border = "3px solid #CA0";
		document.getElementById("check2").style.border = "3px solid #CA0";
		document.getElementById("check3").style.border = "3px solid #CA0";
	}

	function gyuljaes1() {
		document.getElementById("gyuljae1").style.borderRight = "1px solid #EEE";
		document.getElementById("gyuljae1").style.backgroundColor = "#EEE";
		document.getElementById("gyuljae2").style.borderRight = "1px solid #CCC";
		document.getElementById("gyuljae2").style.backgroundColor = "#FFF";
		document.getElementById("gyuljae3").style.borderRight = "1px solid #CCC";
		document.getElementById("gyuljae3").style.backgroundColor = "#FFF";
		document.getElementById("op1").textContent = "◎ 카드종류";
		document.getElementById("op2").textContent = "◎ 할부선택";
		document.getElementById("opo1").style.width = "130px";
		document.getElementById("opo1").style.height = "25px";
		document.getElementById("opo2").textContent = "";
		document.getElementById("opo3").textContent = "";
		document.getElementById("ops1").style.width = "130px";
		document.getElementById("ops1").style.height = "25px";
		document.getElementById("ops2").style.width = "0px";
		document.getElementById("ops2").style.height = "0px";
		document.getElementById("ops3").style.width = "0px";
		document.getElementById("ops3").style.height = "0px";
	}

	function gyuljaes2() {
		document.getElementById("gyuljae1").style.borderRight = "1px solid #CCC";
		document.getElementById("gyuljae1").style.backgroundColor = "#FFF";
		document.getElementById("gyuljae2").style.borderRight = "1px solid #EEE";
		document.getElementById("gyuljae2").style.backgroundColor = "#EEE";
		document.getElementById("gyuljae3").style.borderRight = "1px solid #CCC";
		document.getElementById("gyuljae3").style.backgroundColor = "#FFF";
		document.getElementById("op1").textContent = "◎ 입금은행";
		document.getElementById("op2").textContent = "◎ 입금기한";
		document.getElementById("opo1").style.width = "0px";
		document.getElementById("opo1").style.height = "0px";
		document.getElementById("opo2").textContent = "${ipgeumnalza } 까지 입금";
		document.getElementById("opo3").textContent = "◎ 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.";
		document.getElementById("ops1").style.width = "0px";
		document.getElementById("ops1").style.height = "0px";
		document.getElementById("ops2").style.width = "130px";
		document.getElementById("ops2").style.height = "25px";
		document.getElementById("ops3").style.width = "0px";
		document.getElementById("ops3").style.height = "0px";
	}

	function gyuljaes3() {
		document.getElementById("gyuljae1").style.borderRight = "1px solid #CCC";
		document.getElementById("gyuljae1").style.backgroundColor = "#FFF";
		document.getElementById("gyuljae2").style.borderRight = "1px solid #CCC";
		document.getElementById("gyuljae2").style.backgroundColor = "#FFF";
		document.getElementById("gyuljae3").style.borderRight = "1px solid #EEE";
		document.getElementById("gyuljae3").style.backgroundColor = "#EEE";
		document.getElementById("op1").textContent = "◎ 통 신 사";
		document.getElementById("op2").textContent = "";
		document.getElementById("opo1").style.width = "0px";
		document.getElementById("opo1").style.height = "0px";
		document.getElementById("opo2").textContent = "";
		document.getElementById("opo3").textContent = "";
		document.getElementById("ops1").style.width = "0px";
		document.getElementById("ops1").style.height = "0px";
		document.getElementById("ops2").style.width = "0px";
		document.getElementById("ops2").style.height = "0px";
		document.getElementById("ops3").style.width = "130px";
		document.getElementById("ops3").style.height = "25px";
	}
	
	function hogu_check1() {
		window.open("/cupid/member/hogu_check1.jsp","","width=500,height=600");
	}
	
	function hogu_check2() {
		window.open("/cupid/member/hogu_check2.jsp","","width=500,height=600");
	}
	
	function send() {
		if (document.getElementById("gyu1").checked == true) {
			if (document.getElementById("ops1").value == "") {
				alert("카드를 선택해주세요.");
				return false;
			}
			if (document.getElementById("opo1").value == "") {
				alert("할부 개월을 선택해주세요.");
				return false;
			}
		}
		if (document.getElementById("gyu2").checked == true) {
			if (document.getElementById("ops2").value == "") {
				alert("입금 은행을 선택해주세요.");
				return false;
			}
		}
		if (document.getElementById("gyu3").checked == true) {
			if (document.getElementById("ops3").value == "") {
				alert("통신사를 선택해주세요.");
				return false;
			}
		}
		if (document.getElementById("dong1").checked == false) {
			alert("전자금융거래 약관에 동의해주세요.");
			return false;
		}
		if (document.getElementById("dong2").checked == false) {
			alert("결제대행 서비스 약관에 동의해 주세요.");
			return false;
		}
	}
</script>

<div style="width:800px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:100px;">

<form name="hoguwat" onsubmit="return send()" action="Hogu2.do?nowserver=${nowserver }" method="post">
<input type="hidden" name="nowserver" value="${nowserver }">
	
	<div style="width:100%; height:35px; padding-top:10px; padding-bottom:10px; display:flex; flex-wrap:wrap-reverse;">
		<!-- 1 -->
		<div style="width:29px; height:30px; background-color:#555; text-align:center; padding-left:1px; border-radius:50%; font-size:20px; font-weight:700; color:#FFF; margin-left:340px;">1</div>
		<!--맴버십 선택-->
		<div style="width:120px; height:28px; margin-left:20px; margin-right:20px; font-size:15px;">
			맴버십 선택
			<div style="width:15px; height:40px; float:right; background-image:url(/cupid/img/rightArrow.png); background-size:80%; background-repeat:no-repeat; margin-top:2px;"></div></div>
		<!-- 2 -->
		<div style="width:29px; height:30px; background-color:#CCC; text-align:center; border-radius:50%; font-size:20px; font-weight:700; color:#FFF;">2</div>
		<!--개인 정보-->
		<div style="width:100px; height:28px; margin-left:20px; margin-right:20px; font-size:15px;">
			개인 정보
			<div style="width:15px; height:35px; float:right; background-image:url(/cupid/img/rightArrow.png); background-size:80%; background-repeat:no-repeat; margin-top:2px;"></div></div>
		<!-- 3 -->
		<div style="width:29px; height:30px; background-color:#CCC; text-align:center; border-radius:50%; font-size:20px; font-weight:700; color:#FFF;">3</div>
		<!--영수증-->
		<div style="width:50px; height:28px; margin-left:20px; font-size:15px;">영수증</div>
	</div>

	<!--편리함 어필-->
	<div style="width:100%;">
		<div style="width:100%; height:200px; background-color:#EEEEEE; display:flex; flex-wrap:wrap;">
			<div style="width:200px; height:200px; background-image:url(/cupid/img/paperAirplain.png); background-size:100%; background-repeat:no-repeat;"></div>
			<div style="width:600px; height:200px; display:flex; flex-wrap:wrap;">
				<div style="width:90%; height:60px; margin-top:40px; margin-left:5%; margin-right:5%;">
					<font size=5>무제한 대화를 보내세요<font>
				</div>
				<div style="width:90%; height:70px; margin-top:-40px; margin-left:5%; margin-right:5%; font-size:10px;">
					<font size=3>프리미엄 멤버분들을 다른 회원분들과 메신저를 통해서 대화를 하실 수 있습니다 지금 업그레이드 하시고 무제한 대화를 나누어보세요.</font>
				</div>
			</div>
		</div>
	</div>

	<!--1단계-->
	<div style="width:100%; height:40px; margin-top:5px; background-color:#EEEEEE;">
		<div style="width:30%; height:35px; margin-left:20px; font-size:18px; padding-top:5px;">1단계 - 등급 선택</div>
	</div>

	<!--단계설정-->
	<div style="width:100%; height:75px; margin-top:5px; padding-top:10px; border:0.1px solid #CCCCCC;">
		<div class="hoguslevel" style="width:780px; height:60px; margin:auto; display: flex; flex-wrap: nowrap;">
			<!--플레티넘-->
			<input type="radio" id="radio1" name="hogulevel" value="platinum" checked>
			<label for="radio1">
				<div style="width:390px; height:60px; border:0.1px solid #CCCCCC; cursor:pointer;" onclick="platinum()">
					<div style="width:200px; height:35px; margin:auto; margin-top:15px; text-align:center; font-size:20px; font-weight:500;">플래티넘
					</div>
				</div>
			</label>
			<!--골드-->
			<input type="radio" id="radio2" name="hogulevel" value="gold">
			<label for="radio2">
				<div style="width:390px; height:60px; border:0.1px solid #CCCCCC; cursor:pointer;" onclick="gold()">
					<div style="width:198px; height:35px; margin:auto; margin-top:15px; text-align:center; font-size:23px; font-weight:500;">골드</div>
				</div>
			</label>
		</div>
	</div>

	<!--개월 설정-->
	<!--12개월-->
	<label for="hogu12">
		<div style="width:100%; height:100px; border-bottom:0.1px solid #CCCCCC; display:flex; flex-wrap:nowrap;">
			<div style="width:20%; height:69px; text-align:center; font-size:20px; padding-top:30px; background-color:#F0F4FD;">
				12개월
			</div>
			<!--Radio-->
			<div style="width:8%; height:70px; padding-top:30px;">
				<div id="check1" style="width:37px; height:37px; border:3px solid blue; border-radius:50%; margin-left:auto; margin-right:auto;">
					<input type="Radio" name="gaewol" id="hogu12" value="gmonth1" checked style="width:40px; height:40px; margin:-1px;">
				</div>
			</div>
			<!--금액-->
			<div style="width:45%; height:70px; padding-top:30px;">
				<div style="width:90%; height:37px; margin-left:auto; margin-right:auto; font-weight:500; font-size:23px; color:#666666;">
					<input type="text" id="12month_1" value="₩ 11,667원" style="width:120px; color:#333; border:0px solid black; font-weight:500; font-size:23px;" readonly><font size=1> 월별</font>
				</div>
				<div style="width:90%; height:10px; margin-left:auto; margin-right:auto; font-weight:300; color:#666666; margin-top:-5px; font-size:12px;">
					일시불 결제 <input type="text" id="12month_2" value="₩ 140,000 원" style="border:0px solid black; font-weight:300; color:#666666; font-size:12px;" readonly>
				</div>
			</div>
			<!--금액세이브-->
			<div style="width:27%; height:80px; padding-top:20px;">
				<div id="sale1" style="width:50%; height:45px; padding-top:15px; border-radius:10px; background-color:#545BA8; font-weight:500; font-size:18px; text-align:center; color:#FFF;">
					67% 할인
				</div>
			</div>
		</div>
	</label>
	<!--3개월-->
	<label for="hogu3">
		<div style="width:100%; height:100px; border-bottom:0.1px solid #CCCCCC; display:flex; flex-wrap:nowrap;">
			<div style="width:20%; height:69px; text-align:center; font-size:20px; padding-top:30px; background-color:#F0F4FD;">
				3개월
			</div>
			<!--Radio-->
			<div style="width:8%; height:70px; padding-top:30px;">
				<div id="check2" style="width:37px; height:37px; border:3px solid blue; border-radius:50%; margin-left:auto; margin-right:auto;">
					<input type="Radio" name="gaewol" id="hogu3" value="gmonth2" style="width:40px; height:40px; margin:-1px;">
				</div>
			</div>
			<!--금액-->
			<div style="width:45%; height:70px; padding-top:30px;">
				<div style="width:90%; height:37px; margin-left:auto; margin-right:auto; font-weight:500; font-size:23px;">
					<input type="text" id="3month_1" value="₩ 23,333원" style="width:120px; color:#333; border:0px solid black; font-weight:500; font-size:23px;" readonly><font size=1> 월별</font>
				</div>
				<div style="width:90%; height:10px; margin-left:auto; margin-right:auto; font-weight:300; color:#666666; margin-top:-5px; font-size:12px;">
					일시불 결제  <input type="text" id="3month_2" value="₩ 70,000 원" style="border:0px solid black; font-weight:300; color:#666666; font-size:12px;" readonly>
				</div>
			</div>
			<!--금액세이브-->
			<div style="width:27%; height:80px; padding-top:20px;">
				<div id="sale2" style="width:50%; height:45px; padding-top:15px; border-radius:10px; background-color:#545BA8; font-weight:500; font-size:18px; text-align:center; color:#FFF;">
					33% 할인
				</div>
			</div>
		</div>
	</label>
	<!--1개월-->
	<label for="hogu1">
		<div style="width:100%; height:100px; border-top:0.1px solid #EEEEEE; display:flex; flex-wrap:nowrap;">
			<div style="width:20%; height:70px; text-align:center; font-size:20px; padding-top:30px; background-color:#F0F4FD;">
				1개월
			</div>
			<!--Radio-->
			<div style="width:8%; height:70px; padding-top:30px;">
				<div id="check3" style="width:37px; height:37px; border:3px solid blue; border-radius:50%; margin-left:auto; margin-right:auto;">
					<input type="Radio" name="gaewol" id="hogu1" value="gmonth3" style="width:40px; height:40px; margin:-1px;">
				</div>
			</div>
			<!--금액-->
			<div style="width:45%; height:70px; padding-top:30px;">
				<div style="width:90%; height:37px; margin-left:auto; margin-right:auto; font-weight:500; font-size:23px; color:#666666;">
					<input type="text" id="1month_1" value="₩ 35,000원" style="width:120px; color:#333; border:0px solid black; font-weight:500; font-size:23px;" readonly>
				</div>
			</div>
		</div>
	</label>

	<!--2단계-->
	<div style="width:100%; height:40px; margin-top:20px; background-color:#EEEEEE; border:0.1px solid #CCC; border-bottom:0px solid black;">
		<div style="width:30%; height:35px; margin-left:20px; font-size:18px; padding-top:5px;">2단계 - 결제 방법 선택</div>
	</div>

	<!--결제 수단-->
	<div style="width:100%; border:0.1px solid #CCC; display:flex; flex-wrap:wrap;">
		<div style="width:30%; height:243px;">

			<!--신용카드-->

			<label for="gyu1">
				<div id="gyuljae1" style="width:calc(100% - 2px); height:80px; display:flex; flex-wrap:wrap; border-left:1px solid #CCC; border-bottom:1px solid #CCC; border-right:1px solid #EEE; background-color:#EEE;" onclick="gyuljaes1()">
					<div style="width:35%; height:60px; padding-top:20px;">
						<div style="width:37px; height:37px; margin-left:auto; margin-right:auto;">
							<input type="Radio" name="gyuljae" id="gyu1" value="way1" checked style="width:40px; height:40px; margin:-1px;">
						</div>
					</div>
					<div style="width:65%; height:80px;">
						<div style="width:90%; height:40px; margin-left:5%; margin-top:20px; font-size:20px; font-weight:500;">
							신용 카드
						</div>
					</div>
				</div>
			</label>

			<!--무통장입금-->

			<label for="gyu2">
				<div id="gyuljae2" style="width:calc(100% - 2px); height:80px; display:flex; flex-wrap:wrap; border-left:1px solid #CCC; border-bottom:1px solid #CCC; border-right:1px solid #CCC;" onclick="gyuljaes2()">
					<div style="width:35%; height:60px; padding-top:20px;">
						<div style="width:37px; height:37px; margin-left:auto; margin-right:auto;">
							<input type="Radio" name="gyuljae" id="gyu2" value="way2" style="width:40px; height:40px; margin:-1px;">
						</div>
					</div>
					<div style="width:65%; height:80px;">
						<div style="width:90%; height:40px; margin-left:5%; margin-top:20px; font-size:20px; font-weight:500;">
							무통장입금
						</div>
					</div>
				</div>
			</label>

			<!--휴대폰결제-->

			<label for="gyu3">
				<div id="gyuljae3" style="width:calc(100% - 2px); height:80px; display:flex; flex-wrap:wrap; border-left:1px solid #CCC; border-right:1px solid #CCC;" onclick="gyuljaes3()">
					<div style="width:35%; height:60px; padding-top:20px;">
						<div style="width:37px; height:37px; margin-left:auto; margin-right:auto;">
							<input type="Radio" name="gyuljae" id="gyu3" value="way3" style="width:40px; height:40px; margin:-1px;">
						</div>
					</div>
					<div style="width:65%; height:80px;">
						<div style="width:90%; height:40px; margin-left:5%; margin-top:20px; font-size:20px; font-weight:500;">
							휴대폰결제
						</div>
					</div>
				</div>
			</label>
		</div>

		<!--결제옵션-->
		<div style="width:69.7%; height:243px; background-color:#EEE; font-size:15px;">
			<div style="width:95%; height:200px; margin:auto; margin-top:20px; display:flex; flex-wrap:nowrap;">

				<div style="width:20%; height:200px; text-align:right;">
					<div style="width:100%; height:32px; margin-top:18px;">
						<span id="op1">◎ 카드종류</span>
					</div>

					<div style="width:100%; height:120px; padding-top:30px;">
						<span id="op2">◎ 할부선택</span>
					</div>
				</div>

				<div style="width:80%; height:200px;">
					<div style="width:100%; height:32px; margin-top:18px; padding-left:60px;">

						<select id="ops1" name="cardKinds" style="width:130px; height:25px;">
							<option value="">---------선택---------</option>
							<option value="01">BC카드</option>
							<option value="02">신한카드</option>
							<option value="03">KB국민카드</option>
							<option value="04">삼성카드</option>
							<option value="05">현대카드</option>
							<option value="06">롯데카드</option>
							<option value="07">하나카드</option>
							<option value="08">NH농협카드</option>
							<option value="09">씨티카드</option>
							<option value="10">우리카드</option>
							<option value="11">카카오뱅크카드</option>
							<option value="12">케이뱅크카드</option>
							<option value="13">전북은행카드</option>
							<option value="14">새마을금고카드</option>
							<option value="15">기타(은행/증권)카드</option>
						</select>

						<select id="ops2" name="bankKinds" style="width:0px; height:0px;">
							<option value="">---------선택---------</option>
							<option value="01">농협은행</option>
							<option value="02">국민은행</option>
							<option value="03">신한은행</option>
							<option value="04">우리은행</option>
							<option value="05">KEB한화은행</option>
							<option value="06">기업은행</option>
							<option value="07">대구은행</option>
							<option value="08">부산은행</option>
							<option value="09">우체국</option>
							<option value="10">경남은행</option>
							<option value="11">광주은행</option>
							<option value="12">SC제일은행</option>
							<option value="13">수협은행</option>
							<option value="14">씨티은행</option>
						</select>

						<select id="ops3" name="phoneKinds" style="width:0px; height:0px;">
							<option value="">---------선택---------</option>
							<option value="01">SKT</option>
							<option value="02">KT</option>
							<option value="03">헬로모바일</option>
							<option value="04">KCT</option>
						</select>
					</div>

					<div style="width:100%; height:25px; padding-top:30px; padding-left:60px;">
						
						<select id="opo1" name="halbu" style="width:130px; height:25px;">
							<option value="">---------선택---------</option>
							<option value="01">일시불</option>
							<option value="02">3개월</option>
							<option value="03">6개월</option>
							<option value="04">12개월</option>
						</select>

						<span id="opo2"></span>
					</div>

					<div style="width:100%; height:95px; padding-top:30px; color:#999;">
						<span id="opo3"></span>
					</div>

				</div>
			</div>
		</div>

		<!--결제하기-->
		<div style="width:780px; padding-left:10px; padding-right:10px; height:250px; padding-top:20px; text-align:center; font-size:15px; border:0.1px solid #CCC;">
			<div style="width:100%; height:80px;">

				<div align="left" style="width:100%; height:100px; display:flex; flex-wrap:wrap;">
					<div style="width:90%; height:40px; margin-left:10px;">
						<input type="checkbox" id="dong1" style="width:20px; height:20px; position:relative; top:5px; cursor: pointer;">
						 <label for="dong1" style="cursor: pointer;">(필수) 전자금융거래이용약관 동의</label>
					</div>
					<div style="width:5%; height:40px; margin-left:10px; cursor:pointer;" onclick="hogu_check1()">
						보기
					</div>
					<div style="width:90%; height:40px; margin-left:10px;">
						<input type="checkbox" id="dong2" style="width:20px; height:20px; position:relative; top:5px; cursor: pointer;">
						 <label for="dong2" style="cursor: pointer;">(필수) 구매조건 확인 및 결제대행 서비스 약관 동의</label>
					</div>
					<div style="width:5%; height:40px; margin-left:10px; cursor:pointer;" onclick="hogu_check2()">
						보기
					</div>
				</div>

			</div>
			<label for="submitgo">
			<div style="width:30%; height:40px; padding-top:10px; margin-top:20px; margin-left:auto; margin-right:auto; border-radius:10px; text-align:center; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
				<input type="submit" id="submitgo" value="결 제 하 기" style="border:0px solid black; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
			</div>
			</label>
			<br>이 멤버십은 기간 만료 시 자동 갱신됩니다. 이것은 프리미엄 멤버십의 모든 혜택을 중단 없이 누리며 잠재적인 모든 인연 상대와 계속해서 연락을 주고받을 수 있도록 하기 위함입니다. 원하시면 언제든지 자동 갱신 설정을 해제할 수 있습니다.
		</div>
	</div>

	<!--등급특징-->
	<!--제목-->
	<div style="width:100%; height:40px; margin-top:20px; background-color:#EEEEEE; border:0.1px solid #CCC; border-bottom:0px solid black; margin-top:50px;">
		<div style="width:30%; height:35px; margin-left:20px; font-size:18px; padding-top:5px;">회원 등급 특징 비교</div>
	</div>
	<!--내용-->
	<div style="width:100%; font-size:15px; border:0.1px solid #CCC;">
		<!--글-->
		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">특징</div>
			<div style="width:130px; height:30px;">스탠다드</div>
			<div style="width:130px; height:30px;">골드</div>
			<div style="width:130px; height:30px;">플래티넘</div>
		</div>

		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">기본 짝찾기</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>

		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">호감 보내기</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>

		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">포스트 쓰기</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>

		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">모든 회원과 메시지 가능</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>
		
		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">프로필 강조 표시</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/checkno.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>

		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">다른 회원보다 먼저 표시</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/checkno.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/checkno.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>

		<div style="width:795; height:30px; padding-left:20px; padding-top:5px; display:flex; flex-wrap:wrap; text-align:center;">
			<div style="width:385px; height:30px; text-align:left;">실시간 채팅</div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/checkno.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/checkno.png" style="width:20px; height:20px;"></div>
			<div style="width:130px; height:30px;"><img src="/cupid/img/check.png" style="width:20px; height:20px;"></div>
		</div>

	</div>
</form>
</div>

<%@ include file="/tail.jsp" %>
