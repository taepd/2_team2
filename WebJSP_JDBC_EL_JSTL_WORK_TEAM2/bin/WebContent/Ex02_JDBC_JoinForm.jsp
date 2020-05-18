<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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





<title>Join</title>
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

.bottom{
	text-align: center; 
	background-color: #343a40;
	border-top: #ffffff 2px solid;
	color: white;	
}

#join {
	display:flex;

}

.nav a {
	color:white;
	text-decoration: none;
	 
}

.nav a:hover{
	color: gray;
}

.form-group{
text-align: left;
color: white;
}


/* *{ */
/*    border: 1px solid black;  */
/*  }  */


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
 //jquery 로 간단하게 유효성 check 하기
 $(function() {
  	$('#joinForm').submit(function() {
	   //alert("가입");
	if ($('#id').val() == "") { // 아이디 검사
    	alert('ID를 입력해 주세요.');
    	$('#id').focus();
    return false;
   } else if ($('#pwd').val() == "") { // 비밀번호 검사
    alert('PWD를 입력해 주세요.');
    $('#pwd').focus();
    return false;
   }else if ($('#mname').val() == "") { // 이름 검사
    alert('mname를 입력해 주세요.');
    $('#mname').focus();
    return false;
   }else if ($('#age').val() == "") { // 나이 검사
    alert('age를 입력해 주세요.');
    $('#age').focus();
    return false;
   }else if ($('#email').val() == "") { // 우편번호
    alert('email를 입력해 주세요.');
    $('#email').focus();
    return false;
   }
   
  });
 });
</script>
<!--  
CREATE TABLE koreaMember
(
    id VARCHAR2(50) PRIMARY KEY ,
    pwd VARCHAR2(50) NOT NULL,
    NAME VARCHAR2(50) NOT NULL,
    age NUMBER ,
    gender CHAR(4),
    email VARCHAR2(50),
    ip   VARCHAR2(50)
)
-->

</head>







<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">


	<div class="container">
		<section>
			<div class="top">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</div>
		</section>





				<div id="join">
				<div class="col-4" style="background-color: #343a40;" id="left">
					<jsp:include page="/common/Left.jsp"></jsp:include>
				</div>
				
				
				<div class="col-8" style="text-align:center; padding: 20px; margin:0px;">
				
						<div class="jumbotron" style="background-color: #343a40;">
						
					<!-- JOIN PAGE CONTENT  -->
			<form action="Ex02_JDBC_JoinOK.jsp" method="post" name="joinForm" id="joinForm">
					<h3 style="text-align: center; color: white;">Join<img src="images/feather.svg"></h3>
					
					<hr class="my-4">
					
					<div class="form-group">
					
								<label for="id">Id</label> <input type="text" name="id" id="id" class="form-control" placeholder="아이디 입력">
							</div>

							<div class="form-group">
								<label for="pwd">패스워드</label> <input type="password" name="pwd" id="pwd" class="form-control" placeholder="패스워드 입력">
							</div>

							<div class="form-group">
								<label for="mname">이름</label> <input type="text" name="mname" id="mname" class="form-control" placeholder="실명 입력">
							</div>

							<div class="form-group">
								<label for="age">나이</label> <input type="text" name="age" id="age" maxlength="3"
									class="form-control" placeholder="나이 입력">
							</div>
						
							<div class="form-group">
								<label for="gender">성별&nbsp;&nbsp;&nbsp;</label> <input
									type="radio" id="gender" name="gender" value="여" checked>여&nbsp;&nbsp;
								<input type="radio" id="gender" name="gender" value="남">남
							</div>


							<div class="form-group">
								<label for="email">Email</label> <input type="text" name="email" id="email"
									class="form-control" placeholder="이메일 입력">
							</div>

				<button type="submit" class="btn btn-primary" disabeld>
										회원가입</button>
				<button type="reset" class="btn btn-primary" disabeld>
										취소</button>
							

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