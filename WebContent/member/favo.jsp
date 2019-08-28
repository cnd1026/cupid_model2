<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.left{float:left}
	.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
	.formContainer li{display:block;padding:7px 30px;border-bottom:1px solid #ddd;list-style-type:none}
	.roundedContainer{margin:15px;-webkit-border-radius:10px;-moz-border-radius:10px;border-radius:10px;border:1px solid #acabab}
</style>
</head>
<body>

<form action="/cupid/member/favo_update.jsp"; name="favoinfo" method="post">
<div style="width:100%; display:block;">
<div style="width:535px; height:1900px; margin:0 auto; border:1px solid #CCCCCC; box-shadow:3px 3px 8px 1px gray;">
<ul>
<li style="content:''; display:table;">
취미 및 관심사 수정<br><br>
여가시간에 주로 하는 것은?
<div style="width:475px; float:left;">
                      
   	 <div style="width:50%; float:left;">

	<label><div style="width:100%;"><input type="checkbox" value="바" name="favo">바</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="나이트클럽" name="favo">나이트클럽</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="클럽" name="favo">클럽</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="TV시청:교육/뉴스" name="favo">TV시청:교육/뉴스</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="TV시청:오락" name="favo">TV시청:오락</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="노래방" name="favo">노래방</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="가족" name="favo">가족</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="골동품" name="favo">골동품</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="공예" name="favo">공예</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="과학/기술" name="favo">과학/기술</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="교육" name="favo">교육</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="영화관" name="favo">영화관</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="글쓰기" name="favo">글쓰기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="뉴스/정치" name="favo">뉴스/정치</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="도서관" name="favo">도서관</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="독서" name="favo">독서</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="명상" name="favo">명상</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="모토사이클링" name="favo">모토사이클링</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="박물관/갤러리" name="favo">박물관/갤러리</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="발레" name="favo">발레</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="보드/카드게임" name="favo">보드/카드게임</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="비디오/온라인게임" name="favo">비디오/온라인게임</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="사진" name="favo">사진</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="사회운동/캠페인" name="favo">사회운동/캠페인</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="쇼핑" name="favo">쇼핑</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="수집" name="favo">수집</div></label>
	
	</div>
	 <div style="width:50%; float:left;">
	
	
	<label><div style="width:100%;"><input type="checkbox" value="스포츠경기관람" name="favo">스포츠경기관람</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="시" name="favo">시</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="여행" name="favo">여행</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="애완동물" name="favo">애완동물</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="와인시식" name="favo">와인시식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="외식" name="favo">외식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="요리/음식/와인" name="favo">요리/음식/와인</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="음악하기" name="favo">음악하기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="음악듣기" name="favo">음악듣기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="자동차/기계" name="favo">자동차/기계</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="자원봉사" name="favo">자원봉사</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="저녘파티" name="favo">저녘파티</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="정원관리/조경" name="favo">정원관리/조경</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="집단장/수리" name="favo">집단장/수리</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="철학/사고" name="favo">철학/사고</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="첨성학" name="favo">첨성학</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="춤" name="favo">춤</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="카지노/도박" name="favo">카지노/도박</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="캠핑/자연체험" name="favo">캠핑/자연체험</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="컴퓨터/인터넷" name="favo">컴퓨터/인터넷</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="코미디클럽" name="favo">코미디클럽</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="콘서트/라이브뮤직" name="favo">콘서트/라이브뮤직</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="투자/자산관리" name="favo">투자/자산관리</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="패션이벤트" name="favo">패션이벤트</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="해변가/공원" name="favo">해변가/공원</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo">기타</div></label>
	
	</div>
	</div>
	</li>
	
	<br>
	<li style="content:''; display:table;">
	
	<div style="width:475px; float:left;">
        가장 좋아하는 음식은?<br>              
   	 <div style="width:50%; float:left;">
	
	                      
   	 
	<label><div style="width:100%;"><input type="checkbox" value="그리스식" name="favo1">그리스식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="남미식" name="favo1">남미식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="남서부식" name="favo1">남서부식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="인도식" name="favo1">인도식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="독일식" name="favo1">독일식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="동유럽식" name="favo1">동유럽식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="멕시코식" name="favo1">멕시코식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="바베큐" name="favo1">바베큐</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="베트남식" name="favo1">베트남식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="소울푸드" name="favo1">소울푸드</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="순 채식주의자" name="favo1">순 채식주의자</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="아메리카식" name="favo1">아메리카식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="유대식/코세르" name="favo1">유대식/코세르</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="이태리식" name="favo1">이태리식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="인도식" name="favo1">인도식</div></label>
	
	</div>
	 <div style="width:50%; float:left;">
	 
	<label><div style="width:100%;"><input type="checkbox" value="일본/sushi" name="favo1">일본/sushi</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="중국식/딤섬" name="favo1">중국식/딤섬</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="중동식" name="favo1">중동식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="지중해식" name="favo1">지중해식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="채식주의/유기농식" name="favo1">채식주의/유기농식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="캐리비안/쿠바" name="favo1">캐리비안/쿠바</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="캘리포니아퓨전" name="favo1">캘리포니아퓨전</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="컨티넨탈" name="favo1">컨티넨탈</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="케이준/남부" name="favo1">케이준/남부</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="태국식" name="favo1">태국식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="패스트푸드/피자" name="favo1">패스트푸드/피자</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="프랑스식" name="favo1">프랑스식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="한국식" name="favo1">한국식</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="해물요리" name="favo1">해물요리</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo1">기타</div></label>
	
	
	</div>
	</div>
	</li>
	
	<br>
	
	<li style="content:''; display:table;">
	
	
	<div style="width:475px; float:left;">
        가장 좋아하는 음악은?<br>              
   	 <div style="width:50%; float:left;">
   	 
	<label><div style="width:100%;"><input type="checkbox" value="R&B/힙합" name="favo2">R&B/힙합</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="뉴에이지" name="favo2">뉴에이지</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="댄스/테크노" name="favo2">댄스/테크노</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="랩" name="favo2">랩</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="레게" name="favo2">레게</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="록" name="favo2">록</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="메탈" name="favo2">메탈</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="소프트록" name="favo2">소프트록</div></label>
	
	
    
     </div>           
   	 <div style="width:50%; float:left;">
   	 
	<label><div style="width:100%;"><input type="checkbox" value="얼터너티브" name="favo2">얼터너티브</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="월드" name="favo2">월드</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="종교음악" name="favo2">종교음악</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="재즈/블루스" name="favo2">재즈/블루스</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="컨츄리/포크" name="favo2">컨츄리/포크</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="클래식/오페라" name="favo2">클래식/오페라</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="팝" name="favo2">팝</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo2">기타</div></label>
	
	
	
	</div>
	</div>
	</li>
	<br>
	
	<li style="content:''; display:table;">
	
	
	<div style="width:475px; float:left;">
        가장 좋아하는 스포츠 경기는?<br>          
   	 <div style="width:50%; float:left;">
   	 
	<label><div style="width:100%;"><input type="checkbox" value="BMX/산악자전거" name="favo3">BMX/산악자전거</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="걷기" name="favo3">걷기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="격투기" name="favo3">격투기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="골프" name="favo3">골프</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="극한스포츠" name="favo3">극한스포츠</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="낙하산/번지점프" name="favo3">낙하산/번지점프</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="낚시" name="favo3">낚시</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="넷볼" name="favo3">넷볼</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="농구" name="favo3">농구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="다이빙" name="favo3">다이빙</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="다트" name="favo3">다트</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="등산/압벽등반" name="favo3">등산/압벽등반</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="라크로스" name="favo3">라크로스</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="럭비" name="favo3">럭비</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="레슬링" name="favo3">레슬링</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="모토스포츠" name="favo3">모토스포츠</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="미식축구" name="favo3">미식축구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="배구" name="favo3">배구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="보디빌딩" name="favo3">보디빌딩</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="보트/요트" name="favo3">보트/요트</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="복싱" name="favo3">복싱</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="볼링" name="favo3">볼링</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="사냥/사격" name="favo3">사냥/사격</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="서핑" name="favo3">서핑</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="설상차운전" name="favo3">설상차운전</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="수영" name="favo3">수영</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="스케이트보드" name="favo3">스케이트보드</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="스쿠버다이빙/스노클링" name="favo3">스쿠버다이빙/스노클링</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="스쿼시/라켓볼" name="favo3">스쿼시/라켓볼</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="스키/스노보드" name="favo3">스키/스노보드</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="승마" name="favo3">승마</div></label>
	
	
    
     </div>                
   	 <div style="width:50%; float:left;">
   	 
	<label><div style="width:100%;"><input type="checkbox" value="싸이클링" name="favo3">싸이클링</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="아이스스케이팅/아이스하키" name="favo3">아이스스케이팅/아이스하키</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="야구/소프트볼" name="favo3">야구/소프트볼</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="양궁" name="favo3">양궁</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="에어로빅" name="favo3">에어로빅</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="요가/필라테스" name="favo3">요가/필라테스</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="윈드서핑/연날리기" name="favo3">윈드서핑/연날리기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="육상" name="favo3">육상</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="인라인스케이팅" name="favo3">인라인스케이팅</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="자동차경주" name="favo3">자동차경주</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="자전거타기" name="favo3">자전거타기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="제트/수상스키" name="favo3">제트/수상스키</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="조깅/달리기" name="favo3">조깅/달리기</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="조정" name="favo3">조정</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="체조" name="favo3">체조</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="축구" name="favo3">축구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="카누/카약" name="favo3">카누/카약</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="크리켓" name="favo3">크리켓</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="탁구" name="favo3">탁구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="테니스/배드민턴" name="favo3">테니스/배드민턴</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="포켓볼/당구" name="favo3">포켓볼/당구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="폴로" name="favo3">폴로</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="피겨스케이팅" name="favo3">피겨스케이팅</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="하이킹" name="favo3">하이킹</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="하키" name="favo3">하키</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="행글라이딩/패러글라이딩" name="favo3">행글라이딩/패러글라이딩</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="헬스클럽/웨이트트레이닝" name="favo3">헬스클럽/웨이트트레이닝</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="협곡타기/동굴탐험" name="favo3">협곡타기/동굴탐험</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="호주식축구" name="favo3">호주식축구</div></label>
	<label><div style="width:100%;"><input type="checkbox" value="기타" name="favo3">기타</div></label>
	
	</div>
	</div>
	
	</li>
	
	</ul>
	</div><button type="submit" name="updatefavobtn" >보내기</button>
</div>
	
	

</form>

</body>
</html>