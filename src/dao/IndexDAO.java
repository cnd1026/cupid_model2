package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import model.IndexBean;
import model.PostBean;

public class IndexDAO {

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
	
	// 서버 post 불러오기
	
	public Vector<IndexBean> getServerPost(String server, int startRow, int endRow) {
		getCon();
		Vector<IndexBean> v = new Vector<>();
		
		try {
			String sql = "";
			
			if (server.equals("100")) {
				sql = "select p.*, m.name, m.age, m.addr, m.level, m.favo, m.profilepicture FROM post AS p LEFT JOIN member AS m ON p.email = m.email order by p.uid desc limit ?,?";
			} else {
				sql = "select p.*, m.name, m.age, m.addr, m.level, m.favo, m.profilepicture FROM post AS p LEFT JOIN member AS m ON p.email = m.email where p.server=? order by p.uid desc limit ?,?";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			if (server.equals("100")) {
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				pstmt.setString(1, server);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs = pstmt.executeQuery();
			
			Date today = new Date();
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy");
			String nowyear = dayTime.format(today);
			String age = "";
			
			while(rs.next()) {
				IndexBean bean = new IndexBean();
				
				bean.setUid(rs.getInt(1));
				bean.setEmail(rs.getString(2));
				if ((rs.getString(3)).equals("1")) {
					bean.setServer("울산");
				} else if ((rs.getString(3)).equals("2")) {
					bean.setServer("부산");
				} else if ((rs.getString(3)).equals("3")) {
					bean.setServer("경상남도");
				} else if ((rs.getString(3)).equals("4")) {
					bean.setServer("경상북도");
				} else if ((rs.getString(3)).equals("5")) {
					bean.setServer("충청남도");
				} else if ((rs.getString(3)).equals("6")) {
					bean.setServer("충청북도");
				} else if ((rs.getString(3)).equals("7")) {
					bean.setServer("강원도");
				} else if ((rs.getString(3)).equals("8")) {
					bean.setServer("경기도");
				} else if ((rs.getString(3)).equals("9")) {
					bean.setServer("대구");
				} else if ((rs.getString(3)).equals("10")) {
					bean.setServer("인천");
				} else if ((rs.getString(3)).equals("11")) {
					bean.setServer("광주");
				} else if ((rs.getString(3)).equals("12")) {
					bean.setServer("대전");
				} else if ((rs.getString(3)).equals("13")) {
					bean.setServer("제주도");
				} else {
					bean.setServer("전체");
				}
				bean.setWrite(rs.getString(4));
				bean.setDate(rs.getString(5));
				bean.setFile(rs.getString(6));
				bean.setFile_rename(rs.getString(7));
				bean.setName(rs.getString(8));
				
				// 생년월일을 나이로
				age = rs.getString(9).substring(0, 4);
				bean.setAge(Integer.toString(Integer.parseInt(nowyear) - Integer.parseInt(age) + 1));
				
				bean.setAddr(rs.getString(10));
				bean.setLevel(rs.getInt(11));
				bean.setFavo(rs.getString(12));
				bean.setProfilepicture(rs.getString(13));
				
				// 벡터 빈 클래스 저장
				v.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
}
