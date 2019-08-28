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

@WebServlet("/Hogu2.do")
public class Hogu2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Hogu2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHogu2(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHogu2(request, response);
	}
	
	protected void doHogu2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String hogulevel = request.getParameter("hogulevel");
		String gaewol = request.getParameter("gaewol");
		
		String getMoney = "";
		
		if (hogulevel.equals("platinum")) {
			if (gaewol.equals("gmonth1")) {
				getMoney = "140,000";
			} else if (gaewol.equals("gmonth2")) {
				getMoney = "70,000";
			} else {
				getMoney = "35,000";
			}
		} else {
			if (gaewol.equals("gmonth1")) {
				getMoney = "120,000";
			} else if (gaewol.equals("gmonth2")) {
				getMoney = "60,000";
			} else {
				getMoney = "30,000";
			}
		}
		
		String gyuljae = request.getParameter("gyuljae");
		
		// 카드결제
		if (gyuljae.equals("way1")) {
			String cardKinds = request.getParameter("cardKinds");
			String halbu = request.getParameter("halbu");
			
			String mycard = "";
			if (cardKinds.equals("01")) {
				mycard = "BC카드";
			} else if (cardKinds.equals("02")) {
				mycard = "신한카드";
			} else if (cardKinds.equals("03")) {
				mycard = "KB국민카드";
			} else if (cardKinds.equals("04")) {
				mycard = "삼성카드";
			} else if (cardKinds.equals("05")) {
				mycard = "현대카드";
			} else if (cardKinds.equals("06")) {
				mycard = "롯데카드";
			} else if (cardKinds.equals("07")) {
				mycard = "하나카드";
			} else if (cardKinds.equals("08")) {
				mycard = "NH농협카드";
			} else if (cardKinds.equals("09")) {
				mycard = "씨티카드";
			} else if (cardKinds.equals("10")) {
				mycard = "우리카드";
			} else if (cardKinds.equals("11")) {
				mycard = "카카오뱅크카드";
			} else if (cardKinds.equals("12")) {
				mycard = "케이뱅크카드";
			} else if (cardKinds.equals("13")) {
				mycard = "전북은행카드";
			} else if (cardKinds.equals("14")) {
				mycard = "새마을금고카드";
			} else if (cardKinds.equals("15")) {
				mycard = "기타(은행/증권)카드";
			}
			
			if (halbu.equals("01")) {
				halbu = "일 시 불";
			} else if (halbu.equals("02")) {
				halbu = "3 개월";
			} else if (halbu.equals("03")) {
				halbu = "6 개월";
			} else {
				halbu = "12 개월";
			}
			
			
			request.setAttribute("nowserver", nowserver);
			request.setAttribute("mycard", mycard);
			request.setAttribute("halbu", halbu);
			request.setAttribute("hogulevel", hogulevel);
			request.setAttribute("getMoney", getMoney);
			request.setAttribute("gaewol", gaewol);
			RequestDispatcher dis = request.getRequestDispatcher("/member/hogu2_card.jsp?nowserver="+nowserver);
			dis.forward(request, response);
			
		// 무통장입금	
		} else if (gyuljae.equals("way2")) {
			String bankKinds = request.getParameter("bankKinds");
			String bank = "";
			if (bankKinds.equals("01")) {
				bank = "농협은행";
			} else if (bankKinds.equals("02")) {
				bank = "국민은행";
			} else if (bankKinds.equals("03")) {
				bank = "신한은행";
			} else if (bankKinds.equals("04")) {
				bank = "우리은행";
			} else if (bankKinds.equals("05")) {
				bank = "KEB한화은행";
			} else if (bankKinds.equals("06")) {
				bank = "기업은행";
			} else if (bankKinds.equals("07")) {
				bank = "대구은행";
			} else if (bankKinds.equals("08")) {
				bank = "부산은행";
			} else if (bankKinds.equals("09")) {
				bank = "우체국";
			} else if (bankKinds.equals("10")) {
				bank = "경남은행";
			} else if (bankKinds.equals("11")) {
				bank = "광주은행";
			} else if (bankKinds.equals("12")) {
				bank = "SC제일은행";
			} else if (bankKinds.equals("13")) {
				bank = "수협은행";
			} else if (bankKinds.equals("14")) {
				bank = "씨티은행";
			}
			
			Date today = new Date();
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
			Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.DATE, +7);
			String ipgeumnalza = sdformat.format(cal.getTime());
			
			request.setAttribute("nowserver", nowserver);
			request.setAttribute("bank", bank);
			request.setAttribute("hogulevel", hogulevel);
			request.setAttribute("getMoney", getMoney);
			request.setAttribute("ipgeumnalza", ipgeumnalza);
			request.setAttribute("gaewol", gaewol);
			RequestDispatcher dis = request.getRequestDispatcher("/member/hogu2_ipgeum.jsp?nowserver="+nowserver);
			dis.forward(request, response);
			
		// 휴대폰결제	
		} else {
			String phoneKinds = request.getParameter("phoneKinds");
			String phone = "";
			if (phoneKinds.equals("01")) {
				phone = "SKT";
			} else if (phoneKinds.equals("02")) {
				phone = "KT";
			} else if (phoneKinds.equals("03")) {
				phone = "헬로모바일";
			} else {
				phone = "KCT";
			}
			
			request.setAttribute("nowserver", nowserver);
			request.setAttribute("phone", phone);
			request.setAttribute("hogulevel", hogulevel);
			request.setAttribute("getMoney", getMoney);
			request.setAttribute("gaewol", gaewol);
			RequestDispatcher dis = request.getRequestDispatcher("/member/hogu2_phone.jsp?nowserver="+nowserver);
			dis.forward(request, response);
		}
	}

}
