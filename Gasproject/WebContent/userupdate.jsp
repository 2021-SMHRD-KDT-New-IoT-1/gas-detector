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
	<body style="text-align: center;">
	<%
		AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
		
	%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<ul class="actions vertical">
							<li><h5>사용자정보수정</h5></li>
								<form action="userUpdateService" method="post">
								
									<li><input name="user_no" type="text" placeholder="수정할 회원의 회원번호를 입력해주세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_name" type="text" placeholder="이름을입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_tel" type="text"    placeholder="전화번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_add" type="text"    placeholder="주소를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_mid" type="text"    placeholder="기기번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li>
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

