<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:if test="${empty sessionScope.userid || sessionScope.userid != 'admin' }">
		<script>location.href='Ex02_JDBC_Login.jsp'</script>
	</c:if>
<%
	/*  
	 1.관리자만 접근 가능한 페이지
	 2.로그인한 일반 회원이 주소값을 외워서 ... 해도 접근불가하게 하려면 
	 3.그러면  회원에 관련된 모든 페이지 상단에는 아래 코드를 넣어줘야함 ..... : sessionCheck.jsp >> include 
	*/
	 
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



<title>Member List</title>
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

			<!--  
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->	
			
			
			
			
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try{
						conn = Singleton_Helper.getConnection("oracle");
						String sql="select id, ip from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery(); 
				%>	
				
				
				<div class="col-8"
				style="text-align: center; padding: 20px; margin: 0px;">
				<div class="jumbotron" style="background-color: white;">
				
				
				
					<table class="table table-hover" style="margin-left: auto;margin-right: auto">
							<tr class="table-secondary"><th colspan="4">회원리스트</th></tr>
						
						<!-- 두건있으니까 와일문이 두건돌아감 -->
						<% while(rs.next()){ %>
							<tr>
								<td>
										<a href='Ex03_MemberDetail.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("id")%></a>
								</td>
								<td><%=rs.getString("ip")%></td>
								<td>
									<a href="Ex03_MemberDelete.jsp?id=<%=rs.getString("id")%>">[삭제]</a>
								</td>
								<td>
									<a href="Ex03_MemberEdit.jsp?id=<%=rs.getString("id")%>">[수정]</a>
								</td>
							</tr> 
						<% } %>
					</table>
					
					
					<hr>
						<form action="Ex03_MemberSearch.jsp" method="post">
							회원명:<input type="text" name="search">
							<button type="submit" class="btn btn-primary" disabeld>
										이름 검색하기</button>
						</form>
					<hr>					
				<%	
					}catch(Exception e){
						
					}finally{
						Singleton_Helper.close(rs);
						Singleton_Helper.close(pstmt);
					}
				%>
			
		
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
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>		
</body>
</html>