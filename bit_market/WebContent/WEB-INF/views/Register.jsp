<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
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
					<form action = "BitJoinOK.bit" name="form" method = "post" enctype="multipart/form-data">
						<div class="form-group">
							<img id="img" class="rounded-circle mx-auto d-block" src="upload/${param.pofile}" alt="프로필 사진">
						<label class="btn btn-outline-primary btn-sm"><i class="fa fa-star"></i>이미지 추가
						<input type="file" name="pofile" style="display: none;" onchange="readURL(this);">

						</label>
						</div>
						
						<div class="form-group">
							<input type="text" name="id" class="form-control" placeholder="아이디를 입력해주세요">
						</div>
						<div class="form-group">

							<input type="password" name="pwd" class="form-control"
								placeholder="비밀번호를 입력해주세요">
						</div>
						<div class="form-group">

							<input type="text" name="nick" class="form-control"
								placeholder="사용할 닉네임을 입력해 주세요">
						</div>
						<div class="form-group">

							<input type="text" name="loc" class="form-control"
								placeholder="동명(읍,면)으로 검색 (ex.서초동)">
						</div>

						<button type="button"
							class="btn social facebook btn-flat btn-addon mb-3">
							<i class="fa fa-crosshairs"></i>현재 위치로 찾기
						</button>

						<button type="submit"
							class="btn btn-primary btn-flat m-b-30 m-t-30">회원가입 완료</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function readURL(input) {
		if (input.file && input.file[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	</script>
</body>
</html>