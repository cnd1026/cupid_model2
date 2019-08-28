package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import java.util.HashSet;

import model.ActivememBean;
import model.LookmeBean;

public class LookmeDAO {

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
	
	// 본 사람 이력 검사
	public LookmeBean lookedCheck (String email, String lookemail) {
		getCon();
		LookmeBean lbean = new LookmeBean();
		
		try {
			String sql = "select * from lookme where email=? && lookemail=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, lookemail);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				lbean.setEmail(rs.getString(1));
				lbean.setLookemail(rs.getString(2));
			}
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lbean;
	}
	// 본사람 추가
	public void insertLookme (String email, String lookemail) {
		getCon();
		
		try {
			String sql = "insert into lookme (email,lookemail) values (?,?)";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,email);
			pstmt.setString(2,lookemail);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 본 사람 확인했으면 출력
	public Vector<LookmeBean> lookCheck (String email, String lookemail) {
		getCon();
		Vector<LookmeBean> v = new Vector<>();
		
		try {
			String sql = "select distinct * from lookme where lookemail like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lookemail);
			rs = pstmt.executeQuery();
			//System.out.println(pstmt);
			while (rs.next()) {
				LookmeBean lbean = new LookmeBean();
				
				lbean.setEmail(rs.getString(1));
				lbean.setLookemail(rs.getString(2));
				
				v.add(lbean);
			}
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
		// 내가 본사람
		public Vector<LookmeBean> looksCheck (String email, String lookemail) {
			getCon();
			Vector<LookmeBean> v = new Vector<>();
			
			try {
				String sql = "select distinct * from lookme where email like ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
			//System.out.println(pstmt);
				while (rs.next()) {
					LookmeBean lbean = new LookmeBean();
					
					lbean.setEmail(rs.getString(1));
					lbean.setLookemail(rs.getString(2));
					
					v.add(lbean);
					
					
				}
				
				pstmt.close();
				conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		// 카운트
		public Vector<LookmeBean> lookscount (String email, int startRow, int endRow) {
			getCon();
			Vector<LookmeBean> lv = new Vector<>();
			
			try {
				String sql = "select distinct * from lookme where lookemail like ? limit ?,?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs = pstmt.executeQuery();
				//System.out.println(startRow); System.out.println(endRow);
			 	//System.out.println(pstmt); 
			 
				while (rs.next()) {
					LookmeBean lbean = new LookmeBean();
					
					lbean.setEmail(rs.getString(1));
					lbean.setLookemail(rs.getString(2));
					
					lv.add(lbean);
					
					
				}
				
				pstmt.close();
				conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return lv;
		}
		// 카운트 2번용도
		public Vector<LookmeBean> lookscount1 (String email, int startRow, int endRow) {
			getCon();
			Vector<LookmeBean> lv = new Vector<>();
			
			try {
				String sql = "select distinct * from lookme where email like ? limit ?,?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				// System.out.println(pstmt);
				rs = pstmt.executeQuery();						
				// System.out.println(startRow); System.out.println(endRow);
	 
			
				while (rs.next()) {
					LookmeBean lbean = new LookmeBean();
					
					lbean.setEmail(rs.getString(1));
					lbean.setLookemail(rs.getString(2));
					
					lv.add(lbean);
					
					
				}
				
				pstmt.close();
				conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return lv;
		}
		//페이징용 카운팅
		public int getcount(String lookemail) {
			getCon();
			
			int count = 0;
			
			try {
				String sql = "select count(distinct email) from lookme where lookemail like ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, lookemail);
				rs = pstmt.executeQuery();
			/* System.out.println(pstmt); */
				if(rs.next()) {
					count = rs.getInt(1);
					/* System.out.println(count); */
				}
				rs.close();
				pstmt.close();
				conn.close();
				/* System.out.println(count); */
			}catch(Exception e) {
				e.printStackTrace();
			}
			return count;
		}
		//나를 본 사람들
		public Vector<ActivememBean> getWho(String nowyear, int startRow, int endRow, String lookemail ) {
			getCon();
			Vector<ActivememBean> lmv = new Vector<>();
			
			try {
				
				String sql = "select distinct mb.email, mb.name, mb.age, mb.gender, mb.addr, mb.profilepicture, mb.whoami from member AS mb LEFT JOIN lookme AS lm ON lm.email = mb.email where lm.lookemail=? limit ?,?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, lookemail);
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
					lmv.add(bean);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return lmv;
		}
		//내가 본 사람들
		public Vector<ActivememBean> getWho1(String nowyear, int startRow, int endRow, String email ) {
			getCon();
			Vector<ActivememBean> lmv = new Vector<>();
			
			try {
				
				String sql = "select distinct mb.email, mb.name, mb.age, mb.gender, mb.addr, mb.profilepicture, mb.whoami from member AS mb LEFT JOIN lookme AS lm ON lm.lookemail = mb.email where lm.email=? limit ?,?";
				
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
					lmv.add(bean);
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return lmv;
		}
}
