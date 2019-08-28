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
import model.MemberBean;

@WebServlet("/ActiveHeartMe.do")
public class ActiveHeartMe extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ActiveHeartMe() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHeartMe(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHeartMe(request, response);
	}
	
	protected void doHeartMe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		HeartBean hbean = new HeartBean();
		HeartDAO dao = new HeartDAO();
		HeartDAO hdao = new HeartDAO();
		HeartDAO dpo = new HeartDAO();
		
		HttpSession session = request .getSession();
		
		String myemail = (String)session.getAttribute("email");
		
		count = dao.getReceivecount(myemail);
		
		int startRow = ( currentPage - 1) * pageSize;
		int endRow = pageSize;
		
		number = count - (currentPage - 1) * pageSize;
		
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
		
		
		/* System.out.println(myemail); */
		
		String heartemail = (String)session.getAttribute("email");
		String email = request.getParameter("email");
		
		MemberBean bean = new MemberBean();
		MemberDAO wdao = new MemberDAO();
		
		bean = wdao.viewMember(email);
		
		String heart = "X";
		
			
			// 하트를 보낸 상대인지 확인
			
			HeartDAO dho = new HeartDAO();
			HeartBean hobean = new HeartBean();
			
			hbean = dho.heartedCheck(email, heartemail);
			
			if ((bean.getEmail())!=null) {
				heart = "O";
			} else {
				heart = "X";
			}
		
		String itis = "way2";
		request.setAttribute("itis", itis);
		
		Vector<HeartBean> cv = hdao.getcount(myemail, startRow, endRow);
		
		request.setAttribute("cv", cv);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		
		Vector<ActivememBean> mv = dpo.getWho(nowyear, startRow, endRow, heartemail);
		String mvcount = Integer.toString(mv.size());
		
		request.setAttribute("mv", mv);
		request.setAttribute("mvcount", mvcount);
		
		Vector<HeartBean> v = dao.receiveheartedCheck(heartemail, email);
		
		request.setAttribute("v", v);
		request.setAttribute("heartemail", heartemail);
		
		RequestDispatcher dis = request.getRequestDispatcher("/active/hitlist.jsp?nowserver="+nowserver);
		dis.forward(request, response);
	}

}
