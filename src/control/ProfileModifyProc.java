package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberBean;

@WebServlet("/ProfileModifyProc.do")
public class ProfileModifyProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ProfileModifyProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProfileModifyProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProfileModifyProc(request, response);
	}
	
	protected void doProfileModifyProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 수정정보 갖고오기
		
		String nowserver = request.getParameter("nowserver");
		String whoami = request.getParameter("whoami");
		String want = request.getParameter("want");
		String profilepicture = request.getParameter("profilepicture");
		String[] myfavo = request.getParameterValues("favo");
		String[] myfavo1 = request.getParameterValues("favo1");
		String[] myfavo2 = request.getParameterValues("favo2");
		String[] myfavo3 = request.getParameterValues("favo3");
		
		// 세션이메일 불러오기
		
		HttpSession session = request .getSession();
		String email = (String)session.getAttribute("email");
		
		// 세션 이메일 정보 갖고오기
		
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();		
		
		bean = dao.viewMember(email);
		
		// 프사 입력 안했을때 원래 프사로 지정
		
		if (profilepicture==null) {
			profilepicture = bean.getProfilepicture();
		}
		
		// 취미들을 한개의 String 으로 지정
		
		String favo = "";
		String favo1 = "";
		String favo2 = "";
		String favo3 = "";
		
		if (myfavo.length>1) {
			favo = myfavo[1];
			for (int i=2; i<myfavo.length; i++) {
				favo = favo + ", " + myfavo[i];
			}
		} else {
			favo = "없음";
		}

		if (myfavo1.length>1) {
			favo1 = myfavo1[1];
			for (int i=2; i<myfavo1.length; i++) {
				favo1 = favo1 + ", " + myfavo1[i];
			}
		} else {
			favo1 = "없음";
		}
		
		if (myfavo2.length>1) {
			favo2 = myfavo2[1];
			for (int i=2; i<myfavo2.length; i++) {
				favo2 = favo2 + ", " + myfavo2[i];
			}
		} else {
			favo2 = "없음";
		}
		
		if (myfavo3.length>1) {
			favo3 = myfavo3[1];
			for (int i=2; i<myfavo3.length; i++) {
				favo3 = favo3 + ", " + myfavo3[i];
			}
		} else {
			favo3 = "없음";
		}
		
		// 수정하기
		
		dao.modifyProfile(email, whoami, want, profilepicture, favo, favo1, favo2, favo3);
		
		// 수정완료 메세지 주고 이동
		
		request.setAttribute("nowserver", nowserver);
		request.setAttribute("email", email);
		
		response.sendRedirect("Profile.do?nowserver="+nowserver+"&&email="+email);
	}

}
