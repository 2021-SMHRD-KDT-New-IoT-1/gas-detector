package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.AdminMemberVO;
import com.model.MemberDAO;
import com.model.UserMemberVO;

@WebServlet("/updateService")
public class updateService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession(); //세션객체 생성
		AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member"); //현재 로그인한 사용자의 정보
		String admin_id = vo2.getAdmin_id(); //현재 로그인한 사용자의 이메일
		
		//수정에 사용할 정보
		String admin_pw = request.getParameter("admin_pw");
		String admin_name = request.getParameter("admin_name");
		String admin_tel = request.getParameter("admin_tel");
		String admin_email = request.getParameter("admin_email");
		String admin_job = request.getParameter("admin_job");
		String loc_no = request.getParameter("loc_no");
		String user_no = request.getParameter("user_no");
					
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(admin_pw, admin_name, admin_tel, admin_email, admin_job, admin_id, loc_no, user_no);
		
		if(cnt>0) {
			System.out.println("수정 성공");
			
			vo2 = new AdminMemberVO(admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_job, loc_no, user_no);
			session.setAttribute("member", vo2); //수정한 값으로 업뎃
			
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("수정 실패");
			response.sendRedirect("main.jsp");
		}
		
		
		
		
	}

}
