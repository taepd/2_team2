<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>관리자 페이지</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/extra-libs/multicheck/multicheck.css">
<link
	href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="dist/css/style.min.css" rel="stylesheet">
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

<script>

//페이지 링크 비동기
$(function(){
		
		//페이징 비동기
		$('#paging').change(function(){
			let data = {ps : $('#paging option:selected').val(),
					    cp : $('#cp').val() 
			           };		
			$.ajax({
				url:"NoticeListAjax.bit",
				data: data,
				type:"POST",		
				dataType: "json",
				success:function(responsedata){ 
					 console.log(responsedata);
					$('#noticetable').empty();
					$.each(responsedata,function(index,obj){	
						$('#noticetable').append(	
								"<tr><td>"+obj.ncindex+"</td>" +
								"<td><a href='EmpDetail.emp?empno="+obj.ncindex+"&cp=${cpage}&ps=${pagesize}'>" +
									obj.title+"</a></td>" +
								"<td>"+obj.rtime+"</td>" +
								"<td>"+obj.adminid+"</td>" +
								"<td>"+obj.ncstate+"</td><tr>"
						   
						);
					});
					$('#zero_config_info').empty();
					$('#zero_config_info').append("총 부서원 " + responsedata.length);
					
					//페이지 번호 처리
					page(cp=$('#cp').val());
			   }
				
			
			}); 
		});
		
		//page()
		function page(cp){
			console.log('cp='+cp);
			$('#zero_config_paginate').empty();
			var pagesize = $('#paging option:selected').val();
			var totalempcount = $('#totalnoticecount').val();
			
			var pagecount;
			console.log('pagesize= '+pagesize);
			console.log('totalnoticecount= '+ totalempcount);
			if((totalempcount % pagesize) == 0){
				pagecount = totalempcount/pagesize;
			}else if(totalempcount/pagesize<1){
				pagecount=1;
			}else{
			
				pagecount = Math.floor(totalempcount/pagesize + 1); 
			}
			
			console.log('pagecount = '+pagecount);
			let tmp="";
			
			if(cp>1){
				tmp +='<a href="EmpList.emp?cp=${cpage-1}&ps='+pagesize+'" cp="'+(cp-1)+'" ps="${pagesize}">이전</a>';
			}
			//page 목록 나열하기
			for(var i=1;i<=pagecount; i++){
				if(cp==i){
					tmp +=('<font color="red">['+i+']</font>');
				}else{
					tmp +=('<a href="EmpList.emp?cp='+i+'&ps='+pagesize+'" cp="'+i+'" ps="'+pagesize+'" >['+i+']</a>');
				}
			}
			//다음 링크
			if(cp<pagecount){
				tmp += '<a href="EmpList.emp?cp=${cpage+1}&ps='+pagesize+'" cp="'+(cp+1)+'" ps="${pagesize}">다음</a>';
			};
			$('#zero_config_paginate').append(tmp);
		};
		
		//페이지 링크 비동기
		$(document).on('click', '#zero_config_paginate a', function(e){
			e.preventDefault();
			let data = {ps : $(this).attr('ps'),
				        cp : $(this).attr('cp')
		           };		
		$.ajax({
			url:"EmpListAjax.emp",
			data: data,
			type:"POST",		
			dataType: "json",
			success:function(responsedata){ 
				 console.log(responsedata);
				$('#emptable').empty();
				$.each(responsedata,function(index,obj){	
					$('#emptable').append(	
							"<tr><td>"+obj.empno+"</td>" +
							"<td><a href='EmpDetail.emp?empno="+obj.empno+"&cp=${cpage}&ps=${pagesize}'>" +
								obj.ename+"</a></td>" +
							"<td>"+obj.job+"</td>" +
							"<td>"+obj.deptno+"</td><tr>"
					   
					);
				});
				$('#zero_config_info').empty();
				$('#zero_config_info').append("총 부서원 " + responsedata.length);
				
				//페이지 번호 처리
				page(parseInt(data.cp));
		   }
			
		
		}); 
			
		});
		

});
</script>
	
	

</head>

<body>
		<!-- set 하기 -->
	<c:set var="noticelist" value="${requestScope.noticelist}" />
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="cpage" value="${requestScope.cpage}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="totalnoticecount" value="${requestScope.totalnoticecount}" />
	<!-- 비동기 때 사용하려고 만든 것 -->
	<input type="hidden" id="cp" name="${cpage}" value="${cpage}"/>
	<input type="hidden" id="pagecount" name="${pagecount}" value="${pagecount}"/>
	<input type="hidden" id="totalempcount" name="${totalempcount}" value="${totalempcount}"/>
	<!-- 비동기 때 사용하려고 만든 것 끝 -->
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
		<!-- 헤더 include로 뺌 -->
		   <jsp:include page="../../../Include/adminheader.jsp"/>

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
	<!-- sidebar include로 뺌 -->
		    <jsp:include page="../../../Include/adminsidebar.jsp"/>
	
		<div class="page-wrapper">
		
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">게시판</h4>
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



			<div class="card">
				<div class="card-body">
					<h5 class="card-title">공지사항 게시판</h5>
					<div class="table-responsive">
						<div id="zero_config_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<div class="dataTables_length" id="zero_config_length">
										<form name="list">
											<label>Show <select name="ps"
												aria-controls="zero_config" id="paging">
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
													aria-label="사번: activate to sort column ascending">글번호</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="이름: activate to sort column ascending">제목</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="직급: activate to sort column ascending">등록시간</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="부서번호: activate to sort column ascending">작성자</th>
												<th class="sorting" tabindex="0" aria-controls="zero_config"
													rowspan="1" colspan="1"
													aria-label="부서번호: activate to sort column ascending">공개 여부</th>	
											</tr>
										</thead>
										<tbody id="noticetable">

											<c:forEach var="notice" items="${noticelist}">
												<tr>
													<td>${notice.ncindex}</td>
													<td><a
														href="EmpDetail.emp?empno=${notice.ncindex}&cp=${cpage}&ps=${pagesize}">
															${notice.title} </a></td>
													<td>${notice.rtime}</td>
													<td>${notice.adminid}</td>
													<td>${notice.ncstate}</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">

									<div class="dataTables_info" id="zero_config_info"
										role="status" aria-live="polite">총 게시글 ${totalnoticecount}건</div>

								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="zero_config_paginate">


										<c:if test="${cpage > 1}">
											<a href="BoardList.board?cp=${cpage-1}&ps=${pagesize}">이전</a>
										</c:if>
										<!-- page 목록 나열하기 -->
										<c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<c:choose>
												<c:when test="${cpage==i }">
													<font color="red">[${i}]</font>
												</c:when>
												<c:otherwise>
													<a href="BoardList.board?cp=${i}&ps=${pagesize}">[${i}]</a>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<!--다음 링크 -->

										<c:if test="${cpage < pagecount}">
											<a href="BoardList.board?cp=${cpage+1}&ps=${pagesize}">다음</a>
										</c:if>
									</div>
									<a href="BoardWrite.board">글쓰기</a>
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