<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.localVO"%>
<%@page import="com.model.AdminMemberVO"%>
<%@page import="com.model.UserMemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="EUC-KR" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<%
			//���� �α��� �������� Ȯ�� (vo == null > �α��� ���� ���� ����)
			AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
			MemberDAO dao = new MemberDAO();
			ArrayList<localVO> locall = dao.localList();
			
		    		
		%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> 
		<a href="main.jsp" class="logo"><strong>Gas</strong> <span>detector</span></a> 
		<nav>
		<% if(vo2==null){%> 
		<a href="#menu">�α���</a> 
		<%}else{ %> 
		
		<a href="localList.jsp">�����������</a> 
		<a href="selectMember.jsp">����ȸ�����</a>
		<a href="update.jsp">������������</a>
		<a href="logoutService">�α׾ƿ�</a> 
		
		<%} %>


		</nav> 
		</header>

		<!-- Menu -->
		<nav id="menu">
		<ul class="links">
			<li><h5>�α���</h5></li>
			<form action="loginService" method="post">
				<li><input name="admin_id" type="text" placeholder="ID�� �Է��ϼ���"></li>
				<li><input name="admin_pw" type="password"
					placeholder="PW�� �Է��ϼ���"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>ȸ������</h5></li>
			<form action="JoinService" method="post">
				<li><input name="admin_id" id="input_email" type="text"
					placeholder="ID�� �Է��ϼ���"> <input type="button"
					value="ID�ߺ�üũ" onclick="emailCheck()"><br> <span
					id="sp_result"></span></li>
				<li><input name="admin_pw" type="password"
					placeholder="PW�� �Է��ϼ���"></li>
				<li><input name="admin_name" type="text"
					placeholder="�̸��� �Է��ϼ���"></li>
				<li><input name="admin_tel" type="text"
					placeholder="��ȭ��ȣ�� �Է��ϼ���"></li>
				<li><input name="admin_email" type="text"
					placeholder="Email�� �Է��ϼ���"></li>
				<li><input name="admin_job" type="text" placeholder="�Ҽ��� �Է��ϼ���"></li>
				<!--  <li><input name="loc_no" type="text" placeholder="���� ������ȣ�� �Է��ϼ���" ></li>  -->
				<li><select name="loc_no">
						<%for(localVO vo4 : locall){%>
						<option name="loc"><%=vo4.getLoc_name()%>/<%=vo4.getLoc_no()%></option>
						<%}%>
				</select></li>
				<li><select name="user_no">
						<%for(localVO vo4 : locall){%>
						<option name="loc"><%=vo4.getLoc_name()%>/<%=vo4.getLoc_no()%></option>
						<%}%>
				</select></li>
				<li><input type="submit" value="Join Us" class="button fit"></li>
			</form>
		</ul>
		</nav>
		<!-- Banner -->
		<br>
		<br>
		<br>
		<section id="banner" class="major">

		<div class="inner">
			<header class="major"> <%if(vo2==null){ %>
			<h1>�α����� �ּ���.</h1>
			<%}else{%>
			<h2>
				������,
				<%= vo2.getAdmin_id() %>�� ȯ���մϴ�.
				<br>
			<%= vo2.getAdmin_id() %>���� �����ϰ� �ִ� ������
<%out.print(dao.localName(vo2.getLoc_no()));%>�Դϴ�.
			</h2>
			<%}%> 
			</header>
			
			<div>
			<p>���� ����� ���� �������κ��� ����� ���ѵ帳�ϴ�.</p>
			</div>	 
				
				<br><br>
				 
    <div class="content">
				<section class="split"> 
				<div class="contact-method">
					<span class="icon alt fa-envelope"> </span>
					<h3>Email</h3>
					<%if(vo2==null){ %>
					<a href="#"></a>
					<%}else{ %>
					<a href="#"><%=vo2.getAdmin_email() %></a>
					<%} %>

				</div>
				</section> 
				<section>
				<div class="contact-method">
					<span class="icon alt fa-phone"></span>
					<h3>Phone</h3>
					<%if(vo2==null){ %>
					<span></span>
					<%}else{ %>
					<span><%=vo2.getAdmin_tel() %></span>
					<%} %>


				</div>
				</section> 
				<section>
				<div class="contact-method">
					<span class="icon alt fa-home"></span>
					<h3>JOB</h3>
					<%if(vo2==null){ %>
					<span></span>
					<%}else{ %>
					<span><%=vo2.getAdmin_job() %></span>
					<%} %>

				</div>
				</section> 
				
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">LIGHT HOOK</a></li>
			</ul>
		</div>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

	<script>
			function emailCheck() {
				//����� ���� ���� ������ ���� ���
				//1. innerText : �����±׿� ���±� ������ �ؽ�Ʈ�� ������ ���� ���
				// 1 ���� ) <p>����Ʈ</p> -> ����Ʈ
				//2. innerHTML : �����±׿� ���±� ������ ��� ��Ҹ� ������ ���� ���
				// 2 ���� ) <p><span>����Ʈ</span></p> -> <span>����Ʈ</span>
				//3. value : input �±��� value �Ӽ����� ������ �� ��
				var input = document.getElementById("input_email");
				/* alert(input.value);
				$('#input_email').val(); */
				
				//ajax
				$.ajax({
					type : "post", //������ ���� ��û ���
					data : {"email" : input.value}, //�����ϴ� ������
					url : "emailCheckService", //�����͸� ����, ��û�ϴ� ���� ������
					dataType : "text", //���䵥������ ����
					success : function(data){ //��� ����
						var sp_result = document.getElementById("sp_result");
						/* alert(data) */
						if(data=="true"){
							sp_result.innerText = "�ߺ��Ǿ� ��� �Ұ��� ���̵��Դϴ�.";
						}else{
							$("#sp_result").text("��� ������ ���̵��Դϴ�.");
						}
					},
					error : function(){ //��� ����
						alert("��� ����")
					}
				});
			}
			
			</script>


</body>
</html>

















