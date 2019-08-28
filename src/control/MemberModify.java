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

@WebServlet("/MemberModify.do")
public class MemberModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MemberModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMemberModify(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMemberModify(request, response);
	}
	
	protected void doMemberModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		// 회원정보 불러오기
		
		HttpSession session = request .getSession();
		String email = (String)session.getAttribute("email");
		int level = (int)session.getAttribute("level");
		
		bean = dao.viewMember(email);
		
		// 무료회원 농락 맨트 날려주기
		
		String nongrock = "";
		
		if (level==1) {
			nongrock = "일반 회원 입니다.";
		} else if (level==2) {
			nongrock = "골드 회원 입니다.";
		} else if (level==3) {
			nongrock = "플레티넘 회원 입니다.";
		} else if (level==10) {
			nongrock = "운영자님 입니다.";
		} else {
			nongrock = "";
		}
		
		// 내보내기
		
		request.setAttribute("nongrock", nongrock);
		request.setAttribute("me", bean);
		
		RequestDispatcher dis = request.getRequestDispatcher("/member/signin_modify.jsp");
		dis.forward(request, response);
	}

}
