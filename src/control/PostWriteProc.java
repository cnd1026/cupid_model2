package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.MemberDAO;
import dao.PostDAO;
import model.MemberBean;

@WebServlet("/PostWriteProc.do")
@MultipartConfig(
		fileSizeThreshold=0,
		location="C:\\jsp\\jspwork\\cupid\\WebContent\\upload"
)
public class PostWriteProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PostWriteProc() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostWriteProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPostWriteProc(request, response);
	}
	
	protected void doPostWriteProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		MemberBean bean = new MemberBean();
		MemberDAO dao = new MemberDAO();
		PostDAO dpo = new PostDAO();
		
		String nowserver = request.getParameter("nowserver");
		
		// 세션 가져오기
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		bean = dao.viewMember(email);
		
		// 오늘 날짜 구하기
		
		Date today = new Date();
		SimpleDateFormat cal = new SimpleDateFormat("yyyyMMddHHmmss");
		String signdate = cal.format(today);
				
		// 파일 가져오기 =====================================================
		
		Part part = request.getPart("file1");
		String file1 = "";
		String uploadFileName = "";
		
		if (part.getName().equals("file1") && part.getSize()>0) {
			String contentDisposition = part.getHeader("content-disposition");
			file1 = getUploadFileName(contentDisposition);
			if(file1 != null) {
				uploadFileName = email+"_"+signdate+"_"+file1;
			}
			
			part.write(uploadFileName);
		}
		// ==============================================================
		
		String post = request.getParameter("post");
		
		dpo.postWrite(email, nowserver, post, signdate, file1, uploadFileName);
		
		response.sendRedirect("Profile.do?nowserver="+nowserver+"&email="+email);
	}
	
	//크롬일 경우
	private String getUploadFileName(String contentDisposition) {
		String uploadFileName = null;
		String[] contentSplitStr = contentDisposition.split(";");			
		int firstQutosIndex = contentSplitStr[2].indexOf("\"");
		int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
		
		uploadFileName = contentSplitStr[2].substring(firstQutosIndex + 1,lastQutosIndex);
		return uploadFileName;
	}

}
