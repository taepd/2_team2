<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:if test="${empty sessionScope.userid || sessionScope.userid != 'admin' }">
		<script>location.href='Ex02_JDBC_Login.jsp'</script>
	</c:if>



<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	      <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
	      수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
	      수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
	
	*/
    request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		conn = Singleton_Helper.getConnection("oracle");
		String sql="select id,pwd,name,age,trim(gender),email from koreamember where id=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		rs = pstmt.executeQuery(); 
		
		//while(rs.next())
		rs.next(); //1건 데이터가 있다면 전제조건
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS 추가 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- pure CSS 추가 -->


<link rel="stylesheet" href="css/mycss.css">
<link rel="stylesheet" href="css/style.css">




<title>Member Edit</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

tr {
	background-color: white;
	color: black;
}

td {
}

body{

background-color: white;

}


.bottom {
	text-align: center;
	background-color: #343a40;
	border-top: #ffffff 2px solid;
	color: white;
}

#left {
	display: flex;
}

.nav a {
	color: white;
	text-decoration: none;
}

.nav a:hover {
	color: gray;
}

/* * { */
/* 	border: 1px solid black; */
/* } */

.form-group{
text-align: left;
color: white;
}





a:hover{
color: white;

}
</style>
</head>



<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">


	<div class="container">
		<section>
			<div class="top">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</div>
		</section>



		<div id="left">
			<div class="col-4" style="background-color: #343a40;" id="left">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</div>
			
		<div class="col-8"
				style="text-align: center; padding: 20px; margin: 0px;">
				<div class="jumbotron" style="background-color: white;">
				
				
				
				<form action="Ex03_MemberEditok.jsp" method="post">

					<h3 style="text-align: center; color: #343a40;">Edit&nbsp;<img src="images/feather.svg"></h3>
					
					<hr class="my-4">
					<div>
						<table class="table table-hover"
							style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
							<tr>
								<td>아이디</td>
								<td>
								  	<input type="text" name="id" value="<%=rs.getString(1)%>" readonly>
								</td>
							</tr>
							<tr>
								<td>비번</td>
								<td><%= rs.getString(2) %></td>							</tr>
							<tr>
								<td>이름</td>
								<td>
									<input type="text" name="name" value="<%=rs.getString(3)%>" style="background-color: #dadada">
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td>
									<input type="text" name="age" value="<%=rs.getString(4)%>" style="background-color: #dadada">
								</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
									[<%=rs.getString(5) %>]
									<input type="radio" name="gender" id="gender" value="여" 
									<%if (rs.getString(5).equals("여")){ %>checked<%}%>>여자
									<input type="radio" name="gender" id="gender" value="남"
									<%if (rs.getString(5).equals("남")){ %>checked<%}%>>남자
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="email" value="<%=rs.getString(6)%>" style="background-color: #dadada">
								</td>
							</tr>
							<tr>
							
							
							
								
						</table>


<button type="submit" class="btn btn-primary" disabeld>
										수정하기</button>
										<button class="btn">
										<a href='Ex03_Memberlist.jsp'>리스트이동</a></button>
					</div>
				</form>
			</td>
		</tr>
		
		
		
		
		
		
		
		
		
		
		
		
		</div>
			</div>
		</div>
	<section>
			<div class="bottom">
			
				<jsp:include page="/common/Bottom.jsp"></jsp:include>
			</div>
		</section>
		
		</div>
		
	
	
	
<script src="https://kit.fontawesome.com/880ed703ab.js"
		crossorigin="anonymous"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>		
</body>
</html>

<%
	}catch(Exception e){
		
	}finally{
		Singleton_Helper.close(rs);
		Singleton_Helper.close(pstmt);
	}

%>
