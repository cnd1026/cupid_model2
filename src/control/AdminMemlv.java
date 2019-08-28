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

import dao.HeartDAO;
import dao.LookmeDAO;
import dao.MemberDAO;
import dao.PostDAO;
import model.HeartBean;
import model.LookmeBean;
import model.MemberBean;
import model.PostBean;

@WebServlet("/AdminMemlv.do")
public class AdminMemlv extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public AdminMemlv() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doAdminMemlv(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAdminMemlv(request, response);
	}
	
	protected void doAdminMemlv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		MemberDAO dgo = new MemberDAO();
		
		// 세션이메일 불러오기
		
		HttpSession session = request .getSession();
		String myemail = (String)session.getAttribute("email");
		
		// 프로필 정보 갖고오기
		
		String email = request.getParameter("email");
		
		
		MemberDAO dpo = new MemberDAO();
		
		// 전체 게시물 수
		int count = 0;
		// 한 페이지에 보여질 글의 갯수
		int pageSize = 10;
		// 페이지 넘버 값
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 넘버값 정수처리
		int currentPage = Integer.parseInt(pageNum);
		// 현재 페이지 보여질 넘버링 숫자 초기화
		int number = 0;
		
		// 총 게시물 수
		count = dgo.getAllAdmincount(email);
		
		// 현재 보여질 페이지 limit 설정
		int startRow = (currentPage - 1) * pageSize;
		int endRow = pageSize;
		
		// 페이지 넘버링 처리
		number = count - (currentPage - 1) * pageSize;
		Vector<MemberBean> v = dao.viewMember1(email, startRow, endRow);
		request.setAttribute("v", v);
		
		//request 객체에 담아서 전달
		request.setAttribute("v", v);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("email", email);
		
		RequestDispatcher dis = request.getRequestDispatcher("/admin/memberlv.jsp");
		dis.forward(request, response);
	}
	}
