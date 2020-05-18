<%@page import="kr.or.bit.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.userid || sessionScope.userid != 'admin' }">
		<script>location.href='Ex02_JDBC_Login.jsp'</script>
	</c:if>
<%
	
    
	request.setCharacterEncoding("UTF-8");

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



<title>Member Search</title>
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
			
			
			
			 <!--  데이터 받아서 UI 구성 -->
			 <%
			 	String name=request.getParameter("search");	
			 
			 	Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			    
				//where ename like '%길동%'
				conn = Singleton_Helper.getConnection("oracle");
				String sql="select count(*) from koreamember where name like ?";
				String sql2 ="select id, name, email from koreamember where name like '%"+name+"%'";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%'+name+'%');
				rs= pstmt.executeQuery();
				int rowcount=0;
				if(rs.next()){
					rowcount = rs.getInt(1); //조회건수
				}
			 %>
			 <div class="col-8"
				style="text-align: center; padding: 20px; margin: 0px;">
				<div class="jumbotron" style="background-color: white;">
				
				
			 
				<table class="table table-hover" style="margin-left: auto;margin-right: auto">
							<tr class="table-secondary"><th colspan="4">회원리스트</th></tr>
							<%
								if(rowcount > 0){
									pstmt = conn.prepareStatement(sql2); 
									rs = pstmt.executeQuery();
									while(rs.next()){
										String id = rs.getString(1);
										String mname = rs.getString(2);
										String email = rs.getString(3);
							%>
									 <tr style="color: gray">
									 	<td><%=id%></td>
									 	<td><%=mname%></td>
									 	<td><%=email %></td>
									 </tr>
							<%			
									} //end while
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과" + rowcount + "건 조회</b>");
									out.print("</td></tr>");	
								}else{ //조회된 건수가 없는 경우
									out.print("<tr><td colspan='3'>");
									out.print("<b>[" + name + "] 조회결과가 없습니다</b>");
									out.print("</td></tr>");	
								}
							%>
				</table>
				
				
				<button class="btn btn-light" disabeld><a href='Ex03_Memberlist.jsp'>리스트이동</a></button>
			<%
				Singleton_Helper.close(rs);
				Singleton_Helper.close(pstmt);
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