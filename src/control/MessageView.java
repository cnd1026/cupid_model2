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
import dao.MessageDAO;
import model.MemberBean;
import model.MessageBean;

@WebServlet("/MessageView.do")
public class MessageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MessageView() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMessageView(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMessageView(request, response);
	}
	
	protected void doMessageView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		
		HttpSession session = request.getSession();
		String sendemail = (String)session.getAttribute("email");
		String receiveemail = request.getParameter("email");
	
		MemberBean ybean = new MemberBean();
		MemberDAO ydao = new MemberDAO();
		
		String email = request.getParameter("email");
		ybean = ydao.viewMember(email);
		request.setAttribute("profile", ybean);
		
		MemberBean mbean = new MemberBean();
		MemberDAO mdao = new MemberDAO();
		String memail = (String)session.getAttribute("email");
		mbean = mdao.viewMessa(memail);
		request.setAttribute("m", mbean);
		

		MessageDAO dao = new MessageDAO();
		
		Vector<MessageBean> v = dao.getAllMessage(sendemail,receiveemail);
		request.setAttribute("v", v);
		
		RequestDispatcher dis = request.getRequestDispatcher("/bbs/mm.jsp");
		dis.forward(request, response);
	}
}
