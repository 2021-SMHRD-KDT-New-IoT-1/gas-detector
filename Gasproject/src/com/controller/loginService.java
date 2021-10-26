package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.AdminMemberVO;
import com.model.MemberDAO;
import com.model.UserMemberVO;

@WebServlet("/loginService")
public class loginService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");
		

		MemberDAO dao = new MemberDAO();
		AdminMemberVO vo2 = dao.login(admin_id, admin_pw);
		

		if (vo2 != null) {
			// 技记 按眉 积己
			HttpSession session = request.getSession();
			// 技记 蔼 汲沥
			session.setAttribute("member", vo2);

			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("main.jsp");
		}

	}

}
