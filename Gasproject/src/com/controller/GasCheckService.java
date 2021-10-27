package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;


@WebServlet("/GasCheckService")
public class GasCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_no = request.getParameter("user_no");
		
		MemberDAO dao = new MemberDAO();
		
       int cnt = dao.gascheck(user_no);
		
		if(cnt>0) {
			System.out.println("현황불러오기 성공");
			response.sendRedirect("GasCheck.jsp");
		}else {
			System.out.println("현황불러오기 실패..");
			response.sendRedirect("selectMember.jsp");
		}
		
		
	}

}
