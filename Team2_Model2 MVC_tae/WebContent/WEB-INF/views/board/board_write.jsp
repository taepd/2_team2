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

<SCRIPT type="text/javascript">
function check(){
    if(!bbs.subject.value){
        alert("제목을 입력하세요");
        bbs.subject.focus();
        return false;
    }
    if(!bbs.writer.value){
        
        alert("이름을 입력하세요");
        bbs.writer.focus();
        return false;
    }
   /*  if(!bbs.content.value){            
        alert("글 내용을 입력하세요");
        bbs.content.focus();
        return false;
    } */
    if(!bbs.pwd.value){            
        alert("비밀번호를 입력하세요");
        bbs.pwd.focus();
        return false;
    }
 
    document.bbs.submit();
 
}
</SCRIPT>



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
					
							<div class="card-body">
						    <div id="pageContainer">
        <div style="padding-top: 25px; text-align: center">
            <!-- form 시작 ---------->
            <form name="bbs" action="board_writeok.jsp" method="POST">
                <table width="95%" border="2" align="center">
                    <tr>
                        <td width="20%" align="center">제목</td>
                        <td width="80%" align="left"><input type="text"    name="subject" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글쓴이</td>
                        <td width="80%" align="left"><input type="text" name="writer" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">이메일</td>
                        <td width="80%" align="left"><input type="text" name="email" size="40"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">홈페이지</td>
                        <td width="80%" align="left"><input type="text" name="homepage" size="40" value="http://"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">글내용</td>
                        <td width="80%" align="left"><textarea rows="10" cols="60" name="content" class="ckeditor"></textarea></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">비밀번호</td>
                        <td width="80%" align="left"><input type="password" name="pwd" size="20"></td>
                    </tr>
                    <tr>
                        <td width="20%" align="center">첨부파일</td>
                        <td width="80%" align="left"><input type="file" name="filename"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" value="글쓰기" onclick="check();" /> 
                            <input type="reset"  value="다시쓰기" />
                        </td>
                    </tr>
                </table>
              </form>
            
        </div>
    </div>
						
						
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