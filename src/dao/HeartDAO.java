package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import model.ActivememBean;
import model.HeartBean;
import model.MemberBean;
import model.PostBean;

public class HeartDAO {

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	private Vector<HeartBean> v;
	
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
	
	// 하트 생성
	
	public void makeHeart (HeartBean bean)	{
		getCon();
		
		try {
			String sql = "insert into heart (email,heartemail) values (?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getHeartemail());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteHeart (HeartBean bean)	{
		getCon();
		
		try {
			String sql = "delete from heart where email = ? && heartemail = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getHeartemail());
			
			pstmt.executeUpdate();
			//System.out.println(pstmt);
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 하트 이력 검사
	public HeartBean heartedCheck (String email, String heartemail) {
		getCon();
		HeartBean hbean = new HeartBean();
		
		try {
			String sql = "select * from heart where email=? && heartemail=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, heartemail);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				hbean.setEmail(rs.getString(1));
				hbean.setHeartemail(rs.getString(2));
			}
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hbean;
	}
	
	
	
	//받은 총 하트 수
	public int getReceivecount(String myemail) {
		getCon();
		/* System.out.println(myemail); */
		int count = 0;
		
		try {
			String sql = "select count(distinct email) from heart where heartemail = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myemail);
			rs = pstmt.executeQuery();
			//System.out.println(pstmt);
			if(rs.next()) {
				count = rs.getInt(1);
				//System.out.println(count); 
			}
			rs.close();
			pstmt.close();
			conn.close();
			//System.out.println(count);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}	
	
	//받은 이력 확인
	public Vector<HeartBean> receiveheartedCheck (String heartemail, String email) {
		getCon();
		Vector<HeartBean> v = new Vector<>();
		
		try {
			String sql = "select distinct * from heart where heartemail like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, heartemail);
			rs = pstmt.executeQuery();
		
		 //System.out.println(heartemail); System.out.println(sql);		
			
			while (rs.next()) {
				HeartBean hbean = new HeartBean();
				
				hbean.setEmail(rs.getString(1));
				hbean.setHeartemail(rs.getString(2));
				
				v.add(hbean);
			}
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	
	//보낸 하트 확인
	public Vector<HeartBean> sendheartCheck(String email, String heartemail){
		getCon();
		Vector<HeartBean> v = new Vector<>();
		
		try {
			String sql = "select distinct * from heart where email like ?";
			
		//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			//System.out.println(pstmt);
			while(rs.next()) {
				HeartBean hhbean = new HeartBean();
				
				hhbean.setEmail(rs.getString(1));
				hhbean.setHeartemail(rs.getString(2));
							
			 //System.out.println(heartemail); System.out.println(email);			
				v.add(hhbean);
			}
			
			pstmt.close();
			conn.close();
							
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
				
		
	}
	
	//페이징처리 
	public Vector<HeartBean> getcount(String myemail, int startRow, int endRow) {
		getCon();
		Vector<HeartBean> cv = new Vector<>();
		
		try {
			
			String sql = "select distinct * from heart where heartemail like ? limit ?,?";
			
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, myemail);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			//System.out.println(pstmt);
									
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HeartBean bean = new HeartBean();
				
				bean.setEmail(rs.getString(1));
				bean.setHeartemail(rs.getString(2));
				
				// 벡터 빈 클래스 저장
				cv.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cv;
	}	
	//페이징처리 2번용도 
		public Vector<HeartBean> getcount1(String heartemail, int startRow, int endRow) {
			getCon();
			Vector<HeartBean> cv = new Vector<>();
			
			try {
				
				String sql = "select distinct * from heart where email like ? limit ?,?";
				
				pstmt = conn.prepareStatement(sql);	
				pstmt.setString(1, heartemail);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				//System.out.println(pstmt);
				//System.out.println(startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					HeartBean bean = new HeartBean();
					
					bean.setEmail(rs.getString(1));
					bean.setHeartemail(rs.getString(2));
					
					// 벡터 빈 클래스 저장
					cv.add(bean);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cv;
		}
		//내가 받은 하트 확인
		public Vector<ActivememBean> getWho(String nowyear, int startRow, int endRow, String heartemail ) {
			getCon();
			Vector<ActivememBean> mv = new Vector<>();
			
			try {
				
				String sql = "select distinct mb.email, mb.name, mb.age, mb.gender, mb.addr, mb.profilepicture, mb.whoami from member AS mb LEFT JOIN heart AS h ON h.email = mb.email where h.heartemail=? limit ?,?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, heartemail);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				//System.out.println(pstmt);
				String ageyear = "";
				
				while(rs.next()) {
					ActivememBean bean = new ActivememBean();
					
					bean.setEmail(rs.getString(1));
					bean.setName(rs.getString(2));
					ageyear = (rs.getString(3)).substring(0, 4);
					int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
					bean.setAge(Integer.toString(realage));
					bean.setGender(rs.getString(4));					
					bean.setAddr(rs.getString(5));	
					bean.setProfilepicture(rs.getString(6));
					bean.setWhoami(rs.getString(7));
					
					// 벡터 빈 클래스 저장
					mv.add(bean);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
		//내가 준 하트들
		public Vector<ActivememBean> getWho1(String nowyear, int startRow, int endRow, String email ) {
			getCon();
			Vector<ActivememBean> mv = new Vector<>();
			
			try {
				
				String sql = "select distinct mb.email, mb.name, mb.age, mb.gender, mb.addr, mb.profilepicture, mb.whoami from member AS mb LEFT JOIN heart AS h ON h.heartemail = mb.email where h.email=? limit ?,?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				//System.out.println(pstmt);
				String ageyear = "";
				
				while(rs.next()) {
					ActivememBean bean = new ActivememBean();
					
					bean.setEmail(rs.getString(1));
					bean.setName(rs.getString(2));
					ageyear = (rs.getString(3)).substring(0, 4);
					int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
					bean.setAge(Integer.toString(realage));
					bean.setGender(rs.getString(4));					
					bean.setAddr(rs.getString(5));	
					bean.setProfilepicture(rs.getString(6));
					bean.setWhoami(rs.getString(7));
					
					// 벡터 빈 클래스 저장
					mv.add(bean);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mv;
		}
	
}
