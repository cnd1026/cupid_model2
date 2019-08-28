package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;

import dao.MemberDAO;
import model.MemberBean;

@WebServlet("/MemberModifyProc.do")
public class MemberModifyProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberModifyProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMemberModifyProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMemberModifyProc(request, response);
	}
	
	protected void doMemberModifyProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		String nowserver = request.getParameter("nowserver");
		
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String age = year + month + day;
		
		// 이메일 존재 여부 확인
		
		HttpSession session = request .getSession();
		String myemail = (String)session.getAttribute("email");
		
			// 세션 이메일과 변경 이메일이 다르다면 검사한다
		
		if (!email.equals(myemail)) {
			bean = dao.viewMember(email);
			String checkemail = bean.getEmail();
			
				// 새로 입력한 이메일이 존재한다면 ERROR
			
			if (checkemail!=null) {
				request.setAttribute("msg", "이미 존재하는 이메일 입니다.");
				request.setAttribute("url", "MemberModify.do?nowserver="+nowserver);
				
				RequestDispatcher dis = request.getRequestDispatcher("/member/error.jsp");
				dis.forward(request, response);
			}
		}
		
		// 없으므로 업데이트 진행
		
		MemberBean upbean = new MemberBean();
		MemberDAO updao = new MemberDAO();
		
		upbean.setName(name);
		upbean.setGender(gender);
		upbean.setAge(age);
		upbean.setEmail(email);
		upbean.setPassword(password);
		
		upbean = updao.modifyMember(upbean, myemail);
		
		request.setAttribute("nowserver", nowserver);
		session.setAttribute("email", upbean.getEmail());
		session.setAttribute("name", upbean.getName());
		
		response.sendRedirect("Index.do?nowserver="+nowserver);
	}

}
