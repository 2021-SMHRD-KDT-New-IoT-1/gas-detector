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
		//��û ������ ���ڵ� ��� ����
		request.setCharacterEncoding("euc-kr");
		
		//��û������ �޾��ֱ�
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
			System.out.println("���� ����");
			
			//forward ������� ������ �̵�
			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");
			
			//request������ ����ؾ��� ������ ����
			request.setAttribute("admin_id", admin_id);
			
			//������ �̵��� �� request, response ��ü ����				
			rd.forward(request, response);
			
			//response.sendRedirect("join_success.jsp?email="+email);
			//������Ʈ�� ������� ������ ���� > ���� ���� getParameter()�� 
			
		}else {
			System.out.println("���� ����..");
			response.sendRedirect("main.jsp");
		}
		
	}

}
