<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>

<script>    
    function send() {
		if (document.getElementById("cardNum1").value.length < 4) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		if (document.getElementById("cardNum2").value.length < 4) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		if (document.getElementById("cardNum3").value.length < 4) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		if (document.getElementById("cardNum4").value.length < 4) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		if (document.getElementById("cardNum5").value.length < 2) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		if (document.getElementById("cardNum6").value.length < 2) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		if (document.getElementById("cardNum7").value.length < 3) {
			alert("카드번호를 다시 확인해주세요.");
			return false;
		}
		
    }
 // 특수문자 정규식 변수(공백 미포함)
    var replaceChar = /[^0-9]/gi;
 
    // 완성형 아닌 한글 정규식
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    
    $(document).ready(function(){
        
        $("#cardNum1,#cardNum2,#cardNum3,#cardNum4,#cardNum5,#cardNum6,#cardNum7").on("focusout", function() {
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
	input[id="cardNum2"] {-webkit-text-security:disc;}
	input[id="cardNum3"] {-webkit-text-security:disc;}
</style>

<div style="width:800px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:100px; border:1px solid #CCC; color: #444;">
<form name="hoguwat" onsubmit="return send()" action="Hogu3.do?nowserver=${nowserver }" method="post">
<input type="hidden" name="nowserver" value="${nowserver }">
<input type="hidden" name="gyuljae" value="way1">
<input type="hidden" name="hogulevel" value="${hogulevel }">
<input type="hidden" name="halbu" value="${halbu }">
<input type="hidden" name="getMoney" value="${getMoney }">
<input type="hidden" name="mycard" value="${mycard }">
<input type="hidden" name="gaewol" value="${gaewol }">
	
	<div style="width:100%; height:35px; padding-top:10px; padding-bottom:10px; display:flex; flex-wrap:wrap-reverse;">
		<!-- 1 -->
		<div style="width:29px; height:30px; background-color:#CCC; text-align:center; padding-left:1px; border-radius:50%; font-size:20px; font-weight:700; color:#FFF; margin-left:340px;">1</div>
		<!--맴버십 선택-->
		<div style="width:120px; height:28px; margin-left:20px; margin-right:20px; font-size:15px;">
			맴버십 선택
			<div style="width:15px; height:40px; float:right; background-image:url(/cupid/img/rightArrow.png); background-size:80%; background-repeat:no-repeat; margin-top:2px;"></div></div>
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

	<!-- 카드 앞면 -->
	<div style="width: 100px; height: 50px; margin-top:50px; margin-left: auto; margin-right: auto; text-align: center; font-size: 20px;">
		앞면
	</div>

	<div style="width:100%; height:230px; background-color:#EEE; display:flex; flex-wrap:nowrap;">
		<!-- 카드 -->
		<div style="width:40%; height:230px;">
			<div style="width:90%; height:100%; margin:auto; background-image:url(/cupid/img/cardFront.jpg); background-repeat: no-repeat; background-position: 50%; background-size: 100%;"></div>
		</div>

		<!-- 입력 -->
		<div style="width:60%; height:230px; display:flex; flex-wrap:wrap; background-color:#EEE;">
			<div style="width: 180px; height: 35px; padding-top: 5px; margin-top:10px; margin-left: 10px; background-color: #DDD; text-align: center; font-size: 18px;">
				${mycard }
			</div>
			<div style="width: 100%; height: 1px;"></div>
			<div style="width:80%; height: 40px; margin-left: auto; margin-right: auto; padding-top: 4px; border:1px solid #CCC; text-align: center;">
				카드번호&nbsp;&nbsp;
				<input type="text" id="cardNum1" maxlength="4" style="width:53px; height:25px; font-size: 20px;" />
				-
				<input type="text" id="cardNum2" maxlength="4" inputmode="numeric"  style="width:53px; height:25px; font-size: 30px; position: relative; top: 4px;">
				-
				<input type="text" id="cardNum3" maxlength="4" inputmode="numeric" style="width:53px; height:25px; font-size: 30px; position: relative; top: 4px;">
				-
				<input type="text" id="cardNum4" maxlength="4" style="width:53px; height:25px; font-size: 20px;" />
			</div>
			<div style="width: 100%; height: 1px;"></div>
			<div style="width:40%; height: 80px; margin-left: 240px;display:flex; flex-wrap: wrap; border:1px solid #CCC;">
				<div style="width:30%; height: 50px; text-align: center; padding-top: 30px; font-weight: 500;">
					유효<br>기간
				</div>
				<div style="width:70%; height:80px;">
					<div style="width:100%; height:25px; padding-top: 5px; text-align: center; font-size: 15px;">
						MONTH / YEAR
					</div>
					<div style="width:100%; height:40px; padding-top: 10px; text-align: center; font-size: 15px;">
						<input type="text" id="cardNum5" maxlength="2" style="width:30px; height:25px; font-size: 20px;" />
						&nbsp;/&nbsp;
						<input type="text" id="cardNum6" maxlength="2" style="width:30px; height:25px; font-size: 20px;" />
					</div>
				</div>
			</div>
			<div style="width: 100%; height: 10px;"></div>
		</div>
	</div>

	<!--카드 뒷면-->
	<div style="width: 100px; height: 50px; margin-top:20px; margin-left: auto; margin-right: auto; text-align: center; font-size: 20px;">
		뒷면
	</div>
	<div style="width:100%; height:230px; background-color:#EEE; display:flex; flex-wrap:nowrap;">
		<!-- 카드 -->
		<div style="width:40%; height:230px;">
			<div style="width:90%; height:100%; margin:auto; background-image:url(/cupid/img/cardBack.jpg); background-repeat: no-repeat; background-position: 50%; background-size: 100%;"></div>
		</div>

		<!-- 입력 -->
		<div style="width:60%; height:230px; background-color:#EEE;">
			<div style="width: 180px; height: 35px; padding-top: 5px; margin-top:10px; margin-left: 10px; background-color: #DDD; text-align: center; font-size: 18px;">
				${mycard }
			</div>
			<div style="width: 100%; height: 30px;"></div>
			<div style="width:45%; height: 50px; margin-left: 200px;display:flex; flex-wrap: wrap; border:1px solid #CCC;">
				<div style="width:100%; height:40px; padding-top: 10px; text-align: center; font-size: 15px;">
					뒤에 숫자 3자리&nbsp;&nbsp;&nbsp;
					<input type="text" id="cardNum7" maxlength="3" style="width:50px; height:25px; font-size: 20px;" />
				</div>
			</div>
		</div>
	</div>

	<!-- 결제하기 -->
	<div style="width:100%; height:100px; margin-top:50px;">
		<label for="hogulast">
			<div style="width: 200px; height: 52px; padding-top: 13px; margin: auto; text-align: center; font-size: 23px; border-radius: 20px; background-color: #EEE; box-shadow: 3px 3px 7px 5px gray; cursor: pointer;">
				<input type="submit" id="hogulast" style="width: 0px; height: 0px; margin: 0px; padding: 0px; opacity: 0; cursor: pointer;">결 제 하 기
			</div>
		</label>
	</div>
</form>
</div>

<%@ include file="/tail.jsp" %>
