<%@page import="com.model.GasVO"%>
<%@page import="com.model.UserMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
		
	</style>
	<body style="text-align: center; background:rgba(0,0,0,0.9);">
		<%
			MemberDAO dao = new MemberDAO();
			String user_no = (String)session.getAttribute("user_no");
			ArrayList<GasVO> gasall = dao.gascheck(user_no);
		%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							
							<caption><h2>가스 현황 확인 페이지</h2></caption>
						
							<tr>
								<td>관리번호</td>
								<td>관리자번호</td>
								<td>사용자번호</td>
								<td>기기번호</td>
								<td>가스농도</td>		
								<td>측정시간</td>					
							</tr>
							
							
						<%
						for(GasVO vo3 : gasall){
													%>
                         <tr>
                          <td><%=vo3.getManager_no() %></td>
                          <td><%=vo3.getAdmin_no() %></td>
                          <td><%=vo3.getUser_no() %></td> 
                          <td><%=vo3.getUser_mid() %></td> 
                          <td><%=vo3.getGas_level() %></td> 
                          <td><%=vo3.getDec_time() %></td> 
                          <td><a href="#" class='delete'>신고</a></td>
                         </tr>
                        <%}%>
                     
							
						</table>
						<table>
							<form action="loginService">
							<input type="submit" value="HOME" >
							</form>
							
						</table>
					</nav>			
			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	</body>
</html>

