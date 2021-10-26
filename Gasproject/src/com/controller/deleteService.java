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
		
		String machine_id = request.getParameter("machine_id");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.delete(machine_id );
		
		if(cnt>0) {
			System.out.println("���� ����");
			response.sendRedirect("selectMember.jsp");
		}else {
			System.out.println("���� ����");
			response.sendRedirect("selectMember.jsp");
		}
		
		
		
	}

}
