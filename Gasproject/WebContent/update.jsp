<%@page import="com.model.localVO"%>
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
	<body style="text-align: center; background : radial-gradient(rgba(0, 0, 0, 0.8),rgba(0, 0, 0, 0.8)), url(images/색상.png);">
	<%
		AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
		MemberDAO dao = new MemberDAO();
		ArrayList<localVO> locall = dao.localList();
		
		String user_mid = dao.gasOneUser();
	%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<ul class="actions vertical">
							<li><h4>관리자 정보수정</h4></li>
								<form action="updateService" method="post" >
									<% if(vo2==null){ %>
										<li>로그인을해 주세요.</li>
									<%}else{ %>
										<li><h5>접속한 ID : <%=vo2.getAdmin_id() %></h5></li>
									<%} %>
									<li><input name="admin_pw" type="password" placeholder="PW를 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="admin_name" type="text"    placeholder="이름을 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="admin_tel" type="text"    placeholder="전화번호를 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="admin_email" type="text"    placeholder="이메일을 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="admin_job" type="text"    placeholder="소속을 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li>
								 	<select name="loc_no" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;">
										<%for(localVO vo4 : locall){%>
											<option name="loc" style="color : black; font-family: GmarketSansMedium;"><%=vo4.getLoc_name()%>/<%=vo4.getLoc_no()%></option>
										<%}%>
									</select>
								   </li> 
									<!-- <li><input name="user_no" type="text"    placeholder="관리 사용자 번호를 입력하세요" style="width: 500px; margin: 0 auto;"></li> -->
									<li>
									<input type="submit" value="Update" class="button fit" style="width: 250px; margin: 10px;font-family: GmarketSansMedium;">
									<input type="button" value="HOME" style="font-family: GmarketSansMedium;" onclick='window.location.href="main.jsp"'>
									</li>
									
									
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
			<script>
			<% if(vo2!=null){ %>
			function gascheck() {	
				setInterval(() => {
					$.ajax({
						type : "get",
						/* data : {"email" : input.value}, //전송하는 데이터 */
						url : "oneSelectGas", //데이터를 전송, 요청하는 서버 페이지
						dataType : "text", //응답데이터의 형식
						success : function(data){ //통신 성공
							/* alert(data) */
							
							if(data=="0"){
								let check = confirm("<%=user_mid%>" + "번의 기기에서 유해가스의 농도가 노출되었습니다!!");
								if(check){
									window.location.href = "myMember.jsp";
								}
								// =============
								
							}
						},
						error : function(){ //통신 실패
							
						}
					});
					
					//=======
					$.ajax({
						type : "get", //데이터 전송 요청 방식
						/* data : {"email" : input.value}, //전송하는 데이터 */
						url : "transeService", //데이터를 전송, 요청하는 서버 페이지
						dataType : "text", //응답데이터의 형식
						data : {'data' : '통신 성공'},
						success : function(data){ //통신 성공
							console.log(data)
						},
						error : function(){ //통신 실패
							
						}
					});
					
					
				}, 1000);
				
			}
			gascheck();
			<% } %>
			
			</script>
	</body>
</html>

