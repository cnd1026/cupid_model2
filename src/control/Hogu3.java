package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/Hogu3.do")
public class Hogu3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Hogu3() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHogu3(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHogu3(request, response);
	}
	
	protected void doHogu3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String hogus = request.getParameter("hogulevel");
		String gaewol = request.getParameter("gaewol");
		String getMoney = request.getParameter("getMoney");
		String gyuljae = request.getParameter("gyuljae");
		String halbu = "일 시 불";
		
		HttpSession session = request .getSession();
		String name = (String)session.getAttribute("name");
		
		if (gaewol.equals("gmonth1")) {
			gaewol = "12";
		} else if (gaewol.equals("gmonth2")) {
			gaewol = "3";
		} else {
			gaewol = "1";
		}
		
		String hogulevel = "";
		int getlevel = 0;
		if (hogus.equals("platinum")) {
			hogulevel = "플레티넘";
			getlevel = 3;
		} else {
			hogulevel = "골 드";
			getlevel = 2;
		}
		
		MemberDAO dao = new MemberDAO();
		String email = (String)session.getAttribute("email");
		
		dao.upgradeLevel(email, getlevel);
		
		session.setAttribute("level", getlevel);
		// 신용카드
		if (gyuljae.equals("way1")) {
			halbu = request.getParameter("halbu");
			String mycard = request.getParameter("mycard");
			String ways = "신 용 카 드 ( " + mycard + " )";
			
			request.setAttribute("nowserver", nowserver);
			request.setAttribute("ways", ways);
			request.setAttribute("getMoney", getMoney);
			request.setAttribute("halbu", halbu);
			request.setAttribute("hogulevel", hogulevel);
			request.setAttribute("gaewol", gaewol);
			request.setAttribute("name", name);
			RequestDispatcher dis = request.getRequestDispatcher("/member/hogu3.jsp?nowserver="+nowserver);
			dis.forward(request, response);
			
		// 무통장입금
		} else if (gyuljae.equals("way2")) {
			String bank = request.getParameter("bank");
			String ways = "무통장입금 ( " + bank + " )";
			
			request.setAttribute("nowserver", nowserver);
			request.setAttribute("ways", ways);
			request.setAttribute("getMoney", getMoney);
			request.setAttribute("halbu", halbu);
			request.setAttribute("hogulevel", hogulevel);
			request.setAttribute("gaewol", gaewol);
			request.setAttribute("name", name);
			RequestDispatcher dis = request.getRequestDispatcher("/member/hogu3.jsp?nowserver="+nowserver);
			dis.forward(request, response);
			
		// 휴대폰결제
		} else {
			String phone = request.getParameter("phone");
			String ways = "휴 대 폰 ( " + phone + " )";
			name = request.getParameter("name");
			
			request.setAttribute("nowserver", nowserver);
			request.setAttribute("ways", ways);
			request.setAttribute("getMoney", getMoney);
			request.setAttribute("halbu", halbu);
			request.setAttribute("hogulevel", hogulevel);
			request.setAttribute("gaewol", gaewol);
			request.setAttribute("name", name);
			RequestDispatcher dis = request.getRequestDispatcher("/member/hogu3.jsp?nowserver="+nowserver);
			dis.forward(request, response);
		}
		
	}

}
