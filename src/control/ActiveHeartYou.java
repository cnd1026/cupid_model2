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

import dao.HeartDAO;
import dao.MemberDAO;
import model.ActivememBean;
import model.HeartBean;

@WebServlet("/ActiveHeartYou.do")
public class ActiveHeartYou extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ActiveHeartYou() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHeartYou(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHeartYou(request, response);
	}
	
	protected void doHeartYou(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		int count = 0;
		
		int pageSize = 12;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int number = 0;
		
		HeartBean hhbean = new HeartBean();
		HeartDAO dao = new HeartDAO();
		HeartDAO dpo = new HeartDAO();
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String heartemail = null;
		
		count = dao.getReceivecount(email);
		
		int startRow = ( currentPage - 1) * pageSize;
		int endRow = pageSize;
		
		number = count - (currentPage - 1) * pageSize;
		
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
		
		String itis = "way2";
		request.setAttribute("itis", itis);
		
		Vector<HeartBean> cv = dao.getcount1(email, startRow, endRow);
		
		request.setAttribute("cv", cv);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		/* System.out.println(email); */
		Vector<ActivememBean> mv = dpo.getWho1(nowyear, startRow, endRow, email);
		String mvcount = Integer.toString(mv.size());
		request.setAttribute("mv", mv);
		request.setAttribute("mvcount", mvcount);
		
		Vector<HeartBean> v = dao.sendheartCheck(email, heartemail);
		
		request.setAttribute("v", v);
		request.setAttribute("email", email);
		
		RequestDispatcher dis = request.getRequestDispatcher("/active/myList.jsp?nowserver"+nowserver);
		dis.forward(request, response);
	}

}
