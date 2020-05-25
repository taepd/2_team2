<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Include/css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>Matrix Template - The Ultimate Multipurpose admin
	template</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/libs/select2/dist/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/libs/jquery-minicolors/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/libs/quill/dist/quill.snow.css">
<link href="dist/css/style.min.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var validate = new Array;

	$(function() {
		//id검증
		$('#userId')
				.keyup(
						function() {
							let id = /^[a-zA-Z0-9]{5,16}$/;
							if (!id.test($(this).val())) {
								$('.tdid')
										.html(
												'<b style="color:red">5~16자리의 영문+숫자 조합으로 입력해주세요</b>');
								validate[0] = false;
							} else {
								$('.tdid').html('<b>적합한 아이디입니다.</b>');
								validate[0] = true;
							}
							console.log(validate[0]);
						});
		//password
		$('#userPass')
				.keyup(
						function() {
							let pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/;
							if (!pwd.test($(this).val())) {
								$('.tdpw')
										.html(
												'<b style="color:red">8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다.</b>');
								validate[1] = false;
							} else {
								$('.tdpw').html('<b>적합한 패스워드입니다.</b>');
								validate[1] = true;
							}
							console.log(validate[1]);
						});
		//password check
		$('#userPassCheck, #userPass').keyup(function() {
			if ($('#userPass').val() != $('#userPassCheck').val()) {
				$('.tdpwch').html('<b style="color:red">비밀번호가 다릅니다.</b>');
				validate[2] = false;
			} else {
				$('.tdpwch').html('<b>비밀번호가 일치합니다.</b>');
				validate[2] = true;
			}
			console.log(validate[2]);
		});

		//email
		$('#userEmail')
				.keyup(
						function() {
							let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
							if (!email.test($(this).val())) {
								$('.tdemail')
										.html(
												'<b style="color:red">적합하지 않은 이메일 형식입니다.</b>');
								validate[3] = false;
							} else {
								$('.tdemail').html('<b>적합한 이메일입니다.</b>');
								validate[3] = true;
							}
							console.log(validate[3]);
						});

		//phone
		$('#userPhone')
				.keyup(
						function() {
							let phone = /^(01[01679]{1})[-.\s]?([0-9]{3,4})[-.\s]?([0-9]{4})$/;
							if (!phone.test($(this).val())) {
								$('.tdphone')
										.html(
												'<b style="color:red">적합하지 않은 형식입니다. "01X-XXX(X)-XXXX"형식으로 입력하세요.</b>');
								validate[4] = false;
							} else {
								$('.tdphone').html('<b>적합한 형식입니다.</b>');
								validate[4] = true;
							}
							console.log(validate[4]);
						});

		$('input').focus(function() {
			$(this).css('background-color', "gold");
		});
		$('input').blur(function() {
			$(this).css('background-color', "white");
		});

		//입력 다 했는지 검증
		$('input:not([type=checkbox])').prop("required", true);
		// $('#userId').attr("required","required");

		//올바르지 않은 입력 검증
		$('input:submit').click(function() {

			for (let i = 0; i < validate.length; i++) {
				if (validate[i] == false) {
					alert("올바르지 않은 입력이 있습니다.");
					console.log(i);
					switch (i) {
					case 0:
						$('#userId').focus();
						return false;
					case 1:
						$('#userPass').focus();
						return false;
					case 2:
						$('#userPassCheck').focus();
						return false;
					case 3:
						$('#userEmail').focus();
						return false;
					case 4:
						$('#userPhone').focus();
						return false;
					}
				}

			}
			;
			if (!($('input:checkbox').is(":checked"))) {
				alert("취미를 선택해 주세요");
				return false;
			}
			;

		});

		// $('input:submit').click(function(){
		// if($('#userId').val()=="") {
		//     alert("아이디를 입력해 주세요");
		//     $('#userId').focus();
		//     return false;
		// }else if($('#userPass').val()=="") {
		//     alert("패스워드를 입력해 주세요");
		//     $('#userPass').focus();
		//     return false;
		// }else if($('#userPassCheck').val()=="") {
		//     alert("패스워드 확인란을 입력해 주세요");
		//     $('#userPassCheck').focus();
		//     return false;
		// }else if($('#userEmail').val()=="") {
		//     alert("이메일을 입력해 주세요");
		//     $('#userEmail').focus();
		//     return false;
		// }else if($('#userPhone').val()=="") {
		//     alert("핸드폰 번호를 입력해 주세요");
		//     $('#userPhone').focus();
		//     return false;
		// }else if($('#userSsn1').val()=="") {
		//     alert("주민번호 앞자리를 입력해 주세요");
		//     $('#userSsn1').focus();
		//     return false;
		// }else if($('#userSsn2').val()=="") {
		//     alert("주민번호 뒷자리를 입력해 주세요");
		//     $('#userSsn2').focus();
		//     return false;
		// }else if($('#userName').val()=="") {
		//     alert("이름을 입력해 주세요");
		//     $('#userName').focus();
		//     return false;
		// }else if($('#userZipCode').val()=="") {
		//     alert("우편번호를 입력해 주세요");
		//     $('#userZipCode').focus();
		//     return false;
		// }else if($('#userAddr1').val()=="") {
		//     alert("기본주소를 입력해 주세요");
		//     $('#userAddr1').focus();
		//     return false;
		// }else if($('#userAddr2').val()=="") {
		//     alert("상세주소를 입력해 주세요");
		//     $('#userAddr2').focus();
		//     return false;
		// }else if($('#year').val()=="") {
		//     alert("출생년도를 입력해 주세요");
		//     $('#year').focus();
		//     return false;
		// }

		// });

	});
</script>
<!--  
      조별과제 : 
    jquery 를 사용하여 유효성 검증 코드를 만드시고
    MemberJoinOK.jsp 를 통해서 데이터 받아서 결과 출력하세요
     
    userId : keyup 이벤트  정해진 표현에 맞지 않으면 ID 추가 입력
    ex) let id ="정규표현식" 
    ex) if(id.test($(this).val()) != true) { 확인요청 } else {}
    
    userPass : keyup 이벤트에서 정해진 표현과 일치 하지 않으면 (정규표현 가능)
    
    userPassCheck : keyup  >> userPass 같은 값인지 확인 일치여부 확인
    
    userEmail : keyup 이벤트에서 email 형식과 일치여부 확인
    
    userPhone : keyup 이벤트에서 phone 형식과 일치여부 확인
    
    
    submit 전송시 
    userId , userPass , userPassCheck , userEmail , userPhone
    , userSsn1 , userSsn2 , userZipCode , userPhone
       값이 입력되지 않으면 다시 입력을 요청
  -->
<style>
body {
	font-family: "malgun gothic";
	font-size: 9pt;
}

th {
	text-align: right;
	background-color: #dbdbdb
}

th.title {
	text-align: center;
	font-size: 12pt;
	background-color: #ffffff;
}
</style>
</head>


<body class="bg-dark">
	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-logo">
					<a href="index.html"> <img class="align-content"
						src="images/logo.png" alt="">
					</a>
				</div>
				<div class="container">
					<div class="login-form" style="text-align: center">
						<form action="BitJoinOK.bit" name="form" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<img id="img" class="rounded-circle mx-auto d-block"
									src="upload/${param.pofile}" alt="프로필 사진"> <label
									class="btn btn-outline-primary btn-sm"><i
									class="fa fa-star"></i>이미지 추가 <input type="file" name="pofile"
									style="display: none;" onchange="readURL(this);"> </label>
							</div>
							<div class="form-group" align="center">
								<table>
									<tr>
										<th colspan="2" class="title">회원가입</th>
									</tr>
									<tr>
										<th>아이디</th>
										<td><input type="text" maxlength="20" id="userId"
											name="userId" title="5~16자리의 영문+숫자 조합으로 입력해주세요"
											placeholder="아이디를 입력해주세요"></td>
										<td class="tdid"></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" maxlength="20" id="userPass"
											name="userPass"
											title="8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다."
											placeholder="비밀번호를 입력해주세요"></td>
										<td class="tdpw"></td>
									</tr>
									<tr>
										<th>비밀번호 확인</th>
										<td><input type="password" maxlength="20"
											id="userPassCheck" name="userPassCheck" title="패스워드 확인"
											placeholder="비밀번호를 입력해주세요"></td>
										<td class="tdpwch"></td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td><input type="text" maxlength="20" id="userName"
											name="userName" title="닉네임"></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input type="text" maxlength="20" size="45"
											id="userAddr1" name="userAddr1" title="주소-기본주소"></td>
									</tr>
								</table>
								<br>
								<button type="button"
									class="btn social facebook btn-flat btn-addon mb-3">
									<i class="fa fa-crosshairs"></i>현재 위치로 찾기
								</button>
								<br> <br>
								<button type="submit"
									class="btn btn-primary btn-flat m-b-30 m-t-30">회원 가입</button>
								<button type="reset"
									class="btn btn-primary btn-flat m-b-30 m-t-30">취소</button>
									
									
							</div>



							<!-- 
							<div class="form-group">

								<input type="password" name="pwd" class="form-control"
									placeholder="비밀번호를 입력해주세요">
							</div>
							<div class="form-group">

								<input type="password" name="pwd" class="form-control"
									placeholder="비밀번호 다시 한 번">
							</div>
							<div class="form-group">

								<input type="text" name="nick" class="form-control"
									placeholder="사용할 닉네임을 입력해 주세요">
							</div>
							<div class="form-group">

								<input type="text" name="loc" class="form-control"
									placeholder="동명(읍,면)으로 검색 (ex.서초동)">
							</div>
							<br>
							<button type="button"
								class="btn social facebook btn-flat btn-addon mb-3">
								<i class="fa fa-crosshairs"></i>현재 위치로 찾기
							</button>
							<br> <br>
							<button type="submit"
								class="btn btn-primary btn-flat m-b-30 m-t-30">회원가입 완료</button>-->
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
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
</html>