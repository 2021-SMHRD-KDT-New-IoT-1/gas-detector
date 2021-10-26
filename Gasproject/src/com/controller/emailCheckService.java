package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;


@WebServlet("/emailCheckService")
public class emailCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		boolean check = dao.emailCheck(email);
		
		//출력 스트링(통로)
		PrintWriter out = response.getWriter();
		//통로를 통해서 응답데이터를 출력
		out.print(check);
	}

}
