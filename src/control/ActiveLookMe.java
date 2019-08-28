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
import dao.LookmeDAO;
import dao.MemberDAO;
import model.ActivememBean;
import model.LookmeBean;

@WebServlet("/ActiveLookMe.do")
public class ActiveLookMe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ActiveLookMe() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLookMe(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doLookMe(request, response);
	}
	
	protected void doLookMe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		//페이징 처리
		int count = 0;
		
		int pageSize = 12;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		int number = 0;		
	
		LookmeBean lbean = new LookmeBean();
		LookmeDAO dao = new LookmeDAO();
		LookmeDAO ldao = new LookmeDAO();
		LookmeDAO dpo = new LookmeDAO();
		
		HttpSession session = request.getSession();
		
		String lookemail = (String)session.getAttribute("email");
		String email = request.getParameter("thatemail");
		
		count = dao.getcount(lookemail);
		
		int startRow = ( currentPage - 1) * pageSize;
		int endRow = pageSize;
		/*
		 * System.out.println(startRow); System.out.println(endRow);
		 */
		number = count - (currentPage - 1) * pageSize;
		/* System.out.println(number); */
		
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
		
		Vector<LookmeBean> lv = dao.lookscount(lookemail, startRow, endRow);
		
		
		// Heartme 인식시키기
		String itis = "way1";
		
		request.setAttribute("itis", itis);
		request.setAttribute("lv", lv);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		Vector<ActivememBean> lmv = dpo.getWho(nowyear, startRow, endRow, lookemail);
		String lmvcount = Integer.toString(lmv.size());
		request.setAttribute("lmv", lmv);
		request.setAttribute("lmvcount", lmvcount);
		
		Vector<LookmeBean> v = dao.lookCheck(email, lookemail);
		
		request.setAttribute("v", v);
		request.setAttribute("lookemail", lookemail);
		
			
		
		RequestDispatcher dis = request.getRequestDispatcher("/active/hitlist.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}

}
