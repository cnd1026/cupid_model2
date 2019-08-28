package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import model.MemberBean;

@WebServlet("/FindPw.do")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FindPw() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPwsearch(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPwsearch(request, response);
	}

	protected void doPwsearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		bean = dao.searchPw(email,name);
		
		request.setAttribute("email", bean.getEmail());
		request.setAttribute("password", bean.getPassword());
		
			
		RequestDispatcher dis = request.getRequestDispatcher("member/viewpass.jsp");
		dis.forward(request, response);			
	}

}
