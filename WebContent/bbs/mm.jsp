<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<jsp:include page="/head.jsp" />
<%
 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 String date = sf.format(now);
%>
<c:set var="date" value="<%=date %>" />

<script>
$(document).ready(function(){
	$("#mydiv").scrollTop($("#mydiv")[0].scrollHeight);
});


function send(){
	if (msg.smsg.value == "") {
		alert("내용을입력하세요");
		msg.smsg.focus();
		return false;
	}
}


</script>



<style>
		.bbubble {
			position: relative;
			width: 250px;
			min-height:75px;
			padding: 0px;
			background: #FFFFFF;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			border: #7F7F7F solid 2px;
			word-break:break-all;
			}
			
			.bbubble:after {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 15px 15px 15px 0;
			border-color: transparent #FFFFFF;
			display: block;
			width: 0;
			z-index: 0;
			left: -14px;
			top: 28px;
			}
			
			.bbubble:before {
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 16px 16px 16px 0;
			border-color: transparent #7F7F7F;
			display: block;
			width: 0;
			z-index: 0;
			left: -18px;
			top: 27px;
			}
			.bbubble2
			{
			position: relative;
			width: 250px;
			min-height:75px;
			padding: 0px;
			background: #FFFFFF;
			-webkit-border-radius: 10px;
			-moz-border-radius: 10px;
			border-radius: 10px;
			border: #7F7F7F solid 2px;
			word-break:break-all;
			}
			
			.bbubble2:after 
			{
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 15px 0 15px 15px;
			border-color: transparent #FFFFFF;
			display: block;
			width: 0;
			z-index: 1;
			right: -14px;
			top: 31px;
			}
			
			.bbubble2:before 
			{
			content: '';
			position: absolute;
			border-style: solid;
			border-width: 16px 0 16px 16px;
			border-color: transparent #7F7F7F;
			display: block;
			width: 0;
			z-index: 0;
			right: -18px;
			top: 30px;
			}

</style>


<div style="width:140px; margin:auto; margin-top:30px; margin-bottom:10px; height:140px;"><a href="Profile.do?nowserver=${nowserver }&email=${profile.email}"><img src="/cupid/upload/${profile.profilepicture }" style=" border-radius:70px;width:100%; height:100%;"></a></div>
<div style="width:10%; margin:auto; text-align:center; margin-bottom:50px;">${profile.name }</div>
<div class="mydiv" id="mydiv" style="overflow:auto; width:60%; height:700px; margin:auto;  box-shadow:3px 3px 8px 1px gray;">
<c:forEach var="mm" items="${v }">
	<!-- 받은거 -->
	<c:choose>
		<c:when test="${profile.email==mm.sendemail}">
			<div style="width:100%; padding-bottom:10px;">
				<div style="width:90%; margin:auto; height:20px; display:flex; flex-wrap:nowrap;">
					<div style="width:18%; height:20px;"></div>
					<div style="width:42%; height:20px;">${mm.date }</div>
					<div style="width:39%; height:20px;"></div>
				</div>
				<div style="width:90%; margin:auto;  display:flex; flex-wrap:nowrap;">
					<div onclick="location.href='Profile.do?email=${mm.sendemail}'"style="background-image:url(/cupid/upload/${profile.profilepicture}); background-position:50%; background-repeat:no-repeat; background-size:cover;width:15%; height:0px; padding-bottom:14%; overflow:hidden; border-radius:50%;"></div>
					<div style="width:4%; height:90px;"></div>
					<div class=bbubble style="width:43.5%; padding:1.5%;">${mm.comment }</div>
					<div style="width:41%; height:90px;"></div>
				</div>
			</div>
		<!-- 보낸거 -->
		</c:when>
		<c:otherwise>
			<div style="width:100%; padding-bottom:10px;">
				<div style="width:90%; margin:auto; height:20px; display:flex; flex-wrap:nowrap;">
					<div style="width:40%; height:20px;"></div>
					<div style="width:42%; height:20px; text-align:right;">${mm.date }</div>
					<div style="width:17%; height:20px;"></div>
				</div>
				<div style="width:90%; margin:auto; display:flex; flex-wrap:nowrap;">
					<div style="width:41%; height:90px;"></div>
					<div class=bbubble2 style="width:43.5%; padding:1.5%;">${mm.comment }</div>
					<div style="width:4%; height:90px;"></div>
					<div style="background-image:url(/cupid/upload/${m.profilepicture}); background-position:50%; background-repeat:no-repeat; background-size:cover;width:15%; height:0px; padding-bottom:15%; overflow:hidden; border-radius:50%;"></div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach>
</div>
<form name="msg" onsubmit="return send()" action="MessageSend.do?email=${profile.email }&&date=${date}" method="post">
<div style="width:1000; height:110px; padding-bottom:10px; padding-top:30px;">
	<div style="width:60%; margin:auto; height:50px; margin-bottom:10px;">
			<div style="width:90%; float:left; height:50px; margin-bottom:10px;">
				<input type="text" name="smsg" style="border:0px; height:50px; border-bottom:1px solid;width:100%">
			</div>
			<div style="width:10%; float:left; height:50px; margin-bottom:10px; text-align:right">
				<button type="submit" style="border:0px; background: url( '/cupid/img/send.png' );  background-position:50%; background-repeat:no-repeat; background-size:cover; width:57px; height:60px;"></button>
			</div>
	</div>
</div>
</form>

<jsp:include page="/tail.jsp" />