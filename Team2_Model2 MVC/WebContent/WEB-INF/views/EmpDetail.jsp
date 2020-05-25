<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Matrix Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
	<c:set var="emp" value="${requestScope.emp}"></c:set>
	
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
                        <h4 class="page-title">상세 보기</h4>
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
                    <div class="col-md-12">
                        <div class="card card-body printableArea">
                            <h3><b>사번</b> <span class="pull-right">${emp.empno }</span></h3>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="pull-left">
                                        <div id="profile">
                                            <img src="upload/${emp.img}" alt="이미지가 없습니다"style="width:150px; height:150px">
                                        </div>
                                        <address>
                                            <h3> &nbsp;<b class="text-danger">${emp.ename}</b></h3>
                                           		<li class="card-body border-top">
                                               	 	<span class="font-bold">직업 : </span>
                                                	<span>${emp.job }</span>
                                				</li>
                                            	<li class="card-body border-top">
                                                    <span class="font-bold">직속상관 : </span>
                                                    <span>${emp.mgr }</span>
                                            	</li>
                                            	<li class="card-body border-top">
                                                	<span class="font-bold">입사일 : </span>
                                                	<span>${emp.hiredate }</span>
			                                	</li>
			                                	<li class="card-body border-top">
			                                    	<span class="font-bold">월급 : </span>
			                                    	<span>${emp.sal }</span>
			                    				</li>
			                    				<li class="card-body border-top">
			                        				<span class="font-bold">보너스 : </span> 
			                        				<span>${emp.comm }</span>
			        							</li>
			        							<li class="card-body border-top">
			                        				<span class="font-bold">부서번호 : </span>
			                        				<span>${emp.deptno }</span>
			        							</li>
                                        </address>
                                    </div>
                                   
                                </div>
                              
                                <form action="EmpUpdate.emp" method="post">
                                 	<input type="hidden" name="empno" value=${emp.empno }>
                                 	<input type="hidden" name="ename" value=${emp.ename }>
                                 	<input type="hidden" name="job" value=${emp.job }>
                                 	<input type="hidden" name="mgr" value=${emp.mgr }>
                                 	<input type="hidden" name="hiredate" value=${emp.hiredate }>
                                 	<input type="hidden" name="sal" value=${emp.sal }>
                                 	<input type="hidden" name="comm" value=${emp.comm }>
                                 	<input type="hidden" name="deptno" value=${emp.deptno }>
                                 	<input type="hidden" name="img" value=${emp.img }>
                                <div class="text-right">
                                    
                                     <button type="submit" class="btn btn-danger">정보수정</button>
                                     
                                </div>
                               
                                </form>
                                <div class="text-right" style="margin-left:4px">    
                                 <button class="btn btn-danger" onclick="location.href='EmpDelete.emp?empno=${emp.empno}&cp=${param.cp}&ps=${param.ps}'">사원삭제 </button>
                            	 <button class="btn btn-danger" onclick="location.href='EmpList.emp?cp=${param.cp}&ps=${param.ps}'">뒤로가기</button>
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
            <footer class="footer text-center">
                All Rights Reserved by Matrix-admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
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
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
</body>

</html>