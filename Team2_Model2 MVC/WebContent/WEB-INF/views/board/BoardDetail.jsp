<%@page import="kr.or.bit.dto.Reply"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>게시판 리스트</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/extra-libs/multicheck/multicheck.css">
<link
	href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="dist/css/style.min.css" rel="stylesheet">

	

	 
	 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	 <script type="text/javascript">
	 
	 $(function() {
		 function PrintData(data){
			 	
				$('#table').empty();
				var tr = "<tr><td>작성자</td><td>내용</td><td>작성일</td><td>수정</td><td>삭제</td>";
				$.each(data, function(){
						tr += "<tr>"			
						+ " <td id='replywriter'>" + this.writer + "</td>"
						+ " <td>" + this.content + "</td>"
						+ " <td>" + this.writedate + "</td>"
						+ " <td><button id='getContent' no='"+this.no+"'>수정</button></td>"
						+ " <td><button id='deleteReply' no='"+this.no+"'>삭제</button></td>"
						+ "</tr>"
					
				});
				$('#table').append(
					tr	
				);
				$('#reply_content').val("");
			}
		 
		 
		//댓글 추가
		$('#writeReply').on("click",function(){
			if($.trim($('#reply_content').val()) == "")
			{
				alert("댓글을 입력하세요.");
				$('#reply_content').focus();
				return false;
			}
			let data = {
					      idx  : "${param.idx}" ,
					      writer : "${sessionScope.userid }",
					      content : $.trim($('#reply_content').val()) 
			            };
			console.log(data);
			$.ajax(
					{
						url : "ReplyWriteOk.board",  
						dataType : "JSON",           
						type : "POST",
						data : data ,
						success : function(responsedata)
						{
							PrintData(responsedata);		
						}
					}	
			      );

		});
		
		
		//댓글 삭제
		$(document).on("click","#deleteReply",function(){
			let sessionUId = "<%=session.getAttribute("userid") %>";
			
			if(sessionUId == $(this).parent().parent().children().eq(0).text()) {
			
				let data = {
					      writer  : "${sessionScope.userid }" ,
					      no : $(this).attr("no"),
					      idx  : "${param.idx}"
				            };
				console.log(data);
				$.ajax(
						{
							url : "ReplyDeleteOk.board",  
							dataType : "JSON",           
							type : "POST",
							data : data ,
							success : function(responsedata)
							{
								PrintData(responsedata);		
							}
						}	
				      );
			}else {
				alert("ID가 일치하지 않습니다.");
			}
			
		});
	
		
		//댓글 수정창 불러오기
		$(document).on("click","#getContent",function(){
			let sessionUId = "<%=session.getAttribute("userid") %>";
			if(sessionUId == $(this).parent().parent().children().eq(0).text()) { //작성자와 sessionid 비교
				$('#updateForm').css('display',"block");
				$('#replyup_content').val($(this).parent().parent().children().eq(1).text()); //댓글 내용 수정창에 반영
				$('#updateReply').attr('no',$(this).attr('no')); //수정창에 글번호 반영
			}else {
				alert("ID가 일치하지 않습니다.");
			}
			
		});
		
		//댓글 수정하기
		$(document).on("click","#updateReply",function(){
			let data = {
				      writer  : "${sessionScope.userid }",
				      no : $('#updateReply').attr("no"),
				      idx  : "${param.idx}",
				      content : $('#replyup_content').val()
			            };
			console.log(data);
			$.ajax(
					{
						url : "ReplyUpdateOk.board",  
						dataType : "JSON",           
						type : "POST",
						data : data ,
						success : function(responsedata)
						{
							PrintData(responsedata);
							$('#updateForm').css('display',"none");
						}
					}	
			      );
		});
		
		
			
	 });			
			
	
			
					  	   
		
			

	 
	 </script>
</head>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>		
<c:set var="board" value="${requestScope.board}"></c:set>
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
			<label class="btn btn-primary btn-file pull-right">  
					<a href="AdminLogout.emp" style="color:white; text-decoration:none; ">로그아웃</a>
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
		</div>
	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<table width="800px" border="1">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%">${param.idx}</td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td>${board.writedate}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%">${board.writer}</td>
						<td width="20%" align="center"><b>조회수</b></td>
						<td>${board.readnum}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>홈페이지</b></td>
						<td>${board.homepage}</td>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td>${board.filename}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${board.subject}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
						
						<c:if test="${!empty board.content }">
							${fn:replace(board.content, newLineChar, "<br/>")}
						</c:if>
						</td>
					</tr>
					
		
					
					<tr>
						<td colspan="4" align="center">
							<a href="BoardList.board?cp=${param.cp}&ps=${param.ps}">목록가기</a>
							
							<form action="BoardUpdate.board" method="post" name="edit">
                                 	<input type="hidden" name="idx" value=${param.idx }>
                              	    <input type="hidden" name="subject" value=${board.subject }>
                                 	<input type="hidden" name="writer" value=${board.writer }>
                                 	<input type="hidden" name="email" value=${board.email }>
                                 	<input type="hidden" name="homepage" value=${board.homepage }>
                                 	<input type="hidden" name="content" value=${board.content }>
                                 	<input type="hidden" name="filename" value=${board.filename }>
                                 	
                                
                                    <input type="submit" value="수정">
                               
                                     
                                
                 
                                </form>
				           
				            <a href="BoardDeleteOk.board?idx=${param.idx}&cp=${param.cp}&ps=${param.ps}&writer=${board.writer}">삭제</a>
				            |<a href="BoardRewrite.board?idx=${param.idx}&cp=${param.cp}&ps=${param.ps}&subject=${board.subject}">답글</a>									
						</td>
					</tr>
				</table>
					<table width="800px" border="1">
						<tr>
							<th colspan="2">댓글 쓰기</th>
						</tr>
						<tr>
							<td align="left">
								작성자 : ${sessionScope.userid }<br />
								내&nbsp;&nbsp;&nbsp;용 : <textarea name="reply_content" rows="2" cols="50" id="reply_content"></textarea>
							</td>
							<td align="left"> 
						
								  	   <button id="writeReply">등록</button>
							</td>
						</tr>
						
						<tr style="display: none" id="updateForm">
							<td align="left">
								작성자 : ${sessionScope.userid }<br />
								내&nbsp;&nbsp;&nbsp;용 : <textarea name="replyup_content" rows="2" cols="50" id="replyup_content"></textarea>
							</td>
							<td align="left"> 
						
								  	   <button id="updateReply">수정</button>
							</td>
						</tr>
						
					</table>
			
	
	
	<br>
	
	
		<table width="800px" border="1" id="table">
			<tr>
				
				<td>작성자</td>
				<td>내용</td>
				<td>작성일</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="reply" items="${requestScope.replylist }">
				<tr>
					
					<td>${reply.writer }</td>
					<td>${reply.content }</td>
					<td>${reply.writedate }</td>
					<td><button id="getContent" no="${reply.no}">수정</button></td>
					<td><button id="deleteReply" no="${reply.no}">삭제</button></td>
					
				</tr>
			</c:forEach>
		
		</table>
		
		</center>
		</div>
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