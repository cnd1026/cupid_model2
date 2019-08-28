package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import model.ChatBean;

public class ChatDAO {

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//	디비 접속
	public void getCon() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/cupid?serverTimezone=UTC";
			String user="root";
			String password="1111";
			
			conn = DriverManager.getConnection(url,user,password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//채팅리스트
	public Vector<ChatBean> getAllMember(String nowserver, int startRow, int endRow){
		getCon();
		
		Vector<ChatBean> v = new Vector<>();
		
		try {
			String sql = "select chat.server,chat.email,member.name,chat.comment,chat.date,member.profilepicture from chat join member on server=? where member.email = chat.email order by chat.date desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nowserver);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			int len_num = 0;
			String comment = "";
			
			while(rs.next()) {
				ChatBean bean = new ChatBean();
				
				bean.setServer(rs.getString(1));
				bean.setEmail(rs.getString(2));
				bean.setName(rs.getString(3));
				//제목 길때 ... 처리
				comment = rs.getString(4);
				len_num = comment.length();
				if(len_num > 150){
					comment = comment.substring(0, 150) + "...";
				}
				bean.setComment(comment);
				bean.setDate(rs.getString(5));
				bean.setProfilepicture(rs.getString(6));
				
				//백터 빈 클랙스 저장
				v.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public void insertChat (String nowserver,String email, String comment, String date) {
		getCon();
		
		
		try {
			String sql = "insert into chat (server,email,comment,date) values (?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,nowserver);
			pstmt.setString(2,email);
			pstmt.setString(3,comment);
			pstmt.setString(4,date);
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 총 게시물 수
	
		public int getAllcount(String nowserver) {
			getCon();
			
			int count = 0;
			
			try {
				String sql = "select count(*) from chat where server=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nowserver);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					count = rs.getInt(1);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		}
}
