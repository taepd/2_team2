<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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





<title>Main</title>

<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	background-color: white;
	color: black;
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

#main {
	display: flex;
}

.nav a {
	color: white;
	text-decoration: none;
}

.nav a:hover {
	color: gray;
}

/* *{ */
/*    border: 1px solid black;  */
/*  }  */
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





		<div id="main">
			<div class="col-4" style="background-color: #343a40;" id="left">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</div>


			<div class="col-8"
				style="text-align: center; padding: 200px; margin: 0px;">

				<div>

					<!-- MAIN PAGE CONTENT  -->
					<c:set var="id" value="${sessionScope.userid}"></c:set>
					<c:choose>
						<c:when test="${not empty id}">
						${id}회원님 안녕하세요^^<br>

							<c:if test="${id =='admin'}">
							<button class="btn btn-light" disabeld><a href="Ex03_Memberlist.jsp">회원관리</a></button>
							</c:if>

						</c:when>
						<c:otherwise>
						사이트 방문을 환영합니다! <br> 처음오신분께서는 회원가입하고 이용해주세요 ^^
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<section>
			<div class="bottom">
				<jsp:include page="/common/Bottom.jsp"></jsp:include>
			</div>
		</section>




	</div>






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


