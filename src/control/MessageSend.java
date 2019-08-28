package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.MessageDAO;

@WebServlet("/MessageSend.do")
public class MessageSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MessageSend() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMessageSend(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doMessageSend(request, response);
	}
	
	protected void doMessageSend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		MessageDAO dao = new MessageDAO();
		HttpSession session = request.getSession();
		String sendemail = (String)session.getAttribute("email");
		String receiveemail = request.getParameter("email");
		String comment = request.getParameter("smsg");
		String date = request.getParameter("date");
	
		dao.sendMessage (sendemail,receiveemail,comment,date);
		
		response.sendRedirect("MessageView.do?email="+receiveemail+"");
	}

}
