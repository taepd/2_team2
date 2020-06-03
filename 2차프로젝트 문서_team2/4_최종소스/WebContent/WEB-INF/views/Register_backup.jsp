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

<!-- 카카오 지도 api 호출 -->
<!-- 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e1cd5829baabce1e0239e9778eb76a"></script>
-->
<!-- 카카오지도 service 라이브러리 호출 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14e1cd5829baabce1e0239e9778eb76a&libraries=services"></script>
<!-- 카카오 주소 api 호출 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





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

/*------------------------------------------------------------------
[ Input ]*/

/* .wrap-input100 { */
/* 	display: -webkit-box; */
/* 	display: -webkit-flex; */
/* 	display: -moz-box; */
/* 	display: -ms-flexbox; */
/* 	display: flex; */
/* 	flex-wrap: wrap; */
/* 	align-items: flex-end; */
/* 	width: 100%; */
/* 	/*   height: 80px; */
/* 	padding: 100px; */
/* 	position: relative; */
/* 	border: 1px solid #e6e6e6; */
/* 	border-radius: 10px; */
/* 	margin-bottom: 10px; */
/* } */
.wrap-input100 {
	width: 100%;
	/*   height: 80px; */
	padding: 100px;
	position: relative;
	border: 1px solid #e6e6e6;
	border-radius: 10px;
	margin-bottom: 10px;
	text-align: center;
}

input {
	outline: none;
	margin: 0;
	border: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	width: 100%;
	font-size: 14px;
	font-family: inherit;
}

.input--style-4 {
	line-height: 50px;
	background: #fafafa;
	-webkit-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-moz-box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	box-shadow: inset 0px 1px 3px 0px rgba(0, 0, 0, 0.08);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 0 20px;
	font-size: 16px;
	color: #666;
	-webkit-transition: all 0.4s ease;
	-o-transition: all 0.4s ease;
	-moz-transition: all 0.4s ease;
	transition: all 0.4s ease;
}

.input--style-4::-webkit-input-placeholder {
	/* WebKit, Blink, Edge */
	color: #666;
}

.input--style-4:-moz-placeholder {
	/* Mozilla Firefox 4 to 18 */
	color: #666;
	opacity: 1;
}

.input--style-4::-moz-placeholder {
	/* Mozilla Firefox 19+ */
	color: #666;
	opacity: 1;
}

.input--style-4:-ms-input-placeholder {
	/* Internet Explorer 10-11 */
	color: #666;
}

.input--style-4:-ms-input-placeholder {
	/* Microsoft Edge */
	color: #666;
}

.label {
	font-size: 16px;
	color: #555;
	text-transform: capitalize;
	display: block;
	margin-bottom: 5px;
}

.input-group {
	position: relative;
	margin-bottom: 22px;
}

.input-group-icon {
	position: relative;
}

.input-icon {
	position: absolute;
	font-size: 18px;
	color: #999;
	right: 18px;
	top: 50%;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	cursor: pointer;
}

/* ==========================================================================
   #GRID
   ========================================================================== */
.row {
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-flex-wrap: wrap;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

.row-space {
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-moz-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between;
}

.col-2 {
	width: -webkit-calc(( 100% - 30px)/2);
	width: -moz-calc(( 100% - 30px)/2);
	width: calc(( 100% - 30px)/2);
}

@media ( max-width : 767px) {
	.col-2 {
		width: 100%;
	}
}
</style>
<!--  파일 버튼 디자인을 위해 bootstrap 추가한 것 끝 -->




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <script type="text/javascript">
	var validate = new Array;
	$(function() {
		//id검증(이메일 형식)
		$('#id')
				.keyup(
						function() {
							let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
							if (!email.test($('#id').val())) {
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
		$('input:not([type=file])').prop("required", true);
		//$('#id').attr("required","required");
		
		//submit 클릭시 올바르지 않은 입력 검증
		$('button:submit').click(function() {
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
			if ($('#id').attr("check_result") == "fail"){
				  alert("아이디 중복확인을 해주시기 바랍니다.");
				  $('#id').focus();
				    return false;
			}			
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
                            <form class="form-horizontal" action="BitJoinOK.bit" enctype="multipart/form-data" method="post">
                                <div class="card-body">
                                    <h4 class="card-title">회원 가입</h4>
                                    <div class="form-group row">
                                        <label for="fname" class="col-sm-3 text-right control-label col-form-label">아이디</label>
                                        <div class="col-sm-9">
                                            <input type="text" maxlength="20" id="id" name="id"
										title="5~16자리의 영문+숫자 조합으로 입력해주세요"
										placeholder="이메일 형식으로 입력해 주세요" check_result="fail">  
										<button type="button" class="btn btn-primary" id="btn-idchk">중복확인</button>
										<!-- <img id="id_check_sucess" style="display: none;"> -->
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
                                        <!-- 카카오 지도 API 적용 -->
                                        <div class="col-sm-9">
                                            <input type="text" maxlength="20" size="45" id="loc"
											name="loc" title="주소-기본주소" placeholder="동명(읍,면)으로 검색 (ex.서초동)">
											<input type="hidden" name="lat" id="lat">
											<input type="hidden" name="lon" id="lon">		
											<div id="layer" style="display: none; position: absolute; overflow: hidden; z-index: 1; top: 0px; left: 0px; max-width: 600px; width: 100%; height: 400px; border: 1px solid rgb(77, 77, 77);">
                                       	 		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1;width:20px" alt="닫기 버튼">
                                    		</div>
                                        </div>
                                    </div>
                           
                                   
                                   	<button type="button" id="currentLoc"
								class="btn social facebook btn-flat btn-addon mb-3">
								<i class="fa fa-crosshairs"></i>현재 위치로 찾기
								</button>
									
								<!-- 지도로 찾기 잠시 보류 <button type="button" class="btn btn-primary" id="searchMap">지도에서 찾기</button> -->
									<!-- 카카오지도 뿌려지는 곳 -->
								<!-- 	<div id="map" style="width:300px;height:300px;"></div>   -->
								
									
									
									<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">이미지 추가</label>
									<div class="col-sm-9">
										<label class="btn btn-primary btn-file"> 이미지 설정/변경 
										<input type="file" name="profile" style="display: none;" onchange="readURL(this);">
										</label>  <span id="imgFileName">${param.profile}</span> 
										<img id="img" src="upload/${param.profile}" alt="프로필 이미지" width="100px" height="100px"/>
									</div>
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

<script>
//카카오 지도
/* 
	$('#searchMap').click(function(){
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	
	var map = new kakao.maps.Map(container, options);
	}); */	
//카카오지도 끝

//카카오 주소
        var element_layer = document.getElementById('layer');
        var themeObj = {};
        function closeDaumPostcode() { element_layer.style.display = 'none'; }
        var element_layer = document.getElementById('layer');
        $("#loc").click(function () { sample2_execDaumPostcode() })
        $("#btnCloseLayer").click(function () { closeDaumPostcode() })
        function sample2_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                    }
                    //주소 인풋창에 입력
                    $("#loc").val(addr);
                    //주소값을 이용해서 좌표값 입력
                    addrToCoor(addr);
                    

                    element_layer.style.display = 'none';
                },
                width: '100%',
                height: '100%',
                maxSuggestItems: 5,
                theme: themeObj
            }).embed(element_layer);
            element_layer.style.display = 'block';
           
        }
       


//카카오 api활용 주소값으로 좌표값 얻어내기

function addrToCoor(addr){

 var geocoder = new daum.maps.services.Geocoder();



 // 주소로 좌표를 검색
 geocoder.addressSearch(addr, function(result, status) {
  
  // 정상적으로 검색이 완료됐으면,
  if (status == daum.maps.services.Status.OK) {
   
   $('#lat').val(result[0].y);
   $('#lon').val(result[0].x);

  }
 });
}


// html5 geolocation을 이용하여 현재 위치 값 받아내기

$('#currentLoc').click(function getLocation() {
  if (navigator.geolocation) { // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(function(position) {
      alert(position.coords.latitude + ' ' + position.coords.longitude);
      	//위도/경도 값 저장
     	$('#lat').val(position.coords.latitude);
     	$('#lon').val(position.coords.longitude);  
     	
		console.log($('#lat').val());
		console.log($('#lon').val());
      //카카오 지도 api 라이브러리 활용, 좌표에서 주소로 변환 // 
      var geocoder = new kakao.maps.services.Geocoder();

      var coord = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);
      var callback = function(result, status) {
    	  let currentAddr = result[0].address.address_name;
          if (status === kakao.maps.services.Status.OK) {
              console.log('그런 너를 마주칠까 ' + currentAddr + '을 못가');
          }
          $("#loc").val(currentAddr);
          
      }; 
      
      geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
 
    //카카오 지도api 라이브러리 활용, 좌표에서 주소로 변환 끝 //
     
    }, function(error) {
      console.error(error);
    }, {
      enableHighAccuracy: false,
      maximumAge: 0,
      timeout: Infinity
    });
  } else {
    alert('GPS를 지원하지 않습니다');
  }
});
//html5 geolocation을 이용하여 현재 위치 값 받아내기 끝
</script>
		
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
				alert('적합하지 않은 이메일 형식입니다');
				$('#id').focus();
				return;
		};
		//아이디 중복 체크
    	$('#id').change(function () {
     		//$('#id_check_sucess').hide();
     		$('#btn-idchk').show();
     	 	$('#id').attr("check_result", "fail");
    	});


    	if ($('#id').val() == '') {
      	alert('이메일을 입력해주세요.')
      	return;
    	}

    	console.log($('#id').val());
		
    	$.ajax({
      		type: "POST",
      		url: 'IdCheck.bit',
      		data: {
        			id: $('#id').val()
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
         			// $('#id_check_sucess').show();
          			//$('#btn-idchk').hide();
          			return;
        		}
      		}
    	});
    });
	
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