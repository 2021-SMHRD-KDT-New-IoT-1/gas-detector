<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.AdminMemberVO"%>
<%@page import="com.model.UserMemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="EUC-KR" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<style>
	
	</style>
	<body style="text-align: center; background:rgba(0,0,0,0.9)">
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<AdminMemberVO> adminall = dao.allAdmin();
	%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<ul class="actions vertical">
							<li><h5>회원정보 추가</h5></li>
								<form action="userJoinService" method="post">
									<li><input name="user_no" type="text" placeholder="회원 번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_name" type="text"    placeholder="회원이름을 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_tel" type="text"    placeholder="회원 전화번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_add" type="text"    placeholder="회원의 주소를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_mid" type="text"    placeholder="기기 번호을 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li>
									<select name="admin_no" style="width: 500px; margin: 0 auto; ">
										<%for(AdminMemberVO vo7 : adminall){%>
											<option style="color:black;"><%=vo7.getAdmin_no()%>/<%=vo7.getAdmin_name()%></option>
										<%}%>
									</select>
									</li>
									<li><input type="submit" value="Update" class="button fit" style="width: 500px; margin: 0 auto;"></li>
								</form>
						</ul>
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

