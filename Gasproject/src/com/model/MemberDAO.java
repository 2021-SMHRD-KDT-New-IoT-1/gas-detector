package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			//jdbc:oracle:thin:@localhost:1521:xe
			//project-db-stu.ddns.net:1524
			String user = "hr";
			String password = "hr";
			
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("���� ����");
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
	
	//ȸ������ ���(�޼ҵ�)
	public int join(String admin_id, String admin_pw, String admin_name, String admin_tel, String admin_email) {

		//�޾ƿ� ���� db ���̺� ����
		try {
			
			connection();
			String sql = "insert into ADMIN_MEMBER (admin_no, admin_id, admin_pw, admin_name, admin_tel, admin_email) values (admin_seq.nextval,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin_id);
			psmt.setString(2, admin_pw);
			psmt.setString(3, admin_name);
			psmt.setString(4, admin_tel);
			psmt.setString(5, admin_email);
			
			// �����ڹ�ȣ �ڵ��ο�? 
			// ����ȣ?
			
			cnt = psmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("���� ����!");
			e.getStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public AdminMemberVO login(String admin_id, String admin_pw) {
		try {
			connection();
			
			String sql = "select admin_id, admin_email, admin_tel, admin_job from ADMIN_MEMBER where admin_id=? and admin_pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, admin_id);	
			psmt.setString(2, admin_pw);		
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("�α��� ����!");
				String get_admin_id = rs.getString("admin_email");
				String get_email = rs.getString("admin_email");
				String get_tel = rs.getString("admin_tel");
				String get_job = rs.getString("admin_job");
				
//				vo2 = new AdminMemberVO(get_admin_id,get_email, get_tel, get_job);
						
			}else {
				System.out.println("�α��� ����!");
			}
			
		} catch (Exception e) {
			System.out.println("�α��� ����");
			e.printStackTrace();
		}finally {
			close();
		}
		return vo2;
	}
	
	//���� �޼ҵ�
	public int update(String admin_pw, String admin_tel, String admin_name, String admin_job, String admin_email, String admin_id) {
		try {
			connection();
			
			String sql = "update ADMIN_MEMBER set admin_pw = ?, admin_tel=?, admin_name=? admin_job=? admin_email=? where admin_id=?";
			psmt = conn.prepareStatement(sql);
				
			psmt.setNString(1, admin_pw);		
			psmt.setNString(2, admin_tel);	
			psmt.setNString(3, admin_name);	
			psmt.setNString(4, admin_job);
			psmt.setNString(5, admin_email);
			psmt.setNString(6, admin_id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("���� ����!");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	//main �׸� �߰��ϱ� 
	
	//��� ȸ�� ���� �������� �޼ҵ�
	public ArrayList<UserMemberVO> allMember() {
		all = new ArrayList<UserMemberVO>();		
		
		try {
			connection();
			
			String sql = "select user_name, user_tel, user_add from USER_MEMBER";
			psmt = conn.prepareStatement(sql);
						
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				System.out.println("ȸ������ �ҷ����� ����!");
				
				String get_name = rs.getString("user_name");
				String get_tel = rs.getString("user_tel");
				String get_add = rs.getString("user_add");
				
				vo = new UserMemberVO(get_name, get_tel, get_add);
				all.add(vo);
			}	
			
		} catch (Exception e) {
			System.out.println("ȸ������ �ҷ����� ����!");
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
			psmt.setNString(1, user_mid);	
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("���� ����!");
			e.printStackTrace();
		}finally {
			close();
			}
		return cnt;
	}
	
	//email �ߺ�üũ �޼ҵ�
	public boolean emailCheck(String admin_id) {
		boolean check = false;
		
		try {
			connection();
			
			String sql = "select admin_id from ADMIN_MEMBER where admin_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setNString(1, admin_id);		
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//�Է��� �̸��� ��� �Ұ�
				System.out.println("�̸��� �ߺ�");
				check = true;
				
			}else {
				//�Է��� �̸��� ��� ����
				System.out.println("�̸��� �ߺ� x");
				check = false;
			}
			
		} catch (Exception e) {
			System.out.println("�̸��� �ߺ� x");
			e.printStackTrace();
		}finally {
			close();
		}
		return check;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
