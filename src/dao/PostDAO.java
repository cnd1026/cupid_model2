package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import model.MemberBean;
import model.PostBean;

public class PostDAO {

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
	
	// 상대 post 불러오기
	
	public Vector<PostBean> getPost(String email, int startRow, int endRow) {
		getCon();
		Vector<PostBean> v = new Vector<>();
		
		try {
			
			String sql = "select * from post where email=? order by uid desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostBean bean = new PostBean();
				
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
				bean.setPost(rs.getString(4));
				bean.setDate(rs.getString(5));
				bean.setFile(rs.getString(6));
				bean.setFile_rename(rs.getString(7));
				
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
	
	// 총 게시물 수
	
	public int getAllcount(String email) {
		getCon();
		
		int count = 0;
		
		try {
			String sql = "select count(*) from post where email=?";
			
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
	
	// 서버 총 게시물 수
	
		public int getServerAllcount(String server) {
			getCon();
			
			int count = 0;
			
			try {
				String sql = "";
				if (server.equals("100")) {
					sql = "select count(*) from post";
				} else {
					sql = "select count(*) from post where server=?";
				}
				
				pstmt = conn.prepareStatement(sql);
				if (!server.equals("100")) {
					pstmt.setString(1, server);
				}
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
		
		// 내 사진 불러오기
		
		public Vector<PostBean> getPostMyPicture(String email) {
			getCon();
			Vector<PostBean> sv = new Vector<>();
			
			try {
				
				String sql = "select * from post where email=? order by uid desc";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					PostBean bean = new PostBean();
					
					bean.setUid(rs.getInt(1));
					bean.setEmail(rs.getString(2));
					bean.setServer(rs.getString(3));
					bean.setPost(rs.getString(4));
					bean.setDate(rs.getString(5));
					bean.setFile(rs.getString(6));
					bean.setFile_rename(rs.getString(7));
					
					// 파일이 있다면 벡터 빈 클래스 저장
					if ((rs.getString(7))!=null) {
						if (!(rs.getString(7)).equals("")) {
							sv.add(bean);
						}
					}
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return sv;
		}
	
	// Post 쓰기
		
	public void postWrite (String email, String nowserver, String post, String signdate, String file, String file_rename) {
		getCon();
		
		try {
			String sql = "insert into post (email,server,post,date,file,file_rename) values (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,email);
			pstmt.setString(2,nowserver);
			pstmt.setString(3,post);
			pstmt.setString(4,signdate);
			pstmt.setString(5,file);
			pstmt.setString(6,file_rename);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Post 불러오기
	
	public PostBean viewPost (int uid) {
		getCon();
		
		PostBean bean = new PostBean();
		try {
			
			String sql = "select * from post where uid=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bean.setUid(rs.getInt(1));
				bean.setEmail(rs.getString(2));
				bean.setServer(rs.getString(3));
				bean.setPost(rs.getString(4));
				bean.setDate(rs.getString(5));
				bean.setFile(rs.getString(6));
				bean.setFile_rename(rs.getString(7));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	// 게시글 파일까지 수정
	
	public void postModifyWithFile(int uid, String post, String file1, String file_rename) {
		getCon();
		
		try {
			String sql = "update post set post=?, file=?, file_rename=? where uid=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, post);
			pstmt.setString(2, file1);
			pstmt.setString(3, file_rename);
			pstmt.setInt(4, uid);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시글 수정
	
	public void postModify(int uid, String post) {
		getCon();
		
		try {
			String sql = "update post set post=? where uid=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, post);
			pstmt.setInt(2, uid);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// post 삭제
	public void postDelete (int uid) {
		getCon();
		
		try {
			String sql = "delete from post where uid=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,uid);
						
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
