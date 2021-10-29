<%@page import="com.model.UserMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style=" margin-left: 200px; margin-right: 200px;">
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
	<body style="text-align: center; background:rgba(0,0,0,0.9)">
		<%
			MemberDAO dao = new MemberDAO();
			ArrayList<UserMemberVO> all = dao.allMember();
		%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<table>
							
							<caption><h2>사용자 확인&관리 페이지</h2></caption>
						
							<tr>
								<td>회원번호</td>
								<td>이름</td>
								<td>연락처</td>
								<td>주소</td>
								<td>기기번호</td>
								<td>관리자번호</td>
								<td>사용자삭제</td>
													
							</tr>
							
						<%
						for(UserMemberVO vo : all){
													%>
                         <tr>
                          <td><%=vo.getUser_no() %></td>
                          <td><%=vo.getUser_name() %></td>
                          <td><%=vo.getUser_tel() %></td> 
                          <td><%=vo.getUser_add() %></td> 
                          <td><%=vo.getUser_mid() %></td> 
                          <td><%=vo.getAdmin_no() %></td> 
                          <td><a href="deleteService?user_mid=<%=vo.getUser_mid()%>">삭제</a></td> 
                          
                         </tr>
                        <%}%>
                        
                        </table>
                     <table>
							<tr>
							<input type="button" value=" HOME " style="margin:20px;" onclick='window.location.href="main.jsp"'>
							</tr>
							
							<tr><form action="userupdate.jsp">
							<input type="submit" value=" USER UPDATE " style="margin:20px;" >
							</form></tr>
							
							<tr><form action="userJoin.jsp">
							<input type="submit" value=" ADD MEMBER " style="margin:20px;">
							</form></tr>
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

