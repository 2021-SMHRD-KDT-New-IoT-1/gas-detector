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
		
		HttpSession session = request.getSession(); //���ǰ�ü ����
		AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member"); //���� �α����� ������� ����
		String admin_id = vo2.getAdmin_id(); //���� �α����� ������� �̸���
		
		//������ ����� ����
		String update_pw = request.getParameter("admin_pw");
		String update_tel = request.getParameter("admin_tel");
		String update_name = request.getParameter("admin_name");
		String update_job = request.getParameter("admin_job");
		String update_email = request.getParameter("admin_email");
		
				
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(update_pw, update_tel, update_name, update_job, update_email, admin_id);
		
		if(cnt>0) {
			System.out.println("���� ����");
			
//			vo2 = new AdminMemberVO(update_pw, update_tel, update_name, update_job, update_email, admin_id);
			session.setAttribute("member", vo2); //������ ������ ����
			
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("���� ����");
			response.sendRedirect("main.jsp");
		}
		
		
		
		
	}

}
