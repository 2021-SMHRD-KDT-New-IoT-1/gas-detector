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
<link rel="stylesheet" href="assets/css/main.css" 
href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
</head>

<body>
	<%
			//현재 로그인 상태인지 확인 (vo == null > 로그인 하지 않은 상태)
			AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
			MemberDAO dao = new MemberDAO();
			ArrayList<localVO> locall = dao.localList();
			
		    		
		%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> 
		<a href="main.jsp" class="logo" style="font-family: GmarketSansMedium;"><strong>Gas</strong> <span>detector</span></a> 
		<nav>
		<% if(vo2==null){%> 
		<a href="#menu" style="font-family: GmarketSansMedium;">로그인</a> 
		<%}else{ %> 
		
		<a href="localList.jsp" style="font-family: GmarketSansMedium;">관리지역목록</a> 
		<a href="myMember.jsp" style="font-family: GmarketSansMedium;">관리사용자목록</a>
		<a href="selectMember.jsp" style="font-family: GmarketSansMedium;">전체사용자목록</a>
		<a href="update.jsp" style="font-family: GmarketSansMedium;">개인정보수정</a>
		<a href="logoutService" style="font-family: GmarketSansMedium;">로그아웃</a> 
		
		<%} %>


		</nav> 
		</header>

		<!-- Menu -->
		<nav id="menu" style="font-family: GmarketSansMedium;">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="loginService" method="post" >
				<li><input style="font-family: GmarketSansMedium;" name="admin_id" type="text" placeholder="ID을 입력하세요"></li>
				<li><input style="font-family: GmarketSansMedium;" name="admin_pw" type="password"
					placeholder="PW를 입력하세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
		<ul class="actions vertical">
			<li><h5>회원가입</h5></li>
			<form action="JoinService" method="post">
				<li><input style="font-family: GmarketSansMedium;" name="admin_id" id="input_email" type="text"
					placeholder="ID을 입력하세요"> <input type="button"
					value="ID중복체크" onclick="emailCheck()"><br> <span
					id="sp_result"></span></li>
				<li><input style="font-family: GmarketSansMedium;"name="admin_pw" type="password"
					placeholder="PW를 입력하세요"></li>
				<li><input style="font-family: GmarketSansMedium;"name="admin_name" type="text"
					placeholder="이름를 입력하세요"></li>
				<li><input style="font-family: GmarketSansMedium;"name="admin_tel" type="text"
					placeholder="전화번호를 입력하세요"></li>
				<li><input style="font-family: GmarketSansMedium;"name="admin_email" type="text"
					placeholder="Email을 입력하세요"></li>
				<li><input style="font-family: GmarketSansMedium;"name="admin_job" type="text" placeholder="소속을 입력하세요"></li>
				<!--  <li><input name="loc_no" type="text" placeholder="관리 지역번호를 입력하세요" ></li>  -->
				<li><select name="loc_no" style="font-family: GmarketSansMedium;">
						<%for(localVO vo4 : locall){%>
						<option name="loc" style="color:black;font-family: GmarketSansMedium;"><%=vo4.getLoc_name()%>/<%=vo4.getLoc_no()%></option>
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
			<header class="major" > <%if(vo2==null){ %>
			<h1 style="font-family: GmarketSansMedium;">관리자님, 로그인해 주세요.</h1>
			<%}else{%>
			<h2 style="font-family: GmarketSansMedium;">
				관리자,
				<%= vo2.getAdmin_id() %>님 환영합니다.
				<br>
			<%= vo2.getAdmin_id() %>님이 관리하고 있는 지역은
<%out.print(dao.localName(vo2.getLoc_no()));%>입니다.
			</h2>
			<%}%> 
			</header>
			
			<div >
			<p style="font-family: InkLipquid; font-size: 65px"><i class="fa fa-quote-left" aria-hidden="true"></i>   
			  가스 유출로 인한 위험으로부터 당신을 지켜드립니다. 
			<i class="fa fa-quote-right" aria-hidden="true"></i></p>
			</div>	 
				
				<br><br> 
				 
    <div class="content" style="margin-left:-70px;">
				<section class="split"> 
				<div class="contact-method" style="font-family: GmarketSansMedium;">
					<h3 style="font-family: GmarketSansMedium;"><i class="fa fa-envelope-o" aria-hidden="true"></i> Email</h3>
					<%if(vo2==null){ %>
					<a href="#"></a>
					<%}else{ %>
					<a href="#"><%=vo2.getAdmin_email() %></a>
					<%} %>

				</div>
				</section> 
				<section>
				<div class="contact-method" style="font-family: GmarketSansMedium;">
					<h3 style="font-family: GmarketSansMedium;"><i class="fa fa-phone" aria-hidden="true"></i> Phone</h3>
					<%if(vo2==null){ %>
					<span></span>
					<%}else{ %>
					<span ><%=vo2.getAdmin_tel() %></span>
					<%} %>


				</div>
				</section> 
				<section>
				<div class="contact-method" style="font-family: GmarketSansMedium;">
					<h3 style="font-family: GmarketSansMedium;"><i class="fa fa-building-o" aria-hidden="true"></i> JOB</h3>
					
					<%if(vo2==null){ %>
					<span></span>
					<%}else{ %>
					<span ><%=vo2.getAdmin_job() %></span>
					<%} %>

				</div>
				</section> 
				
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner" style="font-family: GmarketSansMedium;">
			<ul class="icons" >
				<li ><a href="#" ><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
				<li><a href="#" ><i class="fa fa-facebook-official" aria-hidden="true"></i> Facebook</a></li>
				<li><a href="#" ><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a></li>
				<li><a href="#" ><i class="fa fa-github-alt" aria-hidden="true"></i> GitHub</a></li>
				<li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i> LinkedIn</a></li>
			</ul>
			<ul class="copyright" style="font-family: GmarketSansMedium;">
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

















