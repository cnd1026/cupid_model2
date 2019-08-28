<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/head.jsp"%>
<style>
	.arrow {
		position:relative;
		top:2px;
	}
</style>
<div style="width:100%; height:50px; min-width:1200px; background-color:#929ADD;">
	<div style="padding-top:10px; margin-left:20px;">
		<font size=4 color=white>프로필</font>
	</div>
</div>
<!-- 제일 큰 테두리 -->
<div align=center style="width: 100%; min-width:1200px; max-width:1800px; margin-left:auto; margin-right:auto;">
	<!-- 최상단 여백부분 -->
	<div style="width: 100%; height: 10px;"></div>
	<!-- 내용 첫번째칸 사진과 기본내용 -->
	<div style="width: 95%; height: 500px; border: 1px solid #CCC; box-shadow: 3px 3px 8px 1px gray;">
		<!-- 사진부분 -->
		<div
			style="box-shadow: 2px 2px 8px 1px gray; margin:10px; width: 280px; height: 280px; float: left; background-image: url(/cupid/upload/${profile.profilepicture }); background-position: 50%; background-repeat: no-repeat; background-size: cover;">
		</div>
		
		<!-- 여백 -->
		<div style="width: 2%;; height: 290px; float: left;"></div>
		<!-- 소개부분 -->
		<div style="width: calc(98% - 450px); height: 290px; float: left;">
			<!-- 소개 -->
			<div
				style="width: 100%; height: 300px; text-align: left; float: left;">
				<div style="width:100%; height:25px;"></div>
				<div style="width:100%; height:25px; font-size: 25px; font-weight: bold;">
					<!-- 썸네일 사진 -->
					<div style="width:25px; height:25px; margin-top:5px; margin-left:5px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${profile.profilepicture}); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
				&nbsp;${profile.name }
				</div>
				<div style="width:100%; height:20px; margin-top:20px; font-size: 15px;">${profile.addr } , ${realage }세</div>
				<div style="width:100%; height:15px; margin-top:15px;"></div>
				<div style="width:45%; height:150px; float:left; margin-top:10px;">
					<div style="width:100%; height:20px; font-size:17px; font-weight:700;">자기소개</div>
																									<!-- 개행처리 -->		<% pageContext.setAttribute("newLineChar", "\n"); %>
					<div style="width:100%; height:120px; margin-top:10px; font-size:13px; font-weight:400; overflow:hidden;">${fn:replace(profile.whoami, newLineChar, "<br/>")}</div>
				</div>
				<div style="width:5%; height:150px; float:left; margin-top:10px;"></div>
				<div style="width:45%; height:150px; float:left; margin-top:10px; font-size: 15px;">
					<div style="width:100%; height:20px; font-size:17px; font-weight:700;">원하는 상대</div>
					<div style="width:100%; height:120px; margin-top:10px; font-size:13px; font-weight:400; overflow:hidden;">${fn:replace(profile.want, newLineChar, "<br/>")}</div>
				</div>
			</div>
			<!-- 좋아요 메시지 전송부분 -->
		</div>
		<div style="float:left;">
			<div style="width: 150px; height: 100px; float: left; padding-top:30px; text-align: right; display:flex; flex-wrap:nowrap;">
				<!-- 하트 보내기는 a태그 아니고 폼으로 -->
				<c:set var="thatemail" value="${email }"/>
				<c:set var="myemail" value="${sessionScope.email }"/>
					<c:choose>
						<c:when test="${heart=='O' }">
							<c:if test="${myemail != thatemail }">
								<form action="DeleteHeart.do" id="heartzz">
									<c:set var="thatemail" value="${email }"/>
									<c:set var="myemail" value="${sessionScope.email }"/>
									<input type="hidden" name="nowserver" value="${nowserver }">
									<input type="hidden" value="${thatemail}" name="that">
									<input type="hidden" value="${myemail}" name="my">
								<div style="width:55px; height:55px;">
									<input type=image src="/cupid/img/Hearton.png" width="55px" height="55px" onclick="document.getElementById('heartzz').submit();">
								</div>
								</form>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${myemail != thatemail }">
								<form action="MakeHeart.do" id="heartzz2">
									<c:set var="thatemail" value="${email }"/>
									<c:set var="myemail" value="${sessionScope.email }"/>
									<input type="hidden" name="nowserver" value="${nowserver }">
									<input type="hidden" value="${thatemail}" name="that">
									<input type="hidden" value="${myemail}" name="my">
								<div style="width:55px; height:55px;">
									<input type=image src="/cupid/img/Heart.png" width="55px" height="55px" onclick="document.getElementById('heartzz2').submit();">
								</div>
								</form>
							</c:if>
						</c:otherwise>
					</c:choose>
				<c:if test="${myemail != thatemail }">
					<a href="MessageView.do?email=${profile.email}" id="talkzz">
						<div style="width:55px; height:55px; margin-left:20px;">
							<input type=image src="/cupid/img/Talkgogo.png" width="55px" height="55px" onclick="document.getElementById('talkzz').submit();">
						</div>
					</a>
					</form>
				</c:if>
			</div>
		</div>
		<!-- 균형 -->
		<div style="width:100%; height:0px; float:left;"></div>
		<!-- 취미 -->
		<div style="width:20%; height:170px; margin:10px; border:0.1px solid #EEE; float:left;">
			<div style="width:90%; height:30px; margin:5%; font-size:20px; font-weight:700;">
				취미
			</div>
			<div style="width:90%; height:100px; margin:5%; font-size:16px; font-weight:400;">
				${profile.favo }
			</div>
		</div>
		<!-- 음식 -->
		<div style="width:20%; height:170px; margin:10px; border:0.1px solid #EEE; float:left;">
			<div style="width:90%; height:30px; margin:5%; font-size:20px; font-weight:700;">
				좋아하는 음식
			</div>
			<div style="width:90%; height:100px; margin:5%; font-size:16px; font-weight:400;">
				${profile.favo1 }
			</div>
		</div>
		<!-- 음악 -->
		<div style="width:20%; height:170px; margin:10px; border:0.1px solid #EEE; float:left;">
			<div style="width:90%; height:30px; margin:5%; font-size:20px; font-weight:700;">
				좋아하는 음악
			</div>
			<div style="width:90%; height:100px; margin:5%; font-size:16px; font-weight:400;">
				${profile.favo2 }
			</div>
		</div>
		<!-- 스포츠 -->
		<div style="width:20%; height:170px; margin:10px; border:0.1px solid #EEE; float:left;">
			<div style="width:90%; height:30px; margin:5%; font-size:20px; font-weight:700;">
				관심 스포츠
			</div>
			<div style="width:90%; height:100px; margin:5%; font-size:16px; font-weight:400;">
				${profile.favo3 }
			</div>
		</div>
		<div style="width: 145px; height: 145px; float: left; background-image:url(
			<c:choose>
				<c:when test="${profile.level=='3' }">
					/cupid/img/platinum.png
				</c:when>
				<c:when test="${profile.level=='2' }">
					/cupid/img/gold.png
				</c:when>
				<c:when test="${profile.level=='1' }">
					/cupid/img/dogpig.png
				</c:when>
				<c:otherwise>
					/cupid/img/god.png
				</c:otherwise>
			</c:choose>
		); background-position:50%; background-repeat:no-repeat; background-size:cover;"></div>
	</div>
	
	<div style="width:100%; height:20px; padding-top:30px; min-width:1200px; max-width:1800px; margin-left:auto; margin-right:auto; display:flex; flex-wrap:nowrap;">
		<div style="width:20%; height:20px;">
			총 게시물 : ${count }
		</div>
		<div style="width:60%; height:20px;"></div>
		<div style="width:20%; height:20px;">
			<c:if test="${myemail == thatemail }">
			<a href="PostWrite.do?nowserver=${nowserver }">
				<button type="button" style="width:150px;; height:50px; font-size:18px; font-weight:500; box-shadow: 3px 3px 8px 1px gray;">
					글 쓰 기
				</button>
			</a>
			</c:if>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${count == 0 }">
			<div style="width:100%; height:20px;"></div>
			<div align=center style="width:90%; height:180px; margin-top:50px; padding-top:120px; border:0.1px solid #CCC;">
				게시글 없음
			</div>
		</c:when>
		<c:otherwise>
		<c:forEach var="posts" items="${v }">
			<div style="width:100%; height:20px;"></div>
				<div style="width:930px; height:200px; box-shadow:3px 3px 8px 1px gray; padding:10px; font-size:16px;">
					<!-- 사진 -->
					<c:choose>
						<c:when test="${posts.file_rename == null }">
							<div style="width:150px; height:200px; border:0.1px solid #CCC; background-color:#DEF; float:left;"></div>
						</c:when>
						<c:when test="${posts.file_rename == '' }">
							<div style="width:150px; height:200px; border:0.1px solid #CCC; background-color:#DEF; float:left;"></div>
						</c:when>
						<c:otherwise>
							<div style="width:150px; height:200px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${posts.file_rename}); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
						</c:otherwise>
					</c:choose>
					<!-- 공백 -->
					<div style="width:29px; height:200px; float:left;"></div>
					<!-- 내용 -->
					<div style="width:590px; height:200px; float:left; text-align:left;">
						<!-- 이름 -->
						<div style="width:200px; height:30px; float:left;">
							<!-- 썸네일 사진 -->
							<div style="width:25px; height:25px; margin-top:2px; margin-left:5px; border:0.1px solid #CCC; background-image:url(/cupid/upload/${profile.profilepicture}); background-position:50%; background-repeat:no-repeat; background-size:cover; float:left;"></div>
						&nbsp; ${profile.name }
						</div>
						<!-- 이름 옆에 공백 -->
						<div style="width:390px; height:30px; float:left;"></div>
						<!-- 설명 -->
						<div style="width:590px; height:150px; margin-top:20px; float:left; overflow:hidden; font-size:16px;">
						${fn:replace(posts.post, newLineChar, "<br/>")}
						</div>
					</div>
					<!-- 세로공백 -->
					<div style="width:10px; height:200px; float:left; background-color:#EEE;"></div>
					<!-- 기타 -->
					<div style="width:150px; height:200px; float:left; text-align:center;">
						<!-- 조회수 -->
						<div style="width:150px; height:30px;"></div>
						<!-- 수정 -->
						<div style="width:150px; height:50px;">
							<c:if test="${profile.email == sessionScope.email }">
								<a href="PostModify.do?nowserver=${nowserver }&uid=${posts.uid }">
									<button align=center type="button" style="width:80%; height:30px; box-shadow:3px 3px 8px 1px gray;">
										수 정
									</button>
								</a>
							</c:if>
						</div>
						<!-- 삭제 -->
						<div style="width:150px; height:40px;">
							<c:if test="${profile.email == sessionScope.email }">
								<a href="PostDelete.do?nowserver=${nowserver }&uid=${posts.uid }">
									<button align=center type="button" style="width:80%; height:30px; box-shadow:3px 3px 8px 1px gray;">
										삭 제
									</button>
								</a>
							</c:if>
						</div>
						<!-- 서버 -->
						<div style="width:150px; height:35px; padding-top:5px;">
							서버 : ${posts.server }
						</div>
						<!-- 날짜 -->
						<div style="width:150px; height:25px; padding-top:15px;">${posts.date }</div>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	


	<div style="width: 100%; height: 0px; padding-bottom: 3%;"></div>
	</div>
	
	<!-- 목록부분 -->
	<c:set var="pageNum" value="${currentPage }" />	<!-- 현재 페이지 값 -->
	<c:set var="num_per_block" value="${pageSize }" />	<!-- 한페이지당 출력할 블럭 수 -->
	<c:set var="page_per_block" value="5" />				<!-- 플럭당 출력할 링크 수 -->
	<c:set var="count" value="${count }" />					<!-- 총 게시물 수 -->
	
	<!-- 총 페이지 수 -->
	<fmt:parseNumber var="total_page" value="${Math.ceil(count / num_per_block) }" integerOnly="true" />
	<!-- 총 블럭 수 -->
	<fmt:parseNumber var="total_block" value="${Math.ceil(total_page / page_per_block) }" integerOnly="true" />
	<!-- 블럭 수 -->
	<fmt:parseNumber var="block" value="${Math.ceil(pageNum / page_per_block) }" integerOnly="true" />
	
	<!-- 첫 페이지 -->
	<c:set var="first_page" value="${(block - 1) * page_per_block }"/>
	
	<!-- 끝 페이지 -->
	<c:set var="last_page" value="${block * page_per_block }"/>
	
	<c:if test="${total_block <= block }">
		<c:set var="last_page" value="${total_page }" />
	</c:if>
	
	<div style="float:left; width:100%; height:0px; padding-bottom:8%; color:#565656;">
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:4%; margin-right:1%; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="1" />
			<a href="Profile.do?nowserver=${nowserver }&email=tae@naver.com&pageNum=${my_page }">
				<b>&#60;&#60;</b> 처음페이지
			</a>
		</c:if>
	</div>
	
	<!-- 이전페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block > 1 }">
			<c:set var="my_page" value="${first_page }" />
			<a href="Profile.do?nowserver=${nowserver }&email=tae@naver.com&pageNum=${my_page }">
				<b>&#60;</b> 이전페이지로
			</a>
		</c:if>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%;"></div>
	
	<!-- 페이징 출력 처리 -->
	
	<div style="float:left; width:30%; height:0px; padding-bottom:8%; text-align:center;">
		<c:forEach var="i" begin="${first_page + 1 }" end="${last_page }">
			<c:if test="${pageNum == i }">
				<font style="font-size:28px; color:#000;">${i }&nbsp;</font>
			</c:if>
			<c:if test="${pageNum != i }">
				<a href="Profile.do?nowserver=${nowserver }&email=${email }&pageNum=${i }" style="font-size:25px; color:#777;">${i }</a>&nbsp;
			</c:if>
		</c:forEach>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656;"></div>
	
	<!-- 다음페이지 -->
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${last_page + 1 }" />
			<a href="Profile.do?nowserver=${nowserver }&email=${email }&pageNum=${my_page2 }">
				다음페이지로 <b>&#62;</b>
			</a>
		</c:if>
	</div>
	
	<div style="float:left; width:10%; height:0px; padding-bottom:8%; color:#565656; margin-left:1%; cursor:pointer;">
		<c:if test="${block < total_block }">
			<c:set var="my_page2" value="${total_page }" />
			<a href="Profile.do?nowserver=${nowserver }&email=${email }&pageNum=${my_page2 }">
				마지막페이지 <b>&#62;&#62;</b>
			</a>
		</c:if>
	</div>
</div>





	<jsp:include page="/tail.jsp" />