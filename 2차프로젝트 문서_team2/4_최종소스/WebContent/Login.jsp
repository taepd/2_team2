<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/css.jsp"%>
<html>
<head>
</head>
<body class="body-wrapper">
	<div class="auth-wrapper d-flex no-block justify-content-center align-items-center">
		
			<div id="loginform" style = " margin-top:200px;">
				<div class="text-center p-t-20 p-b-20">
					<span class="db"><img src="imgs/bit02.png" style="width:150px; margin-bottom:20px;" alt="logo"></span>
				</div>
				<!-- Form -->
				<form action="Login.bit">
					<div class="form-group" id="logininput">
						<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="id">
					  </div>
					  <div class="form-group">
						<input type="password" class="form-control" placeholder="비밀 번호를 입력해 주세요" name="pwd">
					  </div>
					<div class="border-secondary" >
							<div class="form-group">
									<button class="btn float-right" style=" background-color: #aa00d6;" id="loginbt" type="submit">Login</button>
							</div>
					</div>
					<div id="" >
						<p>아직 비트 마켓의 회원이 아니신가요?&nbsp;&nbsp;<a href="BitJoin.bit"><strong style="color: #aa00d6;">회원가입 하러가기</strong></a></p>
					</div>
				</form>
			</div>
	</div>
</body>
</html>
