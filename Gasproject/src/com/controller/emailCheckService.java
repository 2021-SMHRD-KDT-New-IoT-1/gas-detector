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
		
		//��� ��Ʈ��(���)
		PrintWriter out = response.getWriter();
		//��θ� ���ؼ� ���䵥���͸� ���
		out.print(check);
	}

}
