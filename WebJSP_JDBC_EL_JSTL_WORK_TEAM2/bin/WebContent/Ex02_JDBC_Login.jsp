<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS 추가 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- pure CSS 추가 -->


<link rel="stylesheet" href="css/mycss.css">
<link rel="stylesheet" href="css/style.css">




<title>Login</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}

body {
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






			<div class="col-8"
				style="text-align: center; padding: 20px; margin: 0px;">
				<div class="jumbotron" style="background-color: #343a40;">

					<!-- LOGIN PAGE CONTENT  -->
					<form action="Ex02_JDBC_loginok.jsp" method="post" name="loginForm"
					id="joinForm">
					
					<h3 style="text-align: center; color: white;">Login<img src="images/feather.svg"></h3>
					
					<hr class="my-4">

					<div>
						
							<div class="form-group">
							<label for="id">Id</label> <input type="text" name="id"
								id="id" class="form-control" placeholder="아이디">
						</div>

						<div class="form-group">
							<label for="pwd">Password</label> <input type="password"
								name="pwd" id="pwd" class="form-control"
								placeholder="비밀번호">
						</div>
					<button type="submit" class="btn btn-primary" disabeld>
										로그인</button>
					
					

					</div>
				</form>


						




				</div>
			</div>
		</div>
	
	
	
		<section>
			<div class="bottom">
			
				<jsp:include page="/common/Bottom.jsp"></jsp:include>
			</div>
		</section>
	
	
	</div>










<!-- 
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>

 -->
	
















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