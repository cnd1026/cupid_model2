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

@WebServlet("/FindId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FindId() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doIdsearch(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doIdsearch(request, response);
	}

	protected void doIdsearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		bean = dao.searchId(name);
		
		request.setAttribute("email", bean.getEmail());
			
		RequestDispatcher dis = request.getRequestDispatcher("member/findpass.jsp");
		dis.forward(request, response);			
	}
}
