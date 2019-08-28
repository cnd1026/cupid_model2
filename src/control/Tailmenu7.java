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

@WebServlet("/Tailmenu7.do")
public class Tailmenu7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Tailmenu7() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doTailMenu7(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doTailMenu7(request, response);
	}
	
	protected void doTailMenu7(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		request.setAttribute("nowserver", nowserver);
		
		RequestDispatcher dis = request.getRequestDispatcher("/tailmenu/tailmenu7.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}
	
}
