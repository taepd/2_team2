<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/css.jsp"%>

<body class="body-wrapper">
	<div class="auth-wrapper d-flex no-block justify-content-center align-items-center">
		
			<div id="loginform">
				<div class="text-center p-t-20 p-b-20">
					<span class="db"><img src="assets/images/logo.png" alt="logo"></span>
				</div>
				<!-- Form -->
				<form action="Login.bit">
					<div class="form-group" id="logininput">
						<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="id">
					  </div>
					  <div class="form-group">
						<input type="text" class="form-control" placeholder="비밀 번호를 입력해 주세요" name="pwd">
					  </div>
					<div class="border-secondary">
							<div class="form-group">
									<button class="btn float-right" id="loginbt" type="submit">Login</button>
							</div>
					</div>
					<div id="joinlink">
						<p>아직 비트 마켓의 회원이 아니신가요?&nbsp;&nbsp;<a href="BitJoin.bit"><strong>회원가입 하러가기</strong></a></p>
					</div>
				</form>
			</div>
	</div>
</body>
</html>
