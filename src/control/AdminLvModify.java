package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberBean;

@WebServlet("/AdminLvModify.do")
public class AdminLvModify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminLvModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAdminLvModify(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAdminLvModify(request, response);
	}
	
	protected void doAdminLvModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 수정정보 갖고오기
		
		String[] level = request.getParameterValues("level");
		
		String[] email = request.getParameterValues("email");
		
		// 세션 이메일 정보 갖고오기
		
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();		
		
		for (int i=0; i<level.length; i++) {
			System.out.println(email[i]);
			System.out.println(level[i]);
			
			bean = dao.viewMember(email[i]);
			
			// 수정하기
			dao.modifyAdminProfile(level[i], email[i]);
			
		}
		
		
		// 수정완료 메세지 주고 이동
		
		request.setAttribute("email", email);
		
		response.sendRedirect("AdminMemlv.do");
	}
}
