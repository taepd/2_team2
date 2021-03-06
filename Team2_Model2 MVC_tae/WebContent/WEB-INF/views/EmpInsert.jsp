<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- jquery UI datepicker -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/sunny/jquery-ui.css">

<!-- 부트스트랩 데이트피커 한글화 CDN 시도했으나 실패 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
<!--  -->
<script type="text/javascript">
	$(function() {

		var monthNames = [];
		for (var i = 1; i <= 12; i++) {
			monthNames.push(i + "월")
		}
		;

		$("#hiredate").datepicker({
			format : "yyyy-mm-dd",
			language: "ko",
			autoclose: true 
			
		/* jquery ui datepicker 옵션인데 현재는 bootstrap datepicker다 
		prevText:"이전달", //이전달 Tool tip text
		 nextText:"다음달",  //다음달 Tool tip text
		 monthNames : monthNames ,//['1월','2월'] //각 월표현
		 //dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		 dayNamesMin:['일','월','화','수','목','금','토'] ,
		 yearSuffix:'년',
		 numberOfMonths:1	 */
		});

		//직급 비동기 처리 
		
			$.ajax({
				type : "post",
				url : "JobList.emp",
				dataType : "json",
				success : function(responsedata) {
					console.log(responsedata);
					$('#jobsearch').empty();
					$('#jobsearch').append(
							"<option value=선택없음>선택없음</option>");

					$.each(responsedata, function(index, obj) {

						$('#jobsearch').append(
								"<option value="+obj+">" + obj
										+ "</option>");
					});

				},
			   error: function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }

				


			});
		
		
		
		
		//부서번호 비동기 처리
		//$('#deptsearch').one("click",function() { //.one >> 일회성 이벤트 처리

					$.ajax({
						type : "post",
						url : "DeptList.emp",
						dataType : "json",
						success : function(responsedata) {
							console.log(responsedata);
							$('#deptsearch').empty();
							$('#deptsearch').append(
									"<option value=선택없음>선택없음</option>");
							
							$.each(responsedata, function(index, obj) {

								$('#deptsearch').append(
										"<option value="+obj+">" + obj
												+ "</option>");
							});

						}

					});
				//});
		
	

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
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin5">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<a class="navbar-brand" href="EmpList.emp"> <!-- Logo icon -->
						<b class="logo-icon p-l-10"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
							<!-- Dark Logo icon --> <img src="assets/images/logo-icon.png"
							alt="homepage" class="light-logo" />

					</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
							<!-- dark Logo text --> <img src="assets/images/logo-text.png"
							alt="homepage" class="light-logo" />

					</span> <!-- Logo icon --> <!-- <b class="logo-icon"> --> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
						<!-- Dark Logo icon --> <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->

						<!-- </b> --> <!--End Logo icon -->
					</a>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- Toggle which is visible on mobile only -->
					<!-- ============================================================== -->
					<a class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"><i class="ti-more"></i></a>
				</div>
				<!-- ============================================================== -->
				<!-- End Logo -->
				<!-- ============================================================== -->
				<div class="ml-auto text-right" style="margin-right: 50px">
					<label class="btn btn-primary btn-file float-right"> <a
						href="AdminLogout.emp"
						style="color: white; text-decoration: none;">로그아웃</a>
					</label>
				</div>
			</nav>
		</header>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin5">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="p-t-30">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="EmpList.emp" aria-expanded="false"><i
								class="mdi mdi-view-dashboard"></i><span class="hide-menu">사원
									관리</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="EmpChartview.emp" aria-expanded="false"><i
								class="mdi mdi-chart-bar"></i><span class="hide-menu">차트</span></a></li>

					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
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

					<div class="card" style="width: 60%; margin: 0 auto;">
						<form class="form-horizontal" action="EmpInsertOk.emp"
							enctype="multipart/form-data" method="post">
							<div class="card-body">
								<h4 class="card-title">사원 정보 입력</h4>
								<div class="form-group row">
									<label for="fname"
										class="col-sm-3 text-right control-label col-form-label">사번</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="empno"
											id="empno" placeholder="사번을 입력해 주세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">이름</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="ename"
											id="ename" placeholder="사원의 이름을 입력해주세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">직급</label>
									<div class="col-sm-9">
										<select id="jobsearch" name="job">
											<option value=선택없음>선택없음</option>
											<option></option>
										
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="email1"
										class="col-sm-3 text-right control-label col-form-label">직속
										상관</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="mgr" id="mgr"
											placeholder="사원의 직속 상관의 사번을 입력해주세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">입사일</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="hiredate"
											id="hiredate" placeholder="사원을 입사일을 입력해 주세요" readonly
											style="cursor: default">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">급여</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="sal" id="sal"
											placeholder="사원의 급여를 입력해주세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">보너스</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="comm" id="comm"
											placeholder="사원의 인센티브를 입력해주세요">

									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">부서번호</label>
									<div class="col-sm-9">
										<select id="deptsearch" name="deptno">
											<option value=선택없음>선택없음</option>
											<option></option>
											

										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">이미지</label>
									<div class="col-sm-9">
										<label class="btn btn-primary btn-file"> 이미지 설정/변경 <input
											type="file" name="img" style="display: none;"
											onchange="readURL(this);">
										</label> <span id="imgFileName">${param.img}</span> <img id="img"
											src="upload/${param.img}" alt="your image" />
									</div>
								</div>
							</div>
							<div class="border-top">
								<div class="card-body" style="margin-left: 220px">
									<input type="submit" value="전송"> <input type="reset"
										value="취소">
								</div>
							</div>
						</form>






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


			<script src="assets/libs/jquery/dist/jquery.min.js"></script>
			<!-- Bootstrap tether Core JavaScript -->
			<script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
			<script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
			<!-- slimscrollbar scrollbar JavaScript -->
			<script
				src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
			<script src="assets/extra-libs/sparkline/sparkline.js"></script>
			<!--Wave Effects -->
			<script src="dist/js/waves.js"></script>
			<!--Menu sidebar -->
			<script src="dist/js/sidebarmenu.js"></script>
			<!--Custom JavaScript -->
			<script src="dist/js/custom.min.js"></script>
			<!-- This Page JS -->
			<script
				src="assets/libs/inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
			<script src="dist/js/pages/mask/mask.init.js"></script>
			<script src="assets/libs/select2/dist/js/select2.full.min.js"></script>
			<script src="assets/libs/select2/dist/js/select2.min.js"></script>
			<script src="assets/libs/jquery-asColor/dist/jquery-asColor.min.js"></script>
			<script src="assets/libs/jquery-asGradient/dist/jquery-asGradient.js"></script>
			<script
				src="assets/libs/jquery-asColorPicker/dist/jquery-asColorPicker.min.js"></script>
			<script src="assets/libs/jquery-minicolors/jquery.minicolors.min.js"></script>
			<script
				src="assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
			<script src="assets/libs/quill/dist/quill.min.js"></script>
			<script>
				//***********************************//
				// For select 2
				//***********************************//
				$(".select2").select2();

				/*colorpicker*/
				$('.demo').each(
						function() {
							//
							// Dear reader, it's actually very easy to initialize MiniColors. For example:
							//
							//  $(selector).minicolors();
							//
							// The way I've done it below is just for the demo, so don't get confused
							// by it. Also, data- attributes aren't supported at this time...they're
							// only used for this demo.
							//
							$(this).minicolors(
									{
										control : $(this).attr('data-control')
												|| 'hue',
										position : $(this)
												.attr('data-position')
												|| 'bottom left',

										change : function(value, opacity) {
											if (!value)
												return;
											if (opacity)
												value += ', ' + opacity;
											if (typeof console === 'object') {
												console.log(value);
											}
										},
										theme : 'bootstrap'
									});

						});

				/*datwpicker*/
				jQuery('.mydatepicker').datepicker();
				jQuery('#datepicker-autoclose').datepicker({
					autoclose : true,
					todayHighlight : true
				});
				var quill = new Quill('#editor', {
					theme : 'snow'
				});

				$('#comm, #sal').keyup(function() {
					var num = $(this).val().replace(/[^0-9]/g, ""); //입력값이 숫자가 아니면 공백

					$(this).val(num.replace(/\B(?=(\d{3})+(?!\d))/g, ",")); //정규식을 이용해서 3자리 마다 , 추가 
				});

				//이미지 추가 시 오른쪽에 이미지 미리보기 표시하는 함수
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							$('#img').attr('src', e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
					$('#imgFileName').html(input.files[0].name);
				};
			</script>
</body>

</html>