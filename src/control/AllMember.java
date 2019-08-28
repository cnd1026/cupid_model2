package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberBean;
import model.PostBean;

@WebServlet("/AllMember.do")
public class AllMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public AllMember() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAllMember(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAllMember(request, response);
	}

	protected void doAllMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//━━━━━━━━━━━━━━━━로그인시간체크━━━━━━━━━━━━━━━━━━━┓
				HttpSession lastl = request.getSession();														//┃
				String lastle = (String)lastl.getAttribute("email");											//┃
				Date lastlt = new Date();																		//┃		
				SimpleDateFormat lastlty = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	//┃
				String lastld = lastlty.format(lastlt);															//┃
				MemberDAO lastldao = new MemberDAO();												//┃
				lastldao.sessionTime(lastle, lastld);																//┃
		//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
				
		String nowserver = request.getParameter("nowserver");
		
		String land = "";
		if (nowserver.equals("1")) {
			land = "울산%";
		} else if (nowserver.equals("2")) {
			land = "부산%";
		} else if (nowserver.equals("3")) {
			land = "경상남도%";
		} else if (nowserver.equals("4")) {
			land = "경상북도%";
		} else if (nowserver.equals("5")) {
			land = "충청남도%";
		} else if (nowserver.equals("6")) {
			land = "충청북도%";
		} else if (nowserver.equals("7")) {
			land = "강원도%";
		} else if (nowserver.equals("8")) {
			land = "경기도%";
		} else if (nowserver.equals("9")) {
			land = "대구%";
		} else if (nowserver.equals("10")) {
			land = "인천%";
		} else if (nowserver.equals("11")) {
			land = "광주%";
		} else if (nowserver.equals("12")) {
			land = "대전%";
		} else if (nowserver.equals("13")) {
			land = "제주도%";
		} else if (nowserver.equals("14")) {
			land = "서울%";
		} else if (nowserver.equals("15")) {
			land = "세종%";
		} else if (nowserver.equals("16")) {
			land = "전라남도%";
		} else if (nowserver.equals("17")) {
			land = "전라북도%";
		} else {
			land = "%";
		}
		
		// 세션 성별
		
		HttpSession session = request.getSession();
		String gender = "";
		if (((String)session.getAttribute("gender")).equals("남자")) {
			gender = "여자";
		} else {
			gender = "남자";
		}
		
		// 사람들 불러오기
		
		MemberDAO dao = new MemberDAO();
		MemberDAO dpo = new MemberDAO();
		
		// 플레티넘 회원수 세기
		
		MemberDAO dco = new MemberDAO();
		int platinumCount = dco.platinumCount(land, gender);
		
		// 페이지에 들어갈 플레티넘 회원 수
		
		int full = platinumCount / 3;		// 플레티넘이 3명 꽉찬 페이지
		int fullNext = full + 1;				// 플레티넘이 꽉 안찬 페이지 ( noFull명 )
		int noFull = platinumCount%3;		// fullNext 페이지에 들어갈 플레티넘 회원수
		
		// 전체 게시물 수
		int count = 0;
		// 페이지 넘버 값
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 넘버값 정수처리
		int currentPage = Integer.parseInt(pageNum);
		
		// 한 페이지에 보여질 플레티넘 회원의 수
		int oneLinePageSize = 3;
		int oneLineStartRow = (currentPage - 1) * oneLinePageSize;
		int oneLineEndRow = oneLinePageSize;
		
		// 한 페이지에 보여질 일반 회원의 수
		int twoLinePageSize = 12;
		int twoLineStartRow = (currentPage - 1) * twoLinePageSize;
		int twoLineEndRow = twoLinePageSize;
		
		// 지금 페이지에 들어 갈 회원 종류 정리
		
		// 3명 꽉 찬 페이지 일때
		if ( currentPage <= full ) {
			// 기본 환경으로 적용
			
		// 꽉 차지 않는 페이지 일때
		} else if ( currentPage == fullNext ) {
			oneLineEndRow = noFull;
			twoLineEndRow = twoLinePageSize + (( 3 - noFull ) * 2 );
			
		// 플레티넘이 없는 페이지 일때
		} else {
			oneLinePageSize = 0;
			oneLineStartRow = 0;
			oneLineEndRow = 0;
			twoLinePageSize = 18;
			twoLineStartRow = ((currentPage - 1) * twoLinePageSize) - (platinumCount * 2 );
			twoLineEndRow = twoLinePageSize;
		}
		
		// 총 이성 회원 수
		count = dao.getAllMember(land, gender);
		
		// age 나이로 고칠것
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
				
		// 입력된 수만큼 회원들 불러오기
		Vector<MemberBean> vp = dpo.getPlatinum(land, gender, oneLineStartRow, oneLineEndRow, nowyear);
		Vector<MemberBean> va = dpo.getMemberNormal(land, gender, twoLineStartRow, twoLineEndRow, nowyear);
		
		//request 객체에 담아서 전달
		request.setAttribute("vp", vp);
		request.setAttribute("va", va);
		request.setAttribute("nowserver", nowserver);
		request.setAttribute("platinumCount", platinumCount);
		request.setAttribute("count", count);
		request.setAttribute("oneLinePageSize", oneLinePageSize);
		request.setAttribute("twoLinePageSize", twoLinePageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("gender", gender);
		
		RequestDispatcher dis = request.getRequestDispatcher("/mannam/allMember.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}
	
}
