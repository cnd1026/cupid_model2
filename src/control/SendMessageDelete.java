package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MessageDAO;

@WebServlet("/SendMessageDelete.do")
public class SendMessageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendMessageDelete() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDel(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDel(request, response);
	}
	protected void doDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sendemail = request.getParameter("sendemail");
		String receiveemail = request.getParameter("receiveemail");
		
		MessageDAO dao = new MessageDAO();
		
		dao.deleteMessage(sendemail,receiveemail);
		
		RequestDispatcher dis = request.getRequestDispatcher("MessageSendView.do");
		dis.forward(request, response);
	}
}
