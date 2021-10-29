package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.GasVO;
import com.model.MemberDAO;


@WebServlet("/GasCheckService")
public class GasCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_no = request.getParameter("user_no");
		
		MemberDAO dao = new MemberDAO();
		
		ArrayList<GasVO> gasall = dao.gascheck(user_no);
		
		if(gasall!=null) {
			System.out.println("현황불러오기 성공");
			HttpSession session = request.getSession();
			// 세션 값 설정
			session.setAttribute("user_no", user_no);
			response.sendRedirect("GasCheck.jsp");
		}else {
			System.out.println("현황불러오기 실패..");
			response.sendRedirect("myMember.jsp");
		}
		
		
	}

}
