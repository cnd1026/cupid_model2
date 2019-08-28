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
import dao.PostDAO;
import model.MemberBean;
import model.PostBean;

@WebServlet("/PostModify.do")
public class PostModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 public PostModify() {
	     super();
	 }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostModify(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostModify(request, response);
	}
	
	protected void doPostModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		HttpSession session = request .getSession();
		String email = (String)session.getAttribute("email");
		String postuid = request.getParameter("uid");
		int uid = Integer.parseInt(postuid);
		
		// 글쓴이 정보 갖고오기
		
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();
		
		bean = dao.viewMember(email);
		
		// post 정보 갖고오기
		
		PostDAO dpo = new PostDAO();
		PostBean pbean = new PostBean();
		
		pbean = dpo.viewPost(uid);
		
		request.setAttribute("bean", bean);
		request.setAttribute("pbean", pbean);
		request.setAttribute("nowserver", nowserver);
		
		RequestDispatcher dis = request.getRequestDispatcher("/bbs/postModify.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}

}