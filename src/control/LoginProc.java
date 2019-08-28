package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberBean;

@WebServlet("/LoginProc.do")
public class LoginProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLoginProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLoginProc(request, response);
	}
	
	protected void doLoginProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();	
		
		bean = dao.viewMember(email);
		
		// 이메일 존재 확인
		
		String loginemail = bean.getEmail();
		if (loginemail==null) {
			request.setAttribute("msg", "존재하지 않는 이메일 입니다.");
			request.setAttribute("url", "Login.do");
			
			RequestDispatcher dis = request.getRequestDispatcher("/member/error.jsp");
			dis.forward(request, response);
		}
		
		// 비밀번호 일치 확인
		
		String loginpassword = bean.getPassword();
		if (!password.equals(loginpassword)) {
			request.setAttribute("msg", "비밀번호가 틀렸습니다.");
			request.setAttribute("url", "Login.do");
			
			RequestDispatcher dis = request.getRequestDispatcher("/member/error.jsp");
			dis.forward(request, response);
		}
		
		// 회원정보 세션에 넣기
		
		HttpSession session = request .getSession();
		session.setAttribute("email", bean.getEmail());
		session.setAttribute("name", bean.getName());
		session.setAttribute("gender", bean.getGender());
		session.setAttribute("level", bean.getLevel());
		
		response.sendRedirect("Index.do?nowserver=100");
	}

}
