<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/head.jsp" %>

<div style="width:800px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:100px; border:1px solid #CCC; color: #444;">
	
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

	<!-- 명령질 -->
	<div style="width: 95%; height: 600px; margin-top:50px; margin-bottom: 20px; margin-left: auto; margin-right: auto; text-align: center; font-size: 20px; background-color:#EEE; border:1px solid #AAA;">
		<div style="width: 100%; height: 60px; padding-top: 20px; font-size: 25px;">
			무 통 장 입 금
		</div>
		<div style="width: 100%; height: 50px; padding-top: 15px; margin-top: 20px; font-size: 18px; display: flex; flex-wrap: nowrap;">
			<div style="width: 15%; height: 50px; text-align: right;">
				은 행 : 
			</div>
			<div style="width: 85%; height: 50px; text-align: left; padding-left: 10px;">
				 ${bank }
			</div>
		</div>
		<div style="width: 100%; height: 50px; padding-top: 15px; font-size: 18px; display: flex; flex-wrap: nowrap;">
			<div style="width: 15%; height: 50px; text-align: right;">
				계좌번호 :
			</div>
			<div style="width: 85%; height: 50px; text-align: left; padding-left: 10px;">
				 866002-01-352468
			</div>
		</div>
		<div style="width: 100%; height: 50px; padding-top: 15px; font-size: 18px; display: flex; flex-wrap: nowrap;">
			<div style="width: 15%; height: 50px; text-align: right;">
				입금금액 :
			</div>
			<div style="width: 85%; height: 50px; text-align: left; padding-left: 10px;">
				 ${getMoney } 원
			</div>
		</div>
		<div style="width: 100%; height: 50px; padding-top: 15px; font-size: 18px; display: flex; flex-wrap: nowrap;">
			<div style="width: 15%; height: 50px; text-align: right;">
				이 름 :
			</div>
			<div style="width: 85%; height: 50px; text-align: left; padding-left: 10px;">
				 (주)큐피드
			</div>
		</div>
		<div style="width: 100%; height: 50px; padding-top: 15px; margin-top: 20px; font-size: 18px; display: flex; flex-wrap: nowrap;">
			<div style="width: 15%; height: 50px; text-align: right;">
				입금자명 :
			</div>
			<div style="width: 85%; height: 50px; text-align: left; padding-left: 10px;">
				 ${sessionScope.name }
			</div>
		</div>
		<div style="width: 100%; height: 50px; padding-top: 15px; margin-top: 20px; font-size: 18px; display: flex; flex-wrap: nowrap;">
			<div style="width: 15%; height: 50px; text-align: right;">
				입금기간 :
			</div>
			<div style="width: 85%; height: 50px; text-align: left; padding-left: 10px;">
				 ~ ${ipgeumnalza } 까지 입금
			</div>
		</div>
	</div>
	<form name="hoguwat" action="Hogu3.do?nowserver=${nowserver }" method="post">
	<input type="hidden" name="nowserver" value="${nowserver }">
	<input type="hidden" name="gyuljae" value="way2">
	<input type="hidden" name="bank" value="${bank }">
	<input type="hidden" name="getMoney" value="${getMoney }">
	<input type="hidden" name="hogulevel" value="${hogulevel }">
	<input type="hidden" name="gaewol" value="${gaewol }">
	
	<!-- 결제 -->
	<label for="hogulast">
		<div style="width:30%; height:40px; padding-top:10px; margin-top:20px; margin-left:auto; margin-right:auto; margin-bottom:20px; border-radius:10px; text-align:center; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
					<input type="submit" id="hogulast" value="입 금 완 료" style="border:0px solid black; font-size:20px; color:#FFF; font-weight:500; background-color:#987654; cursor:pointer;">
		</div>
	</label>
	</form>
</div>

<%@ include file="/tail.jsp" %>