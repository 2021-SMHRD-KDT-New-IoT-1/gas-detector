package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;

@WebServlet("/GetSensor")
public class GetSensor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String gas_level = request.getParameter("gas_level");
		String user_mid = request.getParameter("user_mid");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.InsertSensor(gas_level, user_mid); 
		
	  if(cnt>0) {
		  System.out.println("¼º°ø!");
		  
		  
			
		  
	  }
}
}