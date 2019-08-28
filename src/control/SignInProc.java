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

@WebServlet("/SignInProc.do")
public class SignInProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SignInProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSignInProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doSignInProc(request, response);
	}

	protected void doSignInProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String gender = request.getParameter("gender");
		String land = request.getParameter("land");
		String area = request.getParameter("area");
		String addr = land + " " + area;
		
		System.out.println(land);
		System.out.println(area);
		System.out.println(addr);
		
		// 이메일이 존재하는지 판단
		
		bean = dao.viewMember(email);
		
		String existence = bean.getEmail();
		if (existence!=null) {
			request.setAttribute("msg", "이미 존재하는 이메일 입니다.");
			request.setAttribute("url", "SignIn.do");
			
			RequestDispatcher dis = request.getRequestDispatcher("/member/error.jsp");
			dis.forward(request, response);
		}
		
		// 생년월일 합체
		
		String age = year + month + day;
		
		// 가입 입력하기
		
		 bean.setEmail(email);
		 bean.setPassword(password);
		 bean.setName(name);
		 bean.setAge(age);
		 bean.setGender(gender);
		 bean.setAddr(addr);
		 
		 dao.insertMember(bean);
		 
		 // 세션에 입력
		 
		 HttpSession session = request .getSession();
			session.setAttribute("email", bean.getEmail());
			session.setAttribute("name", bean.getName());
			session.setAttribute("level", bean.getLevel());
			session.setAttribute("gender", bean.getGender());
		 
		 request.setAttribute("msg", "회원가입 성공!");
			request.setAttribute("url", "Index.do?nowserver=100");
			
			RequestDispatcher dis = request.getRequestDispatcher("/member/error.jsp");
			dis.forward(request, response);
	}
	
}
