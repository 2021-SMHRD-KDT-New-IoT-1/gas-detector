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
		MemberDAO dao = new MemberDAO();
		ArrayList<AdminMemberVO> adminall = dao.allAdmin();
		AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
		String user_mid = dao.gasOneUser();
	%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<ul class="actions vertical">
							<li><h3>회원정보 추가</h3></li>
								<form action="userJoinService" method="post">
									<li><input name="user_no" type="text" placeholder="회원 번호를 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="user_name" type="text"    placeholder="회원이름을 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="user_tel" type="text"    placeholder="회원 전화번호를 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="user_add" type="text"    placeholder="회원의 주소를 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li><input name="user_mid" type="text"    placeholder="기기 번호을 입력하세요" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;"></li>
									<li>
									<select name="admin_no" style="width: 500px; margin: 0 auto; font-family: GmarketSansMedium;">
										<%for(AdminMemberVO vo7 : adminall){%>
											<option style="color:black; font-family: GmarketSansMedium;"><%=vo7.getAdmin_no()%>/<%=vo7.getAdmin_name()%></option>
										<%}%>
									</select>
									</li>
									
									<table>
									
										<tr>
										<input type="submit" value="Update" class="button fit" style="width: 300px; margin: 0 auto;font-family: GmarketSansMedium;">
										</tr>
										
										<tr>
										<input type="button" value=" BACK " style="margin:20px;font-family: GmarketSansMedium;" onclick='window.location.href="selectMember.jsp"'>
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
							alert("통신 실패")
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
							alert("통신 실패")
						}
					});
					
					
				}, 3000);
				
			}
			gascheck();
			<% } %>
				
			</script>
			
			
	</body>
</html>

