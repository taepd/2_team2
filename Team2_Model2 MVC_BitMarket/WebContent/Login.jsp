<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/css.jsp"%>

<body class="bg-dark">
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="images/logo.png" alt="">
					</a>
				</div>
				<div class="login-form">
					
					<form id="loginform" action="Login.bit">
						<div class="form-group">

							<input type="text" name="id" class="form-control" placeholder="ID를 입력해주세요">
						</div>
						<div class="form-group">

							<input type="password" name ="pwd" class="form-control"
								placeholder="Password 를 입력해주세요">
						</div>

						<button type="submit"
							class="btn btn-success btn-flat m-b-30 m-t-30">Login</button>

						<div class="register-link m-t-15 text-center">
							<p>
								아직 비트마켓 회원이 아니신가요?<a href="BitJoin.bit"> 회원가입 하기</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
