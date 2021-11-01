<%@page import="com.model.AdminMemberVO"%>
<%@page import="com.model.UserMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style=" margin-left: 200px; margin-right: 200px;">
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
		
	</style>
	<body style="text-align: center; background : radial-gradient(rgba(0, 0, 0, 0.8),rgba(0, 0, 0, 0.8)), url(images/색상.png);">
		<%
			MemberDAO dao = new MemberDAO();
			AdminMemberVO vo2 = (AdminMemberVO)session.getAttribute("member");
		 	ArrayList<UserMemberVO> myMember = dao.myMember(vo2.getAdmin_no());
		 	
			String user_mid = dao.gasOneUser();
			
		%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update" style="font-family: GmarketSansMedium;">	
						<table>
							
							<caption><h2>MY 사용자 확인 페이지</h2></caption>
						
							<tr>
								<td>회원번호</td>
								<td>이름</td>
								<td>연락처</td>
								<td>주소</td>
								<td>기기번호</td>
								<td>관리자번호</td>
								<td>CO</td>	
								<td></td>
														
							</tr>
							
						<%
						for(UserMemberVO vo : myMember){
													%>
                         <tr>
                          <td><%=vo.getUser_no() %></td>
                          <td><%=vo.getUser_name() %></td>
                          <td><%=vo.getUser_tel() %></td> 
                          <td><%=vo.getUser_add() %></td> 
                          <td><%=vo.getUser_mid() %></td> 
                          <td><%=vo.getAdmin_no() %></td> 
                          <td><a href= "GasCheckService?user_no=<%=vo.getUser_no() %>">현황 확인</a></td>
                        <%}%>
                        
                        </table>
                     <table>
							<tr>
							<input type="button" value=" HOME " style="margin:20px;font-family: GmarketSansMedium;" onclick='window.location.href="main.jsp"'>
							</tr>
							
							<!-- <tr><form action="userupdate.jsp">
							<input type="submit" value=" MY USER UPDATE " style="margin:20px;" >
							</form></tr>
							
							<tr><form action="userJoin.jsp">
							<input type="submit" value=" MY ADD MEMBER " style="margin:20px;"> 
							</form></tr> -->
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

