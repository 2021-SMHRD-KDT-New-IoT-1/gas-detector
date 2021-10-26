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
	<body>
		<%
			//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
			AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
 
		%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<a href="index.html" class="logo"><strong>Gas</strong> <span>detector</span></a>
						<nav>
						<% if(vo2==null){%>
								<a href="#menu">로그인</a>
							<%}else{ %>
								<a href="selectMember.jsp">관리회원정보</a>
								<a href="update.jsp">개인정보수정</a>
								<a href="logoutService">로그아웃</a>
							<%} %>
						
							
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">	
						<ul class="links">
							<li><h5>로그인</h5></li>
								<form action="loginService" method="post">
									<li><input name = "admin_id" type="text" placeholder="ID을 입력하세요"></li>
									<li><input name = "admin_pw" type="password" placeholder="PW를 입력하세요"></li>
									<li><input type="submit" value="LogIn" class="button fit"></li>
								</form>
						</ul>
						<ul class="actions vertical">
							<li><h5>회원가입</h5></li>
								<form action="JoinService" method="post">
									<li><input name="admin_id" id="input_email" type="text" placeholder="ID을 입력하세요" >
										<input type="button" value="ID중복체크" onclick="emailCheck()"><br>
										<span id="sp_result"></span>						
									</li>
									<li><input name="admin_pw" type="password" placeholder="PW를 입력하세요" ></li>
									<li><input name="admin_name" type="text" placeholder="이름를 입력하세요" ></li>
									<li><input name="admin_tel" type="text" placeholder="전화번호를 입력하세요" ></li>
									<li><input name="admin_email" type="text" placeholder="Email을 입력하세요" ></li>
									<li><input type="submit" value="Join Us" class="button fit"></li>
								</form>
						</ul>
					</nav>			
				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								
								<%if(vo2==null){ %>
									<h1>로그인해 주세요.</h1>
								<%}else{%>
									<h1><%= vo2.getAdmin_id() %>님 환영합니다.</h1>
								<%} %>
																
							</header>
							<div class="content">
								<p>아래는 지금까지 배운 웹 기술들입니다.<br></p> <!-- 들어간 문구 생각하기 -->
								
							<section class="split">
								<section>
									<div class="contact-method">
										<span class="icon alt fa-envelope"></span>
										<h3>Email</h3>
											<%if(vo2==null){ %>
												<a href="#"></a>
											<%}else{ %>
												<a href="#"><%=vo2.getAdmin_email() %></a>
											<%} %>
											<!-- 로그인 한 사용자의 이메일을 출력하시오 -->
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
											
											<!-- 로그인 한 사용자의 전화번호를 출력하시오 -->							
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
											
											<!-- 로그인 한 사용자의 집주소를 출력하시오 -->
									</div>
								</section>
							</section>					
						</div>
					</section>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
								<li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
							</ul>
							<ul class="copyright">
								<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
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
				//요소의 실제 값을 가지고 오는 방법
				//1. innerText : 시작태그와 끝태그 사이의 텍스트를 가지고 오는 방법
				// 1 예시 ) <p>스마트</p> -> 스마트
				//2. innerHTML : 시작태그와 끝태그 사이의 모든 요소를 가지고 오는 방법
				// 2 예시 ) <p><span>스마트</span></p> -> <span>스마트</span>
				//3. value : input 태그의 value 속성값을 가지고 올 때
				var input = document.getElementById("input_email");
				/* alert(input.value);
				$('#input_email').val(); */
				
				//ajax
				$.ajax({
					type : "post", //데이터 전송 요청 방식
					data : {"email" : input.value}, //전송하는 데이터
					url : "emailCheckService", //데이터를 전송, 요청하는 서버 페이지
					dataType : "text", //응답데이터의 형식
					success : function(data){ //통신 성공
						var sp_result = document.getElementById("sp_result");
						/* alert(data) */
						if(data=="true"){
							sp_result.innerText = "중복되어 사용 불가한 아이디입니다.";
						}else{
							$("#sp_result").text("사용 가능한 아이디입니다.");
						}
					},
					error : function(){ //통신 실패
						alert("통신 실패")
					}
				});
			}
			
			</script>
			

	</body>
</html>

















