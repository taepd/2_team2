<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/extra-libs/multicheck/multicheck.css">
<link
	href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="dist/css/style.min.css" rel="stylesheet">



<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


</head>
<body>
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
					<a class="navbar-brand" href="AdminNoticeList.bit"> <!-- Logo icon --> <b
						class="logo-icon p-l-10"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
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
			<label class="btn btn-primary btn-file pull-right">  
					<a href="BitLogout.bit" style="color:white; text-decoration:none; ">로그아웃</a>
		  </label> 
			
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
							href="AdminNoticeList.bit" aria-expanded="false"><i
								class="mdi mdi-view-dashboard"></i><span class="hide-menu">사원 관리</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="EmpChartview.emp" aria-expanded="false"><i
								class="mdi mdi-chart-bar"></i><span class="hide-menu">차트</span></a></li>
								<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="BoardList.board" aria-expanded="false"><i
								class="mdi mdi-chart-bar"></i><span class="hide-menu">게시판</span></a></li>

					</ul>
				</nav>
				
			</div>
			
		</aside>
		<div class="page-wrapper">
		
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">공지사항 수정</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Board</a></li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div>
		<form name="notice" action="NoticeUpdateOk.bit?ncindex=${param.ncindex }" method="POST" >
                <table class="table">
                	<tr>
                        <td width="40%" align="center">글번호</td>
                        <td width="60%" align="left"><input type="text" name="ncindex" size="40" value="${param.ncindex }" readonly></td>
                    </tr>               
                    <tr>
                        <td width="40%" align="center">제목</td>
                        <td width="60%" align="left"><input type="text" name="title" size="40" value="${param.title }"></td>
                    </tr>
                    <tr>
                        <td width="40%" align="center">글쓴이</td>
                        <td width="60%" align="left"><input type="text" name="adminid" size="40" value="${sessionScope.id}" readonly></td>
                    </tr>
                    <tr>
                        <td width="40%" align="center">공지사항 유무</td>
                        <td width="60%" align="left"><input type="text" name="ncstate" size="40" value="${param.ncstate }"></td>
                    </tr>
                    <tr>
                        <td width="40%" align="center">작성일</td>
                        <td width="60%" align="left"><input type="text" name="rtime" size="40" value="${param.rtime }" readonly></td>
                    </tr>
                    <tr>
                        <td width="40%" align="center">글내용</td>
                        <td width="60%" align="left"><textarea rows="10" cols="60" name="nccontent" class="ckeditor">${param.nccontent}</textarea></td>
                    </tr>
                    <tr>
                    </tr>
            
                    <!-- <tr>
                        <td width="40%" align="center">첨부파일</td>
                        <td width="60%" align="left"><input type="file" name="filename" value="${param.filename }"></td>
                    </tr> -->
                     
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="글쓰기" /> 
                            <input type="reset"  value="다시쓰기" />
                        </td>
                    </tr>
                </table>
              </form>
	
	</div>
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
	<!-- this page js -->
	<script src="assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
	<script src="assets/extra-libs/multicheck/jquery.multicheck.js"></script>
	<script src="assets/extra-libs/DataTables/datatables.min.js"></script>
</body>
</html>