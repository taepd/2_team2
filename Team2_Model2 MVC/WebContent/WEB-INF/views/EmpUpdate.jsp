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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

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
    $(function() {
    	$.ajax(
				 {
					 type:"get",
					 url:"EmpJobSelect.emp",
					 dataType:"html",
					 success:function(responsedata){ 
						$('#jobselect').html(responsedata);			 
					 }
				 });
    	
    	$.ajax(
				 {
					 type:"get",
					 url:"EmpDeptnoSelect.emp",
					 dataType:"json",
					 success:function(responsedata){ 
						 
						 let select = "<select name='deptno'>";
						 $.each(responsedata.deptnolist, function(index, obj) {
							 if(index == 0) {
								 select += "<option value='"+obj+"' selected>"+obj+"</option>";
							 }else{
							 	select += "<option value='"+obj+"'>"+obj+"</option>";
							 }
						})
						$('#deptnoselect').html(select);			 
					 }
				 });
    	
    	
    	
    	
    	
    	
   
    	
    	$('#hiredate').datepicker(
				{
				   format : "yyyy-mm-dd",
				   autoclose : true
				}	
			);
    	
    	//급여, 보너스 자리수 처리
    	$('#comm, #sal').keyup(function() {
    		var num = $(this).val().toString().replace(/[^0-9]/g,"");
 
    		$(this).val(num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<!-- header include로 뺌 -->
		   <jsp:include page="/WEB-INF/include/header.jsp"/>

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- sidebar include로 뺌 -->
		   <jsp:include page="/WEB-INF/include/sidebar.jsp"/>
	
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">사원 정보 수정</h4>
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
			<!-- ==S============================================================ -->
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
				 <div class="col-md-12">
					<div class="card" style="width: 60%; margin: 0 auto;">
						<form class="form-horizontal"
							action="EmpUpdateOk.emp?cp=${param.cp}&ps=${param.ps}"
							enctype="multipart/form-data" method="post">
							<div class="card-body">
								<h4 class="card-title">사원 정보 입력</h4>
								<div class="form-group row">
									<label for="fname"
										class="col-sm-3 text-right control-label col-form-label">사번</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="empno"
											name="empno" value="${param.empno}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">이름</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="ename"
											name="ename" value="${param.ename}">
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-sm-3 text-right control-label col-form-label">직급</label>
									<div class="col-sm-9" id="jobselect" >
										<!-- <input type="text" class="form-control" id="job" name="job"
											value="${param.job}"> -->
									</div>
								</div>
								<div class="form-group row">
									<label for="email1"
										class="col-sm-3 text-right control-label col-form-label">직속
										상관</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="mgr" name="mgr"
											value="${param.mgr}">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">입사일</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="hiredate"
											name="hiredate" value="${param.hiredate}" readonly style="cursor:default">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">급여</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="sal" name="sal"
											value="${param.sal}">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">보너스</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="comm" name="comm"
											value="${param.comm}">
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">부서번호</label>
									<div class="col-sm-9" id="deptnoselect">
										<!-- <input type="text" class="form-control" id="deptno"
											name="deptno" value="${param.deptno}"> -->
									</div>
								</div>
								<div class="form-group row">
									<label for="cono1"
										class="col-sm-3 text-right control-label col-form-label">이미지</label>
									<div class="col-sm-9">
										<label class="btn btn-primary btn-file"> 이미지 설정/변경 
										<input type="file" name="img" style="display: none;" onchange="readURL(this);">
										</label>  <span id="imgFileName">${param.img}</span> 
										<img id="img" style="width:100px; height:100px"src="upload/${param.img}" alt="your image" />
									</div>
								</div>
							</div>
							<div class="border-top">
								<div class="card-body">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>

							</div>
						</form>
						<div class="border-top">
							<div class="card-body">
								<button class="btn btn-primary"
									onclick="location.href='EmpDetail.emp?empno=${param.empno}&cp=${param.cpage}&ps=${param.pagesize}'">뒤로가기</button>
							</div>
						</div>

					</div>
					</div>
				</div>

			</div>

			<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);			
		}$('#imgFileName').html(input.files[0].name);
		
	};
	</script>
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
        });

    </script>
</body>

</html>