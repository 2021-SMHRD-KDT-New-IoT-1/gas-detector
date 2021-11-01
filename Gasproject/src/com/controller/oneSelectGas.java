package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.GasVO;
import com.model.MemberDAO;

@WebServlet("/oneSelectGas")
public class oneSelectGas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		MemberDAO dao = new MemberDAO();
		String alert_cnt = dao.gasOne();	
		
		
		if(alert_cnt.equals("0")) {
			response.setContentType("application/x-json; charset=EUC-KR");
	        PrintWriter out = response.getWriter();
	        out.print(alert_cnt);
	        
	        
	        System.out.println(alert_cnt);
	        
		}else {
			
		}
	}

}
