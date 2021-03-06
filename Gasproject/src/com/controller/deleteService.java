package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.UserMemberVO;

@WebServlet("/deleteService")
public class deleteService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_mid = request.getParameter("user_mid");
		
		System.out.println(user_mid);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.delete(user_mid);
		
		if(cnt>0) {
			System.out.println("삭제 성공");
			response.sendRedirect("selectMember.jsp");
		}else {
			System.out.println("삭제 실패");
			response.sendRedirect("selectMember.jsp");
		}
		
		
		
	}

}
