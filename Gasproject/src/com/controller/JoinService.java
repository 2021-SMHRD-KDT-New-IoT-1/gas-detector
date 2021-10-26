package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 데이터 인코딩 방식 지정
		request.setCharacterEncoding("euc-kr");
		
		//요청데이터 받아주기
		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		String admin_name = request.getParameter("admin_name");
		String admin_tel = request.getParameter("admin_tel");
		String admin_email = request.getParameter("admin_email");
		String admin_job = request.getParameter("admin_job"); 
		String loc_no = request.getParameter("loc_no");
		 
		
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(admin_id, admin_pw, admin_name, admin_tel, admin_email, admin_job, loc_no);
		
		if(cnt>0) {
			System.out.println("가입 성공");
			
			//forward 방식으로 페이지 이동
			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");
			
			//request영역에 기억해야할 데이터 설정
			request.setAttribute("admin_id", admin_id);
			
			//페이지 이동할 시 request, response 객체 전달				
			rd.forward(request, response);
			
			//response.sendRedirect("join_success.jsp?email="+email);
			//쿼리스트링 방식으로 데이터 전송 > 받을 때는 getParameter()로 
			
		}else {
			System.out.println("가입 실패..");
			response.sendRedirect("main.jsp");
		}
		
	}

}
