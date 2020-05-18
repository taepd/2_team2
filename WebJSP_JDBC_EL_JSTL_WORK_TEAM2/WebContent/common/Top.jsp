<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<nav class="navbar navbar-expand-lg bg-dark navbar-dark"
	style="border-bottom: #ffffff 2px solid;">
	<div class="container">
		<a class="navbar-brand" href="Ex02_JDBC_Main.jsp">2벤조스<span>.Bit</span></a>


		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navCollapse">
			<ul class="navbar-nav ml-auto" id="myUl">
				<li class="nav-item"><a href="Ex02_JDBC_Main.jsp"
					class="nav-link">Main</a></li>
				<li class="nav-item"><a href="Ex02_JDBC_Login.jsp"
					class="nav-link">Login</a></li>
				<li class="nav-item"><a href="Ex02_JDBC_JoinForm.jsp"
					class="nav-link">Join</a></li>
			</ul>
		</div>
	</div>
</nav>


<section style="background-color: #343a40">
<div class="container" style="margin: 0px; text-align: right; background-color: white;">
	<div class="row">




		<div class="col-12" style="background-color: #343a40; text-align: right;">
			<%
				if (session.getAttribute("userid") != null) {
					out.print("<b>[ " + session.getAttribute("userid") + " ]</b> 로그인 상태");
					out.print("<a href='Ex02_JDBC_Logout.jsp'>[ 로그아웃 ]</a>");
				} else {
					out.print("<b>[로그인 하지 않으셨네요]</b>");
					out.print("<a href='Ex02_JDBC_Login.jsp'>[ 로그인 ]</a>");
				}
			%>
		</div>
	</div>
</div>
</section>