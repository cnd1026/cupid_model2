<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>

<script>
    function numberMaxLength(e){
        if(e.value.length > e.maxLength){
            e.value = e.value.slice(0, e.maxLength);
        }
    }
	function send() {
		if (document.getElementById("name").value == "") {
			alert("이름을 적어주세요");
			return false;
		}
		if (document.getElementById("birth").value == "") {
			alert("생년월일을 적어주세요");
			return false;
		}
		if (document.getElementById("birth").value.length < 8) {
			alert("생년월일을 8자리를 적어주세요");
			return false;
		}
		if (document.getElementById("phone").value == "") {
			alert("휴대폰번호를 적어주세요");
			return false;
		}
		if (document.getElementById("phone").value.length < 10) {
			alert("올바른 휴대폰번호를 적어주세요");
			return false;
		}
		if (document.getElementById("norobot").value != "44657") {
			alert("로봇 식별 번호가 틀렸습니다.");
			return false;
		}
		if (document.getElementById("dong1").checked == false) {
			alert("개인정보 수집/이용/취급 위탁을 동의해 주세요.");
			return false;
		}
		if (document.getElementById("dong2").checked == false) {
			alert("본인확인서비스 이용에 동의해 주세요.");
			return false;
		}
		if (document.getElementById("dong4").checked == false) {
			alert("고유식별정보처리에 동의해 주세요.");
			return false;
		}
		if (document.getElementById("dong5").checked == false) {
			alert("통신사 이용약관에 동의해 주세요.");
			return false;
		}
	}
	// 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /[^0-9]/gi;
 
    // 완성형 아닌 한글 정규식
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    
    $(document).ready(function(){
        
        $("#birth,#phone").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
       });
    });
</script>

<style type="text/css">
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
	}
	input[type=radio] {
	    display:none; 
	    margin:10px;
	}
	.bonins input[type=radio] + label {
	    display:inline-block;
	    background-color: #DDD;
	}
	.bonins input[type=radio]:checked + label { 
	   background-image: none;
	    background-color:#FFF;
	}
	.genders input[type=radio] + label {
	    display:inline-block;
	    background-color: #FFF;
	}
	.genders input[type=radio]:checked + label { 
	   background-image: none;
	    background-color:#AAA;
	}
</style>

<div style="width:800px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:100px; border:1px solid #CCC; color: #444;">
	
	<div style="width:100%; height:35px; padding-top:10px; padding-bottom:10px; display:flex; flex-wrap:wrap-reverse;">
		<!-- 1 -->
		<div style="width:29px; height:30px; background-color:#CCC; text-align:center; padding-left:1px; border-radius:50%; font-size:20px; font-weight:700; color:#FFF; margin-left:340px;">1</div>
		<!--맴버십 선택-->
		<div style="width:120px; height:28px; margin-left:20px; margin-right:20px; font-size:15px;">
			맴버십 선택
			<div style="width:15px; height:40px; float:right; background-image:url(C:/jsp/cupid/WebContent/img/rightArrow.png); background-size:80%; background-repeat:no-repeat; margin-top:2px;"></div></div>
		<!-- 2 -->
		<div style="width:29px; height:30px; background-color:#555; text-align:center; border-radius:50%; font-size:20px; font-weight:700; color:#FFF;">2</div>
		<!--개인 정보-->
		<div style="width:100px; height:28px; margin-left:20px; margin-right:20px; font-size:15px;">
			개인 정보
			<div style="width:15px; height:35px; float:right; background-image:url(/cupid/img/rightArrow.png); background-size:80%; background-repeat:no-repeat; margin-top:2px;"></div></div>
		<!-- 3 -->
		<div style="width:29px; height:30px; background-color:#CCC; text-align:center; border-radius:50%; font-size:20px; font-weight:700; color:#FFF;">3</div>
		<!--영수증-->
		<div style="width:50px; height:28px; margin-left:20px; font-size:15px;">영수증</div>
	</div>

	<!-- 본인확인 -->
	<div style="width: 600px; border:1px solid #BBB; margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom:50px;">
	<form name="hoguwat" onsubmit="return send()" action="Hogu3.do?nowserver=${nowserver }" method="post">
	<input type="hidden" name="nowserver" value="${nowserver }">
	<input type="hidden" name="gyuljae" value="way3">
	<input type="hidden" name="phone" value="${phone }">
	<input type="hidden" name="getMoney" value="${getMoney }">
	<input type="hidden" name="hogulevel" value="${hogulevel }">
	<input type="hidden" name="gaewol" value="${gaewol }">

		<!-- 통신사 -->
		<div style="width: 100%; height: 30px; padding-top: 10px; background-color: #DDD;">
			<div style="width: 50px; height: 30px; margin-left: 10px;">
				SKT
			</div>
		</div>

		<!-- 본인확인 방법 -->
		<div class="bonins" style="width: 100%; height: 40px; display: flex; flex-wrap: nowrap; background-color: #DDD;">
			<input type="radio" name="bonin" id="bonin1" value="1">
			<label for="bonin1" style="width: 50%; height: 40px; cursor: pointer;">
				<div style="width: 100%; height: 32px; padding-top:8px; text-align: center;">
					간편본인확인 (앱)
				</div>
			</label>

			<input type="radio" name="bonin" id="bonin2" value="2" checked>
			<label for="bonin2" style="width: 50%; height: 40px; cursor: pointer;">
				<div style="width: 100%; height: 32px; padding-top:8px; text-align: center;">
					휴대폰본인확인(문자)
				</div>
			</label>
		</div>

		<!--광고-->
		<div style="width: 100%; height: 100px; background-image: url(/cupid/img/adphone.jpg); background-size: cover; background-repeat: no-repeat;background-position: 50%;">
				<div style="width: 100%; height: 100px; cursor: pointer;" onclick="window.open('http://ra.speakingmax.com/DA/page.html?_NC=1095&_OC_=312445&utm_campaign=da&utm_source=naver&utm_medium=timeboard_20190710_10&utm_term=D&utm_content=199','광고','width=1000, height=800')"></div>
		</div>

		<!--인증절차-->
		<div style="width: 550px; margin-left: auto; margin-right: auto; margin-top: 20px; display: flex; flex-wrap: wrap; border:1px solid #DDD;">
			
			<!--제목-->
			<div style="width: 100px; margin: 10px; text-align: center;">
				<div style="width: 100%; height: 32px; padding-top: 8px; border:1px solid #AAA;">
					이 &nbsp; 름
				</div>
				<div style="width: 100%; height: 32px; padding-top: 8px; margin-top: 5px; border:1px solid #AAA;">
					생년월일
				</div>
				<div style="width: 100%; height: 32px; padding-top: 8px; margin-top: 5px; border:1px solid #AAA;">
					휴대폰번호
				</div>
			</div>
			
			<!--내용물-->
			<div style="width: 400px; margin-left: 15px; margin-top: 10px; margin-bottom: 10px; text-align: center;">
				
				<div style="width:100%; height: 40px; display: flex; flex-wrap: wrap;">

					<!--이름-->
					<div style="width:195px; height: 40px;">
						<input type="text" id=name name=name style="width: 190px; height: 36px; padding-left: 5px; font-size: 16px; font-weight: 500; border:1px solid #AAA;" placeholder="홍길동">
					</div>

					<!--내국인외국인-->
					<div style="width:195px; height: 40px; margin-left: 10px;">
						<select name=madein style="width: 190px; height: 40px; padding: 2px; padding-left: 5px; font-size: 16px; font-weight: 500; border:1px solid #AAA;">
							<option selected>내국인</option>
							<option>외국인</option>
						</select>
					</div>

				</div>

				<div style="width:100%; height: 40px; margin-top: 5px; display: flex; flex-wrap: wrap;">
					<!--생년월일-->
					<div style="width:195px; height: 40px;">
						<input type="text" id=birth name=birth maxlength=8 style="width: 190px; height: 36px; padding-left: 5px; font-size: 16px; font-weight: 500; border:1px solid #AAA;" placeholder="ex)19890823">
					</div>

					<!--남여-->
					<div class="genders" style="width:195px; height: 40px; margin-left: 10px; display: flex; flex-wrap: nowrap;">
						<input type="radio" name="gender" id="gender1" value="1" checked>
						<label for="gender1" style="width: 70px; height: 38px; margin-left: 3px; border:1px solid #AAA; cursor: pointer;">
							<div style="width: 100%; height: 32px; padding-top:8px; text-align: center;">
								남
							</div>
						</label>

						<input type="radio" name="gender" id="gender2" value="2">
						<label for="gender2" style="width: 70px; height: 38px; margin-left: 10px; border:1px solid #AAA; cursor: pointer;">
							<div style="width: 100%; height: 32px; padding-top:8px; text-align: center;">
								여
							</div>
						</label>
					</div>
				</div>

				<!--휴대폰번호-->
				<div style="width:100%; height: 40px; margin-top: 5px; text-align: left;">
					<input type="text" id=phone name=phone maxlength="11" style="width: 392px; height: 36px; padding-left: 5px; font-size: 16px; font-weight: 500; border:1px solid #AAA;" placeholder="'-'제외하고 숫자만 입력">
				</div>

			</div>

		</div>

		<!--로봇검사-->
		<div style="width: 550px; margin-left: auto; margin-right: auto; margin-top: 20px; display: flex; flex-wrap: wrap;">

			<!--그림-->
			<div style="width: 320px; height: 80px; padding-top: 5px; border:1px solid #DDD;">
				<div style="width: 140px; height: 70px; margin-left: auto; margin-right: auto; background-image: url(/cupid/img/norobot.jpg); background-size: cover; background-repeat: no-repeat; background-position: 50%;"></div>
			</div>

			<!--입력-->
			<div style="width: 206px; height: 85px; margin-left: 20px;">
				<input type="number" id=norobot maxlength="5" oninput="numberMaxLength(this);" style="width: 200px; height: 83px; padding-left: 6px; border:1px solid #DDD; font-size: 20px;" placeholder="옆에 숫자 입력">
			</div>

		</div>

		<!--동의-->
		<div style="width: 550px; height: 120px; margin-left: auto; margin-right: auto; margin-top: 20px; border:1px solid #DDD; display: flex; flex-wrap: wrap; font-size: 14px;">
			<div style="width: 270px; height: 120px; margin-left: 10px;">
				<div style="width: 100%; height: 40px;">
					<input type="checkbox" id="dong1" style="width: 20px; height: 20px; position: relative; top:5px;">
					<label for="dong1">
						개인정보 수집/이용/취급 위탁동의	
					</label>
					
				</div>
				<div style="width: 100%; height: 40px;">
					<input type="checkbox" id="dong2" style="width: 20px; height: 20px; position: relative; top:5px;">
					<label for="dong2">
						본인확인서비스 이용약관
					</label>
				</div>
				<div style="width: 100%; height: 40px;">
					<input type="checkbox" id="dong3" style="width: 20px; height: 20px; position: relative; top:5px;">
					<label for="dong3">
						(선택)휴대폰번호도용방지수신 동의
					</label>
				</div>
			</div>
			<div style="width: 260px; height: 120px; margin-left: 10px;">
				<div style="width: 100%; height: 40px;">
					<input type="checkbox" id="dong4" style="width: 20px; height: 20px; position: relative; top:5px;">
					<label for="dong4">
						고유식별정보처리 동의
					</label>
				</div>
				<div style="width: 100%; height: 40px;">
					<input type="checkbox" id="dong5" style="width: 20px; height: 20px; position: relative; top:5px;">
					<label for="dong5">
						통신사 이용약관
					</label>
				</div>
			</div>
			
		</div>

		<!--선택-->
		<div style="width: 300px; height: 50px; margin-left: auto; margin-right: auto; margin-top: 15px; margin-bottom: 20px; display: flex; flex-wrap: wrap; font-size: 14px;">

			<!--취소-->
			<label for="hoguback">
				<div style="width:100px; height:42px; padding-top:8px; border-radius:10px; text-align:center; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
					<input type="submit" id="hoguback" value="취 소" style="border:0px solid black; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
				</div>
			</label>
			<!--확인-->
			<label for="hogulast">
				<div style="width:180px; height:42px; margin-left:20px; padding-top:8px; border-radius:10px; text-align:center; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
					<input type="submit" id="hogulast" value="확 인" style="border:0px solid black; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
				</div>
			</label>

		</div>

	</form>
	</div>

</div>

<%@ include file="/tail.jsp" %>