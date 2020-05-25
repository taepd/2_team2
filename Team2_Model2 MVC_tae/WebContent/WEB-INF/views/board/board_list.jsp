<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>사원 리스트</title>
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
	<!-- set 하기 -->
	<c:set var="list" value="${requestScope.list}" />
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="cpage" value="${requestScope.cpage}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}" />
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
					<a class="navbar-brand" href="EmpList.emp"> <!-- Logo icon --> <b
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
			<div class="ml-auto text-right" style="margin-right:50px">
			<label class="btn btn-primary btn-file float-right">  
					<a href="AdminLogout.emp" style="color:white; text-decoration:none; ">로그아웃</a>
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
						<h4 class="page-title">사원 관리</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>



			<div class="card">
				<div class="card-body">
					<h5 class="card-title">사원 목록</h5>
					<div class="table-responsive">
						<div id="zero_config_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="dataTables_length" id="zero_config_length">
										<form name="list">
											<label>Show <select name="ps"
												aria-controls="zero_config"
												class="form-control form-control-sm" onchange="submit()">
													<c:forEach var="i" begin="5" end="20" step="5">
														<c:choose>
															<c:when test="${pagesize ==i}">
																<option value="${i}" selected>${i}건</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}건</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select>
											</label>
										</form>
									</div>
								</div>
								
								<div class="col-sm-12 col-md-6">
								
									<div id="zero_config_filter" class="dataTables_filter">
										부서번호 : <select id="deptsearch">
											<option value="선택없음" selected>선택없음</option>
											<c:forEach var="dept" items="${deptList}">>
											<option value="${dept}">${dept}</option>
											</c:forEach>
										</select>
										<label>Search:<input type="search" id="empsearch" name="empsearch"
											class="form-control form-control-sm" placeholder=""
											aria-controls="zero_config"></label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table id="zero_config"
										class="table table-striped table-bordered dataTable no-footer"
										role="grid" aria-describedby="zero_config_info">
										<thead>
											<tr role="row" >

												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="사번: activate to sort column ascending">순번</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="이름: activate to sort column ascending">제목</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="직급: activate to sort column ascending">글쓴이</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="부서번호: activate to sort column ascending">날짜</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="부서번호: activate to sort column ascending">조회수</th>
											</tr>
										</thead>
										<tbody id="emptable">

												<c:forEach var="board" items="${list}">
					<tr>
						<td>${board.idx}</td>
						<!-- 글제목 부분 -->
						<td>
							<c:forEach var="i" begin="1" end="${board.depth}" step="1">
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							<c:if test="${board.depth > 0}">
								<img src="../images/re.gif">
							</c:if>
							<a href="board_content.jsp?idx=${board.idx}&cp=${cpage}&ps=${pagesize}">
								<c:choose>
									<c:when test="${board.subject != null && fn:length(board.subject) > 10}">
										${fn:substring(board.subject,0,10)}...
									</c:when>
									<c:otherwise>
										${board.subject}
									</c:otherwise>
								</c:choose>
							</a>
						</td>
						<td>${board.writer}</td>
						<td>${board.writedate}</td>
						<td>${board.readnum}</td>
					</tr>
				</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">

									<div class="dataTables_info" id="zero_config_info"
										role="status" aria-live="polite">총 부서원 ${totalempcount}</div>

								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="zero_config_paginate">


										<c:if test="${cpage > 1}">
											<a href="EmpList.emp?cp=${cpage-1}&ps=${pagesize}">이전</a>
										</c:if>
										<!-- page 목록 나열하기 -->
										<c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<c:choose>
												<c:when test="${cpage==i }">
													<font color="red">[${i}]</font>
												</c:when>
												<c:otherwise>
													<a href="EmpList.emp?cp=${i}&ps=${pagesize}">[${i}]</a>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<!--다음 링크 -->

										<c:if test="${cpage < pagecount}">
											<a href="EmpList.emp?cp=${cpage+1}&ps=${pagesize}">다음</a>
										</c:if>
									</div>
									<a href="BoardWrite.board">등록</a>
								</div>
							</div>
						</div>
					</div>

				</div>
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
	<!-- End Wrapper -->
	<!-- ============================================================== -->
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
	<!-- this page js -->
	<script src="assets/extra-libs/multicheck/datatable-checkbox-init.js"></script>
	<script src="assets/extra-libs/multicheck/jquery.multicheck.js"></script>
	<script src="assets/extra-libs/DataTables/datatables.min.js"></script>


</body>

</html>