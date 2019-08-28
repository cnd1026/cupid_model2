package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/SessionTimeProc.do")
public class SessionTimeProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SessionTimeProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSessionTimeProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSessionTimeProc(request, response);
	}
	
	protected void doSessionTimeProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 세션 이메일
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		// 오늘 날짜 구하기
		
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signdate = cal.format(today);
		
		// 마지막 엑세스 날짜 시간 입력하기
		
		MemberDAO dao = new MemberDAO();
		
		dao.sessionTime(email, signdate);
		
		// 창닫으러 가기
		
		response.sendRedirect("/cupid/active/closewindow.jsp");
	}

}
