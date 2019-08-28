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
import dao.PostDAO;
import model.MemberBean;
import model.PostBean;


@WebServlet("/ProfileModify.do")
public class ProfileModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ProfileModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProfileModify(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProfileModify(request, response);
	}
	
	protected void doProfileModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		// 세션이메일 불러오기
		
		HttpSession session = request .getSession();
		String email = (String)session.getAttribute("email");
		
		// 프로필 정보 갖고오기
		
		bean = dao.viewMember(email);
		request.setAttribute("profile", bean);
		
		// 사진들 갖고오기
		
		Vector<PostBean> pbean = new Vector<PostBean>();
		PostDAO dpo = new PostDAO();
		
		pbean = dpo.getPostMyPicture(email);
		
		request.setAttribute("vp", pbean);
		
		RequestDispatcher dis = request.getRequestDispatcher("/member/profileModify.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}

}

