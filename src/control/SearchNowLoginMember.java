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

@WebServlet("/SearchNowLoginMember.do")
public class SearchNowLoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public SearchNowLoginMember() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSearchNowLoginMember(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSearchNowLoginMember(request, response);
	}
	
	protected void doSearchNowLoginMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				
		String nowserver = request.getParameter("searchserver");
		String gender = request.getParameter("searchgender");
		String searchlevel = request.getParameter("searchlevel");
		String searchFirstAge = request.getParameter("searchfirstage");
		String searchLastAge = request.getParameter("searchlastage");
		
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
		
		String firstAgeYear = Integer.toString((Integer.parseInt(nowyear))-(Integer.parseInt(searchFirstAge)-1)); 
		String lastAgeYear = Integer.toString((Integer.parseInt(nowyear))-(Integer.parseInt(searchLastAge)-1));
		
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
		
		// 몇 분 전까지 로그인 사람을 구할 것 인가
		
		int lastLogin = 59;
		
		// 사람들 불러오기
		
		MemberDAO dao = new MemberDAO();
		MemberDAO dpo = new MemberDAO();
		MemberDAO dco = new MemberDAO();
		
		// 전체 게시물 수
		int count = 0;
		// 페이지 넘버 값
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 넘버값 정수처리
		int currentPage = Integer.parseInt(pageNum);
		
		// 상관없음 플레티넘 갯수
		
		int searchPlatinumCount = dco.searchPlatinumCountLogin(land, gender, firstAgeYear, lastAgeYear, lastLogin);
		int platinumP = searchPlatinumCount/9;
		int ilbuP = platinumP + 1;
		int namuji = searchPlatinumCount%9;
		
		// 한 페이지에 보여질 회원의 수
		
		int startRow = 0;
		int endRow = 0;
		int pageSize = 0;
		if (searchlevel.equals("4")) {
			if (currentPage <= platinumP) {
				pageSize = 9;
				startRow = (currentPage - 1) * pageSize;
				endRow = pageSize;
			} else if (currentPage == ilbuP) {
				pageSize = 18-namuji;
				startRow = (currentPage - 1) * 9;
				endRow = pageSize;
			} else {
				pageSize = 18;
				startRow = ((currentPage - 1) * pageSize)-searchPlatinumCount;
				endRow = pageSize;
			}
		} else if (searchlevel.equals("3")) {
			pageSize = 9;
			startRow = (currentPage - 1) * pageSize;
			endRow = pageSize;
		} else {
			pageSize = 18;
			startRow = (currentPage - 1) * pageSize;
			endRow = pageSize;
		}
		
		// 총 이성 회원 수
		count = dao.searchGetAllMemberLogin(land, gender, firstAgeYear, lastAgeYear, searchlevel, lastLogin);
				
		// 입력된 수만큼 회원들 불러오기
		Vector<MemberBean> vs = dpo.searchGetMemberLogin(land, gender, startRow, endRow, nowyear, firstAgeYear, lastAgeYear, searchlevel, lastLogin);
		
		//request 객체에 담아서 전달
		request.setAttribute("vs", vs);
		request.setAttribute("nowserver", nowserver);
		request.setAttribute("count", count);
		request.setAttribute("searchPlatinumCount", searchPlatinumCount);
		request.setAttribute("gender", gender);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("firstage", request.getParameter("searchfirstage"));
		request.setAttribute("lastage", request.getParameter("searchlastage"));
		request.setAttribute("levelgo", searchlevel);
		
		RequestDispatcher dis = request.getRequestDispatcher("/mannam/searchNowLoginMember.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}

}
