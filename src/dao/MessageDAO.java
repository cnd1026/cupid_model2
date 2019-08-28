package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import model.ChatBean;
import model.MemberBean;
import model.MessageBean;

public class MessageDAO {
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
	//메세지내용
		public Vector<MessageBean> getAllMessage(String sendemail,String receiveemail){
			getCon();
			
			Vector<MessageBean> v = new Vector<>();
			
			try {
				String sql = "select * from message where sendemail=? and receiveemail=? or sendemail=? and receiveemail=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sendemail);
				pstmt.setString(2, receiveemail);
				pstmt.setString(3, receiveemail);
				pstmt.setString(4, sendemail);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MessageBean bean = new MessageBean();
					
					bean.setUid(rs.getInt(1));
					bean.setSendemail(rs.getString(2));
					bean.setReceiveemail(rs.getString(3));
					bean.setComment(rs.getString(4));
					bean.setDate(rs.getString(5));
					
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
		//받은메세지리스트
	public Vector<MessageBean> MessageList(String email, String nowyear,int startRow,int endRow){
		getCon();
		
		Vector<MessageBean> m = new Vector<>();
		
		try {
			String sql = "select m.uid, m.sendemail, m.receiveemail, m.comment, m.date,mem.profilepicture, mem.name, mem.age, mem.gender, mem.addr,mem.level from message m join member mem on m.sendemail = mem.email where uid in((select max(uid) from message where receiveemail = ? group by sendemail))order by date desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			String ageyear = "";
			
			while(rs.next()) {
				MessageBean bean = new MessageBean();
				
				bean.setUid(rs.getInt(1));
				bean.setSendemail(rs.getString(2));
				bean.setReceiveemail(rs.getString(3));
				bean.setComment(rs.getString(4));
				bean.setDate(rs.getString(5));
				bean.setProfilepicture(rs.getString(6));
				bean.setName(rs.getString(7));
				
				ageyear = (rs.getString(8)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setLevel(rs.getInt(11));
				
				//백터 빈 클랙스 저장
				m.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	//보낸메세지리스트
	public Vector<MessageBean> sendMessageList(String email, String nowyear,int startRow,int endRow){
		getCon();
		
		Vector<MessageBean> m = new Vector<>();
		
		try {
			String sql = "select m.uid, m.sendemail, m.receiveemail, m.comment, m.date,mem.profilepicture, mem.name, mem.age, mem.gender, mem.addr,mem.level from message m join member mem on m.receiveemail = mem.email where uid in((select max(uid) from message where sendemail = ? group by receiveemail))order by date desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			String ageyear = "";
			
			while(rs.next()) {
				MessageBean bean = new MessageBean();
				
				bean.setUid(rs.getInt(1));
				bean.setSendemail(rs.getString(2));
				bean.setReceiveemail(rs.getString(3));
				bean.setComment(rs.getString(4));
				bean.setDate(rs.getString(5));
				bean.setProfilepicture(rs.getString(6));
				bean.setName(rs.getString(7));
				
				ageyear = (rs.getString(8)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setLevel(rs.getInt(11));
				
				//백터 빈 클랙스 저장
				m.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	//메세지보내기
	public void sendMessage (String sendemail,String receiveemail, String comment, String date) {
		getCon();
		
		try {
			
			String sql = "insert into message (sendemail,receiveemail,comment,date) values (?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,sendemail);
			pstmt.setString(2,receiveemail);
			pstmt.setString(3,comment);
			pstmt.setString(4,date);
			
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 받은 메세지 수
	
	public int Messagecount(String email) {
		getCon();
		
		int count = 0;
		
		try {
			String sql = "";
				sql = "select count(distinct sendemail) from message where receiveemail like ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
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
	// 보낸 메세지 수
	
		public int sendMessagecount(String email) {
			getCon();
			
			int count = 0;
			
			try {
				String sql = "";
					sql = "select count(distinct receiveemail) from message where sendemail like ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
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
	//메세지삭제
	public void deleteMessage(String sendemail, String receiveemail) {
		getCon();
		
		try {
			
			String sql = "delete from message where sendemail=? and receiveemail=? ";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,sendemail);
			pstmt.setString(2,receiveemail);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}		
}

