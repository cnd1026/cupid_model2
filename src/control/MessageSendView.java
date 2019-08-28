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
import dao.MessageDAO;
import model.MessageBean;

@WebServlet("/MessageSendView.do")
public class MessageSendView extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public MessageSendView() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSendView(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSendView(request, response);
	}
	protected void doSendView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		//━━━━━━━━━━━━━━━━로그인시간체크━━━━━━━━━━━━━━━━━━━┓
		HttpSession lastl = request.getSession();														//┃
		String lastle = (String)lastl.getAttribute("email");											//┃
		Date lastlt = new Date();																		//┃		
		SimpleDateFormat lastlty = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	//┃
		String lastld = lastlty.format(lastlt);															//┃
		MemberDAO lastldao = new MemberDAO();												//┃
		lastldao.sessionTime(lastle, lastld);																//┃
		//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
		// age 나이로 고칠것
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
		
		MessageDAO dao = new MessageDAO();
		
		// 전체 게시물 수
		int count = 0;
		// 한 페이지에 보여질 글의 갯수
		int pageSize = 5;
		// 페이지 넘버 값
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 넘버값 정수처리
		int currentPage = Integer.parseInt(pageNum);
		// 현재 페이지 보여질 넘버링 숫자 초기화
		int number = 0;
		
		// 서버 총 게시물 수
		count = dao.sendMessagecount(email);
		
		// 현재 보여질 페이지 limit 설정
		int startRow = (currentPage - 1) * pageSize;
		int endRow = pageSize;
		
		// 페이지 넘버링 처리
		number = count - (currentPage - 1) * pageSize;
		
		Vector<MessageBean> m = dao.sendMessageList(email,nowyear,startRow,endRow);
		
		request.setAttribute("m", m);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		RequestDispatcher dis = request.getRequestDispatcher("/bbs/sendm.jsp");
		dis.forward(request, response);
	}
}
