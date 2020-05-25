<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>회원 가입</title>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/libs/jquery-minicolors/jquery.minicolors.css">
    <link rel="stylesheet" type="text/css" href="assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/libs/quill/dist/quill.snow.css">
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- 파일 버튼 디자인을 위해 bootstrap 추가한 것-->

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">


<style>
.btn-file {
	position: relative;
	overflow: hidden;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}
</style>
<!--  파일 버튼 디자인을 위해 bootstrap 추가한 것/ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script type="text/javascript">
	var validate = new Array;
	$(function() {
		//id검증(이메일 형식)
		$('#id')
				.keyup(
						function() {
							let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
							if (!email.test($(this).val())) {
								$('.tdemail')
										.html(
												'<b style="color:red">적합하지 않은 이메일 형식입니다.</b>');
								validate[0] = false;
							} else {
								$('.tdemail').html('<b>적합한 이메일입니다.</b>');
								validate[0] = true;
							}
							console.log(validate[0]);
						});

		//password
		$('#pwd')
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
		$('#pwdCheck, #pwd').keyup(function() {
			if ($('#pwd').val() != $('#pwdCheck').val()) {
				$('.tdpwch').html('<b style="color:red">비밀번호가 다릅니다.</b>');
				validate[2] = false;
			} else {
				$('.tdpwch').html('<b>비밀번호가 일치합니다.</b>');
				validate[2] = true;
			}
			console.log(validate[2]);
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
						$('#id').focus();
						return false;
					case 1:
						$('#pwd').focus();
						return false;
					case 2:
						$('#pwdCheck').focus();
						return false;
					}
				}
			}
			;

		});
	});
</script>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
		
		<div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">사원 추가</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
          </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    
                        <div class="card" style="width:60%; margin: 0 auto;">
                            <form class="form-horizontal" action="BitJoinOK.bit" enctype="multipart/form-data" method="post" novalidate>
                                <div class="card-body">
                                    <h4 class="card-title">회원 가입</h4>
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">아이디</label>
                                        <div class="col-sm-9">
                                            <input type="text" maxlength="20" id="id" name="id"
										title="5~16자리의 영문+숫자 조합으로 입력해주세요"
										placeholder="이메일 형식으로 입력해 주세요" check_result="fail" required>  
										<button type="button" class="btn btn-primary" id="btn-idchk">중복확인</button>
										<img id="id_check_sucess" style="display: none;">
                                        </div>
                                        <div class="col-sm-9 tdemail"></div>
                                        
                                    </div>
                                    <div class="form-group row">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">비밀번호</label>
                                        <div class="col-sm-9">
                                           <input type="password" maxlength="20" id="pwd"
										name="pwd"
										title="8~20자 사이에 적어도 하나의 영어대문자,숫자, 특수문자가 포함되어야 합니다."
										placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="col-sm-9 tdpw"></div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email1" class="col-sm-3 text-right control-label col-form-label">비밀번호 확인</label>
                                        <div class="col-sm-9">
                                            <input type="password" maxlength="20" id="pwdCheck"
										name="pwdCheck" title="패스워드 확인" placeholder="비밀번호를 입력해주세요">
                                        </div>
                                        <div class="col-sm-9 tdpwch"></div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">닉네임</label>
                                        <div class="col-sm-9">
                                           <input type="text" maxlength="20" id="nick"
										name="nick" title="닉네임" placeholder="사용할 닉네임을 입력해 주세요">
                                        </div>                                       
                                    </div>
                                    <div class="form-group row">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">주소</label>
                                        <div class="col-sm-9">
                                            <input type="text" maxlength="20" size="45" id="loc"
										name="loc" title="주소-기본주소" placeholder="동명(읍,면)으로 검색 (ex.서초동)">
                                        </div>
                                    </div>
                                   <div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">이미지 추가</label>
									<div class="col-sm-9">
										<label class="btn btn-primary btn-file"> 이미지 설정/변경 
										<input type="file" name="img" style="display: none;" onchange="readURL(this);">
										</label>  <span id="imgFileName">${param.profile}</span> 
										<img id="img" src="upload/${param.profile}" alt="프로필 이미지" width="100px" height="100px"/>
									</div>
									<button type="button"
								class="btn social facebook btn-flat btn-addon mb-3">
								<i class="fa fa-crosshairs"></i>현재 위치로 찾기
								</button>
								</div>
                                </div>
                                <div class="border-top">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-primary">전송</button>
                                        <button type="reset" class="btn btn-primary">취소</button>
                                    </div>
                                </div>
                            </form>
                 </div>
                        
                       
                       
                    
               
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    
		
		
<script type="text/javascript">
	//***********************************//
	// 이미지 파일 업로드시 이미지 미리보기
	//***********************************//
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}$('#imgFileName').html(input.files[0].name);
	};
	
	//***********************************//
    //  아이디 중복 체크
    //***********************************//	
    
    $('#btn-idchk').click(function(){
    	//아이디 적합성 체크
    	let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if (!email.test($('#id').val())) {
				alert('<b style="color:red">적합하지 않은 이메일 형식입니다.</b>');
				$('#id').focus();
		}
		//아이디 중복 체크
  function id_overlap_check() {

    $('#id').change(function () {
      $('#id_check_sucess').hide();
      $('#btn-idchk').show();
      $('#id').attr("check_result", "fail");
    })


    if ($('#id').val() == '') {
      alert('이메일을 입력해주세요.')
      return;
    }

    id = document.querySelector('input[name="id"]');

    $.ajax({
      type: "POST",
      url: 'IdCheck.bit',
      data: {
        id: id
      },
      datatype: 'json',
      success: function (data) {
        console.log(data['result']);
        if (data['result'] == "fail") {
          alert("이미 존재하는 아이디 입니다.");
          $("#id").val('');
          $("#id").focus();
          return;
        } else {
          alert("사용가능한 아이디 입니다.");
          $('#id').attr("check_result", "success");
          $('#id_check_sucess').show();
          $('#btn-idchk').hide();
          return;
        }
      }
    });
  }
</script>	
		
		
		


	

    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <script src="dist/js/pages/mask/mask.init.js"></script>
    <script src="assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="assets/libs/select2/dist/js/select2.min.js"></script>
    <script src="assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
    <script src="assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
    <script src="assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
    <script src="assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
    <script src="assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="assets/libs/quill/dist/quill.min.js"></script>
    
    <script>
        //***********************************//
        // For select 2
        //***********************************//
        $(".select2").select2();

        /*colorpicker*/
        $('.demo').each(function() {
        //
        // Dear reader, it's actually very easy to initialize MiniColors. For example:
        //
        //  $(selector).minicolors();
        //
        // The way I've done it below is just for the demo, so don't get confused
        // by it. Also, data- attributes aren't supported at this time...they're
        // only used for this demo.
        //
        $(this).minicolors({
                control: $(this).attr('data-control') || 'hue',
                position: $(this).attr('data-position') || 'bottom left',

                change: function(value, opacity) {
                    if (!value) return;
                    if (opacity) value += ', ' + opacity;
                    if (typeof console === 'object') {
                        console.log(value);
                    }
                },
                theme: 'bootstrap'
            });

        });
        /*datwpicker*/
        jQuery('.mydatepicker').datepicker();
        jQuery('#datepicker-autoclose').datepicker({
            autoclose: true,
            todayHighlight: true
        });
        var quill = new Quill('#editor', {
            theme: 'snow'
        })

    </script>
</body>

</html>