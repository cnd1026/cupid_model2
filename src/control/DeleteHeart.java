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

import dao.HeartDAO;
import dao.MemberDAO;
import model.HeartBean;

@WebServlet("/DeleteHeart.do")
public class DeleteHeart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteHeart() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDeleteHeart(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDeleteHeart(request, response);
	}
	
	protected void doDeleteHeart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				
		HeartBean bean = new HeartBean();
		HeartDAO dao = new HeartDAO();
		String thatemail = request.getParameter("that");
		String myemail = request.getParameter("my");
		String email = thatemail;
		
		request.setAttribute("nowserver", nowserver);
		request.setAttribute("email", email);
		bean.setEmail(myemail);
		bean.setHeartemail(thatemail);
			
		dao.deleteHeart(bean);	
			
			
		response.sendRedirect("Profile.do?nowserver="+nowserver+"&&email="+email);
	}


}

