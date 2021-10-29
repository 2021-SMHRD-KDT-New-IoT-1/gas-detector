package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/userJoinService")
public class userJoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		//요청데이터 받아주기
		String user_no = request.getParameter("user_no");
		String user_name = request.getParameter("user_name");
		String user_tel = request.getParameter("user_tel");
		String user_add = request.getParameter("user_add");
		String user_mid = request.getParameter("user_mid");
		String admin_no = request.getParameter("admin_no");
		
		String result2 = admin_no.substring(admin_no.lastIndexOf("/")+1);
	
		MemberDAO dao = new MemberDAO();
		int cnt = dao.adduser(user_no, user_name, user_tel, user_add, user_mid, result2);
		
		if(cnt>0) {
			System.out.println("회원 추가 성공");
			response.sendRedirect("selectMember.jsp");
		}else {
			System.out.println("가입 실패..");
			response.sendRedirect("selectMember.jsp");
		}
		
	}

}
