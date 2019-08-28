package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import model.MemberBean;

public class MemberDAO {

	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;

	// 디비 접속

	public void getCon() {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/cupid?serverTimezone=UTC";
			String user = "root";
			String password = "1111";

			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 상세 페이지

	public MemberBean viewMember(String email) {
		getCon();
		MemberBean bean = new MemberBean();
		try {
			String sql = "select * from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setAge(rs.getString(4));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 회원 가입

	public void insertMember(MemberBean bean) {
		getCon();

		try {
			String sql = "insert into member (email,password,name,age,gender,addr,profilepicture) values (?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getAge());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getAddr());
			if ((bean.getGender()).equals("남자")) {
				pstmt.setString(7, "nullman.jpg");
			} else {
				pstmt.setString(7, "nullgirl.jpg");
			}

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 수정

	public MemberBean modifyMember(MemberBean bean, String sessionemail) {
		getCon();

		try {
			String sql = "update member set name=?, gender=?, age=?, email=?, password=? where email=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getGender());
			pstmt.setString(3, bean.getAge());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getPassword());
			pstmt.setString(6, sessionemail);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 프로필 수정

	public void modifyProfile(String email, String whoami, String want, String profilepicture, String favo,
			String favo1, String favo2, String favo3) {
		getCon();

		try {
			String sql = "update member set whoami=?, want=?, profilepicture=?, favo=?, favo1=?, favo2=?, favo3=? where email=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, whoami);
			pstmt.setString(2, want);
			pstmt.setString(3, profilepicture);
			pstmt.setString(4, favo);
			pstmt.setString(5, favo1);
			pstmt.setString(6, favo2);
			pstmt.setString(7, favo3);
			pstmt.setString(8, email);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 세션 시간 입력

	public void sessionTime(String email, String signdate) {
		getCon();

		try {
			String sql = "update member set lastlogin=? where email=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, signdate);
			pstmt.setString(2, email);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//====================================모든 회원 DAO=======================┓	
	// ┃
	// 이성 회원수 체크

	public int getAllMember(String land, String gender) {
		getCon();

		int count = 0;
		try {
			String sql = "select count(*) from member where gender=? && addr like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, land);
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

	// 플레티넘 명수 세기

	public int platinumCount(String land, String gender) {
		getCon();
		int count = 0;
		try {
			String sql = "select count(*) from member where level=3 && gender=? && addr like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, land);
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

	// 플레티넘 불러오기

	public Vector<MemberBean> getPlatinum(String land, String gender, int startRow, int endRow, String nowyear) {
		getCon();
		Vector<MemberBean> v = new Vector<>();

		try {

			String sql = "select * from member where level=3 && addr like ? && gender=? order by lastlogin desc limit ?,?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, land);
			pstmt.setString(2, gender);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();

			String ageyear = "";

			while (rs.next()) {
				MemberBean bean = new MemberBean();

				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				ageyear = (rs.getString(4)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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

	// 최근활동 이성회원 불러오기

	public Vector<MemberBean> getMemberNormal(String land, String gender, int startRow, int endRow, String nowyear) {
		getCon();
		Vector<MemberBean> v = new Vector<>();

		try {

			String sql = "select * from member where addr like ? && gender=? order by lastlogin desc limit ?,?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, land);
			pstmt.setString(2, gender);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();

			String ageyear = "";

			while (rs.next()) {
				MemberBean bean = new MemberBean();

				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				ageyear = (rs.getString(4)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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

	// 검색 회원수 체크

	public int searchGetAllMember(String land, String gender, String firstage, String lastage, String level) {
		getCon();

		int count = 0;
		try {
			String sql = "";
			if (level.equals("4")) {
				sql = "select count(*) from member where gender=? && level != 10 && addr like ? && left(age,4) <= ? && left(age,4) >= ?";
			} else {
				sql = "select count(*) from member where gender=? && level != 10 && addr like ? && left(age,4) <= ? && left(age,4) >= ? && level = ?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, land);
			pstmt.setString(3, firstage);
			pstmt.setString(4, lastage);
			if (!level.equals("4")) {
				pstmt.setString(5, level);
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

	// 검색 회원 불러오기

	public Vector<MemberBean> searchGetMember(String land, String gender, int startRow, int endRow, String nowyear,
			String firstage, String lastage, String level) {
		getCon();
		Vector<MemberBean> v = new Vector<>();

		try {
			String sql = "";
			if (level.equals("4")) {
				sql = "select * from member where addr like ? && gender=? && level != 10 && left(age,4) <= ? && left(age,4) >= ? order by level desc , lastlogin desc limit ?,?";
			} else {
				sql = "select * from member where addr like ? && gender=? && level != 10 && left(age,4) <= ? && left(age,4) >= ? && level = ? order by level desc , lastlogin desc limit ?,?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, land);
			pstmt.setString(2, gender);
			pstmt.setString(3, firstage);
			pstmt.setString(4, lastage);
			if (level.equals("4")) {
				pstmt.setInt(5, startRow);
				pstmt.setInt(6, endRow);
			} else {
				pstmt.setString(5, level);
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
			}
			rs = pstmt.executeQuery();

			String ageyear = "";

			while (rs.next()) {
				MemberBean bean = new MemberBean();

				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				ageyear = (rs.getString(4)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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

	// 검색 레벨 상관없음 플레티넘 명수 세기

	public int searchPlatinumCount(String land, String gender, String firstage, String lastage) {
		getCon();
		int count = 0;
		try {
			String sql = "select count(*) from member where level=3 && gender=? && addr like ? && left(age,4) <= ? && left(age,4) >= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, land);
			pstmt.setString(3, firstage);
			pstmt.setString(4, lastage);
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
	// ┃
//====================================모든 회원 DAO=======================┛

//===============================현재 로그인 회원 DAO=======================┓	
	// ┃
	// 이성 회원수 체크

	public int getAllMemberLogin(String land, String gender, int lastTime) {
		getCon();

		int count = 0;
		try {
			String sql = "select count(*) from member where gender=? && lastlogin >= date_add(now(), interval -? minute) && addr like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setInt(2, lastTime);
			pstmt.setString(3, land);
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

	// 플레티넘 명수 세기

	public int platinumCountLogin(String land, String gender, int lastTime) {
		getCon();
		int count = 0;
		try {
			String sql = "select count(*) from member where level=3 && gender=? && lastlogin >= date_add(now(), interval -? minute) && addr like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setInt(2, lastTime);
			pstmt.setString(3, land);
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

	// 플레티넘 불러오기

	public Vector<MemberBean> getPlatinumLogin(String land, String gender, int startRow, int endRow, String nowyear,
			int lastTime) {
		getCon();
		Vector<MemberBean> v = new Vector<>();

		try {

			String sql = "select * from member where level=3 && gender=? && lastlogin >= date_add(now(), interval -? minute) && addr like ? order by lastlogin desc limit ?,?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setInt(2, lastTime);
			pstmt.setString(3, land);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();

			String ageyear = "";

			while (rs.next()) {
				MemberBean bean = new MemberBean();

				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				ageyear = (rs.getString(4)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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

	// 최근활동 이성회원 불러오기

	public Vector<MemberBean> getMemberNormalLogin(String land, String gender, int startRow, int endRow, String nowyear,
			int lastTime) {
		getCon();
		Vector<MemberBean> v = new Vector<>();

		try {

			String sql = "select * from member where gender=? && lastlogin >= date_add(now(), interval -? minute) && addr like ? order by lastlogin desc limit ?,?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setInt(2, lastTime);
			pstmt.setString(3, land);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();

			String ageyear = "";

			while (rs.next()) {
				MemberBean bean = new MemberBean();

				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				ageyear = (rs.getString(4)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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

	// 검색 회원수 체크

	public int searchGetAllMemberLogin(String land, String gender, String firstage, String lastage, String level,
			int lastTime) {
		getCon();

		int count = 0;
		try {
			String sql = "";
			if (level.equals("4")) {
				sql = "select count(*) from member where gender=? && level != 10 && addr like ? && left(age,4) <= ? && left(age,4) >= ? && lastlogin >= date_add(now(), interval -? minute)";
			} else {
				sql = "select count(*) from member where gender=? && level != 10 && addr like ? && left(age,4) <= ? && left(age,4) >= ? && lastlogin >= date_add(now(), interval -? minute) && level = ?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, land);
			pstmt.setString(3, firstage);
			pstmt.setString(4, lastage);
			pstmt.setInt(5, lastTime);
			if (!level.equals("4")) {
				pstmt.setString(6, level);
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

	// 검색 회원 불러오기

	public Vector<MemberBean> searchGetMemberLogin(String land, String gender, int startRow, int endRow, String nowyear,
			String firstage, String lastage, String level, int lastTime) {
		getCon();
		Vector<MemberBean> v = new Vector<>();

		try {
			String sql = "";
			if (level.equals("4")) {
				sql = "select * from member where addr like ? && gender=? && level != 10 && left(age,4) <= ? && left(age,4) >= ? && lastlogin >= date_add(now(), interval -? minute) order by level desc , lastlogin desc limit ?,?";
			} else {
				sql = "select * from member where addr like ? && gender=? && level != 10 && left(age,4) <= ? && left(age,4) >= ? && lastlogin >= date_add(now(), interval -? minute) && level = ? order by level desc , lastlogin desc limit ?,?";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, land);
			pstmt.setString(2, gender);
			pstmt.setString(3, firstage);
			pstmt.setString(4, lastage);
			pstmt.setInt(5, lastTime);
			if (level.equals("4")) {
				pstmt.setInt(6, startRow);
				pstmt.setInt(7, endRow);
			} else {
				pstmt.setString(6, level);
				pstmt.setInt(7, startRow);
				pstmt.setInt(8, endRow);
			}
			rs = pstmt.executeQuery();

			String ageyear = "";

			while (rs.next()) {
				MemberBean bean = new MemberBean();

				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				ageyear = (rs.getString(4)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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

	// 검색 레벨 상관없음 플레티넘 명수 세기

	public int searchPlatinumCountLogin(String land, String gender, String firstage, String lastage, int lastTime) {
		getCon();
		int count = 0;
		try {
			String sql = "select count(*) from member where level=3 && gender=? && addr like ? && left(age,4) <= ? && left(age,4) >= ? && lastlogin >= date_add(now(), interval -? minute)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, land);
			pstmt.setString(3, firstage);
			pstmt.setString(4, lastage);
			pstmt.setInt(5, lastTime);
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

	// ┃
//====================================현재 로그인 회원 DAO=======================┛

	// 총 게시물 수

	public int getAllAdmincount(String email) {
		getCon();

		int count = 0;

		try {
			String sql = "select count(*) from member";

			pstmt = conn.prepareStatement(sql);
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

	// 운영자회원 상세 페이지 및 페이징처리

	public Vector<MemberBean> viewMember1(String email, int startRow, int endRow) {
		getCon();
		Vector<MemberBean> v = new Vector<>();
		try {
			String sql = "select * from member order by level desc limit ?,?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setAge(rs.getString(4));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));

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
	// 운영자회원 상세 페이지2

	public MemberBean viewMember2(String nowyear) {
		getCon();
		MemberBean bean = new MemberBean();
		try {
			String sql = "select * from member";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//System.out.println(pstmt);
			String ageyear = "";

			if (rs.next()) {
				ageyear = (rs.getString(1)).substring(0, 4);
				int realage = Integer.parseInt(nowyear) - Integer.parseInt(ageyear) + 1;
				bean.setAge(Integer.toString(realage));
				//System.out.println(ageyear);
				//System.out.println(realage);
			}
			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	// 레벨 수정

	public void modifyAdminProfile(String level, String email) {
		getCon();

		try {
			String sql = "update member set level=? where email=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, level);
			pstmt.setString(2, email);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 아이디 찾기
	public MemberBean searchId(String name) {
		getCon();

		MemberBean bean = new MemberBean();

		try {
			String sql = "select * from member where name=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setEmail(rs.getString(1));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 비밀번호 찾기
	public MemberBean searchPw(String email, String name) {
		getCon();

		MemberBean bean = new MemberBean();

		try {
			String sql = "select * from member where email=? && name=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			//System.out.println(pstmt);
			if (rs.next()) {
				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 메세지
	public MemberBean viewMessa(String memail) {
		getCon();
		MemberBean bean = new MemberBean();
		try {
			String sql = "select * from member where email=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memail);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean.setEmail(rs.getString(1));
				bean.setPassword(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setAge(rs.getString(4));
				bean.setGender(rs.getString(5));
				bean.setFavo(rs.getString(6));
				bean.setFavo1(rs.getString(7));
				bean.setFavo2(rs.getString(8));
				bean.setFavo3(rs.getString(9));
				bean.setAddr(rs.getString(10));
				bean.setProfilepicture(rs.getString(11));
				bean.setWhoami(rs.getString(12));
				bean.setWant(rs.getString(13));
				bean.setLastlogin(rs.getString(14));
				bean.setLevel(rs.getInt(15));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	// 결제

	public void upgradeLevel(String email, int level) {
		getCon();

		try {
			String sql = "update member set level=? where email=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, level);
			pstmt.setString(2, email);

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
