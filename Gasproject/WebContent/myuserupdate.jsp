<%@page import="com.model.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
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
	<body style="text-align: center; background:rgba(0,0,0,0.9);">
	<%
		AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
		MemberDAO dao = new MemberDAO();
		ArrayList<UserMemberVO> myMember = dao.myMember(vo2.getAdmin_no());
		ArrayList<AdminMemberVO> adminall = dao.allAdmin();
	%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<ul class="actions vertical">
							<li><h5>�������������</h5></li>
								<form action="myuserUpdateService" method="post">
									<li>
										<select name="user_no" style="width: 500px; margin: 0 auto;">
										<%for(UserMemberVO vo5 : myMember){%>
											<option style="color:black;"><%=vo5.getUser_name()%>/<%=vo5.getUser_no()%></option>
										<%}%>
									</select>
									</li>
									
									<li><input name="user_name" type="text" placeholder="�̸����Է��ϼ���" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_tel" type="text"    placeholder="��ȭ��ȣ�� �Է��ϼ���" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_add" type="text"    placeholder="�ּҸ� �Է��ϼ���" style="width: 500px; margin: 0 auto;"></li>
									<li><input name="user_mid" type="text"    placeholder="����ȣ�� �Է��ϼ���" style="width: 500px; margin: 0 auto;"></li>
									<li>
									<select name="admin_no" style="width: 500px; margin: 0 auto; ">
										<%for(AdminMemberVO vo6 : adminall){%>
											<option style="color:black;"><%=vo6.getAdmin_no()%>/<%=vo6.getAdmin_name()%></option>
										<%}%>
									</li>
									<table>
									
										<tr>
										<input type="submit" value="UPDATE" class="button fit" style="width: 300px; margin: 0 auto;">
										</tr>
										
										<tr>
										<input type="button" value=" BACK " style="margin:20px;" onclick='window.location.href="myMember.jsp"'>
										</tr>
									</table>
									
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
