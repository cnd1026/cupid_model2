<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/head.jsp" %>

<div align=center style="width:100%;">
<form action="PostWriteProc.do?nowserver=${nowserver }" method="post" enctype="multipart/form-data">
<input type=hidden name=nowserver value="${nowserver }">
	<div style="width:100%; height:20px;"></div>
	<div style="width:930px; height:200px; box-shadow:3px 3px 8px 1px gray; padding:10px; font-size:16px;">
		<!-- 사진 -->
		<div style="width:150px; height:200px; border:0.1px solid #CCC; float:left;">
			<div style="width:100%; margin-top:80px; color:#888;">등록할 사진</div>
		</div>
		<!-- 공백 -->
		<div style="width:29px; height:200px; float:left;"></div>
		<!-- 내용 -->
		<div style="width:590px; height:200px; float:left; text-align:left;">
			<!-- 이름 -->
			<div style="width:200px; height:30px; float:left;">
				<!-- 썸네일 사진 -->
				<div style="width:25px; height:25px; margin-top:2px; margin-left:5px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${bean.profilepicture}); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
			&nbsp; ${bean.name }
			</div>
			<!-- 이름 옆에 공백 -->
			<div style="width:390px; height:30px; float:left;"></div>
			<!-- 설명 -->
			<!-- 채팅 글자수 1000자로 제한 -->
				<script type="text/javascript">					
					$(document).ready(function() {$('#post').on('keyup', function() {
						if($(this).val().length > 1000) {
							$(this).val($(this).val().substring(0, 1000));					
					        }
					    });
					});
				</script>
			<div style="width:590px; height:150px; margin-top:20px; float:left; overflow:hidden; font-size:16px;">
				<textarea id="post" name="post" style="width:580px; height:140px; border:0.1px solid #CCC; resize:none;"></textarea>
			</div>
		</div>
		<!-- 세로공백 -->
		<div style="width:10px; height:200px; float:left; background-color:#EEE;"></div>
		<!-- 기타 -->
		<div style="width:150px; height:200px; float:left; text-align:center;">
			<!-- 조회수 -->
			<div style="width:150px; height:30px;"></div>
			<!-- 등급 -->
			<div style="width:150px; height:90px; background-image:url(
				<c:choose>
					<c:when test="${bean.level=='3' }">
						/cupid/img/platinum.png
					</c:when>
					<c:when test="${bean.level=='2' }">
						/cupid/img/gold.png
					</c:when>
					<c:when test="${bean.level=='1' }">
						/cupid/img/dogpig.png
					</c:when>
					<c:otherwise>
						/cupid/img/god.png
					</c:otherwise>
				</c:choose>
				); background-position:50%; background-repeat:no-repeat; background-size:90px 90px;"></div>
			<!-- 댓글 -->
			<div style="width:150px; height:35px; padding-top:5px;"></div>
			<!-- 날짜 -->
			<div style="width:150px; height:25px; padding-top:15px;"></div>
		</div>
	</div>
	<div style="width:100%; height:20px;"></div>
	<div style="width:910px; height:30px; box-shadow:3px 3px 8px 1px gray; padding:20px; font-size:16px; text-align:center;">
		<input type="file" name="file1"><font color=red>(jpg 이미지 파일만 지원합니다.)</font>
	</div>
	<div style="width:100%; height:20px;"></div>
	<div style="width:200px; height:100px; margin-top:30px;">
		<input type="submit" value="글쓰기" style="width:200px; height:50px; font-size:20px; font-weight:500; color:#666; box-shadow:3px 3px 8px 1px gray;">
	</div>
</form>
</div>

<%@ include file="/tail.jsp" %>