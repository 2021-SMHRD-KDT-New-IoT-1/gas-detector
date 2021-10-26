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

@WebServlet("/userUpdateService")
public class userUpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String user_no = request.getParameter("user_no");
		String user_name = request.getParameter("user_name");
		String user_tel = request.getParameter("user_tel");
		String user_add = request.getParameter("user_add");
		String user_mid = request.getParameter("user_mid");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.userUpdate(user_name, user_tel, user_add, user_mid, user_no);
		
		if(cnt>0) {
			
			System.out.println("수정 성공");		
			response.sendRedirect("selectMember.jsp");
		}else {
			System.out.println("수정 실패");
			response.sendRedirect("selectMember.jsp");
		}
		
		
//		HttpSession session = request.getSession();
//		// 세션 값 설정
//		session.setAttribute("member", vo2);

	}

}
