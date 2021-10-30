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
		<meta http-equiv="refresh"; content='15'; content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
		
	</style>
	<body style="text-align: center; background : radial-gradient(rgba(0, 0, 0, 0.8),rgba(0, 0, 0, 0.8)), url(images/색상.png);">
		<%
			String user_no = (String)session.getAttribute("user_no");
			MemberDAO dao = new MemberDAO();
			ArrayList<GasVO> gasall = dao.gascheck(user_no);
			
		%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<table>
							
							<caption><h2>가스 현황 확인 페이지</h2></caption>
						
							<tr>
								<td>관리번호</td>
								<td>관리자번호</td>
								<td>사용자번호</td>
								<td>기기번호</td>
								<td>가스농도</td>		
								<td>측정시간</td>		
								<td>신고확인</td>			
							</tr>
							
														
						
						<% for(GasVO vo3 : gasall){
							
						%>
																				
                         <tr>
                          <td><%=vo3.getManager_no() %></td>
                          <td><%=vo3.getAdmin_no() %></td>
                          <td><%=vo3.getUser_no() %></td> 
                          <td><%=vo3.getUser_mid() %></td> 
                          <td><%=vo3.getGas_level() %></td> 
                          <td><%=vo3.getDec_time() %></td> 
                          <td><a href="noticeCompelete.jsp" class='delete' id="notice" onclick="notice()">신고</a></td>
                         </tr>
                        <%}%> 
                     
                     
							
						</table>
												
						<table>		
						<tr>
						<input type="button" value=" BACK " style="margin:20px;" onclick='window.location.href="myMember.jsp"'>
						</tr>
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
			
			<script type="text/javascript">
				function notice(){
					/* document.getElementById("notice") */
					confirm("신고 완료 하셨습니까?");
				}
				
				
			
			</script>
			
	</body>
</html>

