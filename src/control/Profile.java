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
import dao.PostDAO;
import model.HeartBean;
import model.LookmeBean;
import model.MemberBean;
import model.PostBean;

@WebServlet("/Profile.do")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Profile() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProfile(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProfile(request, response);
	}
	
	protected void doProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		// 세션이메일 불러오기
		
		HttpSession session = request .getSession();
		String myemail = (String)session.getAttribute("email");
		
		// 프로필 정보 갖고오기
		
		String email = request.getParameter("email");
		bean = dao.viewMember(email);
		request.setAttribute("profile", bean);
		
		// age 나이로 고치기
		
		Date today = new Date();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
		String nowyear = dayTime.format(today);
		String ageyear = (bean.getAge()).substring(0, 4);
		int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
		
		// 본인인지 확인
		
		String heart = "X";
		
		if (!myemail.equals(bean.getEmail())) {
			
			// 하트를 보낸 상대인지 확인
			
			HeartDAO dho = new HeartDAO();
			HeartBean hbean = new HeartBean();
			
			hbean = dho.heartedCheck(myemail, email);
			
			if ((hbean.getEmail())!=null) {
				heart = "O";
			} else {
				heart = "X";
			}
			
			// 내가 본 사람 등록
			
			LookmeDAO dlo = new LookmeDAO();
			LookmeDAO dbo = new LookmeDAO();
			LookmeBean lbean = new LookmeBean();
			
			lbean = dlo.lookedCheck(myemail, email);
			
			if ((lbean.getEmail())==null) {
				dbo.insertLookme(myemail, email);
			}
			
		}
		
		// post 불러오기
		
		PostDAO dpo = new PostDAO();
		PostDAO dgo = new PostDAO();
		
		// 전체 게시물 수
		int count = 0;
		// 한 페이지에 보여질 글의 갯수
		int pageSize = 5;
		// 페이지 넘버 값
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 넘버값 정수처리
		int currentPage = Integer.parseInt(pageNum);
		// 현재 페이지 보여질 넘버링 숫자 초기화
		int number = 0;
		
		// 총 게시물 수
		count = dgo.getAllcount(email);
		
		// 현재 보여질 페이지 limit 설정
		int startRow = (currentPage - 1) * pageSize;
		int endRow = pageSize;
		
		// 페이지 넘버링 처리
		number = count - (currentPage - 1) * pageSize;
		
		Vector<PostBean> v = dpo.getPost(email, startRow, endRow);
		
		//request 객체에 담아서 전달
		request.setAttribute("v", v);
		request.setAttribute("nowserver", nowserver);
		request.setAttribute("heart", heart);
		request.setAttribute("realage", realage);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("email", email);
		
		RequestDispatcher dis = request.getRequestDispatcher("/member/profile.jsp?nowserver="+nowserver+"&email="+email);
		dis.forward(request, response);
	}

}
