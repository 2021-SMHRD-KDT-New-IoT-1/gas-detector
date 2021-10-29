package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	UserMemberVO vo = null;
	ArrayList<UserMemberVO> all = null;
	AdminMemberVO vo2 = null;
	ArrayList<GasVO> gasall = null;
	GasVO vo3 = null;
	localVO vo4 = null;
	ArrayList<localVO> locall = null;
	ArrayList<AdminMemberVO> adminall = null;

	ArrayList<UserMemberVO> myMember = null;
		
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			//jdbc:oracle:thin:@localhost:1521:xe
			//project-db-stu.ddns.net:1524
			String user = "campus_a_4_1025";
			String password = "smhrd4";
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패");
		}
		
	}
	
	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원가입 기능(메소드)
	public int join(String admin_id, String admin_pw, String admin_name, String admin_tel, String admin_email, String admin_job, String loc_no) {

		//받아온 값을 db 테이블에 삽입
		try {
			connection();
		
			String sql = "insert into ADMIN_MEMBER (admin_no, admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_job, loc_no) values (admin_seq.nextval,?,?,?,?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin_id);
			psmt.setString(2, admin_pw);
			psmt.setString(3, admin_name);
			psmt.setString(4, admin_tel);
			psmt.setString(5, admin_email);
			psmt.setString(6, admin_job);
			psmt.setString(7, loc_no);
				
			cnt = psmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("가입 실패!");
			e.getStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public AdminMemberVO login(String admin_id, String admin_pw) {
		try {
			connection();
			
			String sql = "select admin_no, admin_id, admin_email, admin_tel, admin_job, loc_no from ADMIN_MEMBER where admin_id=? and admin_pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin_id);	
			psmt.setString(2, admin_pw);		
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("로그인 성공!");
				String get_admin_no = rs.getString("admin_no");
				String get_admin_id = rs.getString("admin_id");
				String get_email = rs.getString("admin_email");
				String get_tel = rs.getString("admin_tel");
				String get_job = rs.getString("admin_job");
				String get_loc_no= rs.getString("loc_no");
				
				vo2 = new AdminMemberVO(get_admin_no, get_admin_id, get_email, get_tel, get_job, get_loc_no);
						
			}else {
				System.out.println("로그인 실패!");
			}
			
		} catch (Exception e) {
			System.out.println("로그인 실패");
			e.printStackTrace();
		}finally {
			close();
		}
		return vo2;
	}
	
	//수정 메소드
	public int update(String admin_pw, String admin_name, String admin_tel, String admin_email, String admin_job, String admin_id, String result) {
		try {
			connection();
			
			String sql = "update ADMIN_MEMBER set admin_pw = ?, admin_name=?, admin_tel=?, admin_email=?, admin_job=?, loc_no=? where admin_id=?";
			psmt = conn.prepareStatement(sql);
				
			psmt.setString(1, admin_pw);		
			psmt.setString(2, admin_name);	
			psmt.setString(3, admin_tel);
			psmt.setString(4, admin_email);
			psmt.setString(5, admin_job);
			psmt.setString(6, result);
			//psmt.setNString(7, user_no);
			psmt.setString(7, admin_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("수정 실패!");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	//main 항목 추가하기 
	
	//모든 회원 정보 가져오는 메소드
	public ArrayList<UserMemberVO> allMember() {
		all = new ArrayList<UserMemberVO>();		
		
		try {
			connection();
			
			String sql = "select user_no, user_name, user_tel, user_add, user_mid, admin_no from USER_MEMBER";
			psmt = conn.prepareStatement(sql);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("회원정보 불러오기 성공!");
				
				String get_no = rs.getString("user_no");
				String get_name = rs.getString("user_name");
				String get_tel = rs.getString("user_tel");
				String get_add = rs.getString("user_add");
				String get_mid = rs.getString("user_mid");
				String get_admin_no = rs.getString("admin_no");
				
				vo = new UserMemberVO(get_no, get_name, get_tel, get_add, get_mid, get_admin_no);
				all.add(vo);
			}	
			
		} catch (Exception e) {
			System.out.println("회원정보 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return all;
		}
	
	public int delete(String user_mid) {
		try {
			connection();

			String sql = "delete from USER_MEMBER where user_mid=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_mid);	
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return cnt;
	}
	
	//email 중복체크 메소드
	public boolean emailCheck(String admin_id) {
		boolean check = false;
		
		try {
			connection();
			
			String sql = "select admin_id from ADMIN_MEMBER where admin_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, admin_id);		
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//입력한 이메일 사용 불가
				System.out.println("이메일 중복");
				check = true;
				
			}else {
				//입력한 이메일 사용 가능
				System.out.println("이메일 중복 x");
				check = false;
			}
			
		} catch (Exception e) {
			System.out.println("이메일 중복 x");
			e.printStackTrace();
		}finally {
			close();
		}
		return check;
	}
	
	//사용자정보 수정 
	public int userUpdate(String user_name, String user_tel, String user_add, String user_mid, String result, String result2) {
		try {
			connection();
			
			String sql = "update USER_MEMBER set user_name=?, user_tel=?, user_add=?, user_mid=?, admin_no=? where user_no=?";
			psmt = conn.prepareStatement(sql);
				
			psmt.setString(1, user_name);		
			psmt.setString(2, user_tel);	
			psmt.setString(3, user_add);
			psmt.setString(4, user_mid);
			psmt.setString(5, result);
			psmt.setString(6, result2);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("수정 실패!");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	//사용자 추가 페이지
	public int adduser(String user_no, String user_name, String user_tel, String user_add, String user_mid, String result2 ) {
		try {
			connection();
			
			String sql = "insert into USER_MEMBER values (?,?,?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_no);
			psmt.setString(2, user_name);
			psmt.setString(3, user_tel);
			psmt.setString(4, user_add);
			psmt.setString(5, user_mid);
			psmt.setString(6, result2);
		
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("사용자 추가 실패!");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	//가스 데이터 가져오기
	public ArrayList<GasVO> gasData() {
		gasall = new ArrayList<GasVO>();		
		
		try {
			connection();
			
			String sql = "select manager_no, admin_no, user_no, user_mid, gas_level, dec_time from INTE_TBL ";
			psmt = conn.prepareStatement(sql);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("회원정보 불러오기 성공!");
				
				String get_manager_no = rs.getString("manager_no");
				String get_admin_no = rs.getString("admin_no");
				String get_user_no = rs.getString("user_no");
				String get_user_mid = rs.getString("user_mid");
				String get_gas_level = rs.getString("gas_level");
				String get_dec_time = rs.getString("dec_time");
				
				vo3 = new GasVO(get_manager_no, get_admin_no, get_user_no, get_user_mid, get_gas_level, get_dec_time);
				gasall.add(vo3);
			}	
			
		} catch (Exception e) {
			System.out.println("회원정보 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return gasall;
		
	}
	
	//지역 확인 페이지
	public ArrayList<localVO> localList() {
		locall = new ArrayList<localVO>();		
		
		try {
			connection();
			
			String sql = "select loc_no, loc_name from LOC_TBL";
			psmt = conn.prepareStatement(sql);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("회원정보 불러오기 성공!");
				
				String get_loc_no = rs.getString("loc_no");
				String get_loc_name = rs.getString("loc_name");
				
				
				vo4 = new localVO(get_loc_no, get_loc_name);
				locall.add(vo4);
			}	
			
		} catch (Exception e) {
			System.out.println("지역정보 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return locall;
		
	}
	
	//지역명 불러오기
	public String localName(String loc_no) {
		String get_loc_name = "";
		
		try {
			connection();
			
			String sql = "select loc_name from loc_tbl admin_member where ? = admin_member.loc_no";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, loc_no);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("회원정보 불러오기 성공!");
				
				get_loc_name = rs.getString("loc_name");
			}	
			
		} catch (Exception e) {
			System.out.println("지역명 가져오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return get_loc_name;
	}
	
	public ArrayList<GasVO> gascheck(String user_no) {
		gasall = new ArrayList<GasVO>();
		
		try {
			connection();

			String sql = "select manager_no, admin_no, user_no, user_mid, gas_level, dec_time from INTE_TBL where user_no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_no);	
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("현황 불러오기 성공!");
				
				String get_manager_no = rs.getString("manager_no");
				String get_admin_no = rs.getString("admin_no");
				String get_user_no = rs.getString("user_no");
				String get_user_mid = rs.getString("user_mid");
				String get_gas_level = rs.getString("gas_level");
				String get_dec_time = rs.getString("dec_time");
				
				vo3 = new GasVO(get_manager_no, get_admin_no, get_user_no, get_user_mid, get_gas_level, get_dec_time);
				gasall.add(vo3);
			}	
			
		} catch (Exception e) {
			System.out.println("회원정보 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return gasall;
		
	}
	
	//관리자 목록
	public ArrayList<AdminMemberVO> allAdmin() {
		adminall = new ArrayList<AdminMemberVO>();		
		
		try {
			connection();
			
			String sql = "select admin_name, admin_no from ADMIN_MEMBER";
			psmt = conn.prepareStatement(sql);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("회원정보 불러오기 성공!");
				
				String get_admin_name = rs.getString("admin_name");
				String get_admin_no = rs.getString("admin_no");
				
				
				vo2 = new AdminMemberVO(get_admin_name, get_admin_no);
				adminall.add(vo2);
			}	
			
		} catch (Exception e) {
			System.out.println("관리자 목록 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return adminall;
		}
	
	public int InsertSensor(String gas_level ,String user_mid) {
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		String format_time1 = format1.format (System.currentTimeMillis());
		System.out.println(user_mid);
		System.out.println(gas_level);
		try {
			connection();
			String sql = "insert into inte_tbl(manager_no, admin_no, user_no, user_mid,gas_level,dec_time)values (MGR_SEQ.nextval,(select admin_no from user_member where user_mid =?),(select user_no from user_member where user_mid =?),?,?,?)"; 
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_mid);
			psmt.setString(2, user_mid);
			psmt.setString(3, user_mid);
			psmt.setString(4, gas_level);
			psmt.setString(5, format_time1);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("관리자 목록 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return cnt;
		}
		
	
	
	//내가 관리하고 있는 사용자 정보
	public ArrayList<UserMemberVO> myMember(String admin_no) {
		myMember = new ArrayList<UserMemberVO>();		
		
		try {
			connection();
			
			String sql = "select user_no, user_name, user_tel, user_add, user_mid, admin_no from USER_MEMBER where admin_no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin_no);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("회원정보 불러오기 성공!");
				
				String get_no = rs.getString("user_no");
				String get_name = rs.getString("user_name");
				String get_tel = rs.getString("user_tel");
				String get_add = rs.getString("user_add");
				String get_mid = rs.getString("user_mid");
				String get_admin_no = rs.getString("admin_no");
				
				vo = new UserMemberVO(get_no, get_name, get_tel, get_add, get_mid, get_admin_no);
				myMember.add(vo);
			}	
			
		} catch (Exception e) {
			System.out.println("회원정보 불러오기 실패!");
			e.printStackTrace();
		}finally {
			close();
			}
		return myMember;
		}
	
	//내 사용자 정보 수정
	public int myuserUpdate(String user_name, String user_tel, String user_add, String user_mid, String result1, String result2) {
		try {
			connection();
			
			String sql = "update USER_MEMBER set user_name=?, user_tel=?, user_add=?, user_mid=?, admin_no=? where user_no=?";
			psmt = conn.prepareStatement(sql);
				
			psmt.setString(1, user_name);		
			psmt.setString(2, user_tel);	
			psmt.setString(3, user_add);
			psmt.setString(4, user_mid);
			psmt.setString(5, result2);
			psmt.setString(6, result1);
			
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("수정 실패!");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
}
	
	
	
	
