<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.AdminMemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="EUC-KR" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
		#Update > ul.actions {
			margin-top:10%;
		}
	</style>
	<body style="text-align: center; background : radial-gradient(rgba(0, 0, 0, 0.8),rgba(0, 0, 0, 0.8)), url(images/����.png);">
		<%
			String admin_id = (String)request.getAttribute("admin_id");
			MemberDAO dao = new MemberDAO();
			AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
			String user_mid = dao.gasOneUser();
		
		%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<ul class="actions vertical">
							<li><h1>�����մϴ�!</h1></li>
							<li>�Ű� �Ϸ�Ǿ����ϴ�.</li>
							<li><a href="main.jsp">����������</a></li>
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
			<script>
			<% if(vo2!=null){ %>
			function gascheck() {	
				setInterval(() => {
					$.ajax({
						type : "get",
						/* data : {"email" : input.value}, //�����ϴ� ������ */
						url : "oneSelectGas", //�����͸� ����, ��û�ϴ� ���� ������
						dataType : "text", //���䵥������ ����
						success : function(data){ //��� ����
							/* alert(data) */
							
							if(data=="0"){
								let check = confirm("<%=user_mid%>" + "���� ��⿡�� ���ذ����� �󵵰� ����Ǿ����ϴ�!!");
								if(check){
									window.location.href = "myMember.jsp";
								}
								// =============
								
							}
						},
						error : function(){ //��� ����
							
						}
					});
					
					//=======
					$.ajax({
						type : "get", //������ ���� ��û ���
						/* data : {"email" : input.value}, //�����ϴ� ������ */
						url : "transeService", //�����͸� ����, ��û�ϴ� ���� ������
						dataType : "text", //���䵥������ ����
						data : {'data' : '��� ����'},
						success : function(data){ //��� ����
							console.log(data)
						},
						error : function(){ //��� ����
							
						}
					});
					
					
				}, 1000);
				
			}
			gascheck();
			<% } %>
			</script>
	</body>
</html>

