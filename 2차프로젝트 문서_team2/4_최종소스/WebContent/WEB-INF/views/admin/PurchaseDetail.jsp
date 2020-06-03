
<%@page import="java.util.List"%>

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
<title>회원 관리 세부내용</title>
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
<c:set var="purchase" value="${requestScope.purchase}"></c:set>
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
						<h4 class="page-title">거래관리 세부 사항</h4>
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
				<b>거래관리 세부 사항</b>
				<table width="800px" border="1">
					<tr>
						
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%">${purchase.bdindex}</td>
						<td width="20%" align="center"><b>작성자</b></td>
						<td>${param.id}</td>
						
					</tr>
					<tr>
						<td width="20%" align="center"><b>글 제목</b></td>
						<td width="30%">${param.title}</td>
						<td width="20%" align="center"><b>글 내용</b>
						<input type="hidden" name = "boardid" id= "boardid" value="${board.id}">
	<section class="section-sm" id="maxwidth">
		<!-- Container Start -->
		<div class="col-md-12" style="background-color: white;">
			<div class="row mt-30">
					<!-- Left sidebar -->
				<div class="col-sm-12 col-md-7">
						<div id="carousel" class="owl-carousel owl-theme" >
							<c:forTokens var="imglist" items="${token}" delims="/">
							<c:if test="${imglist !='null'}">
								<div class="item" style="height:400px;">
									<img class="d-block w-100" style="max-height: 400px;"
										src="upload/${imglist}" onError ="javascript:this.src='upload/noimage.gif'"alt="slide img">
								</div>
							</c:if>
							
							</c:forTokens>
						</div>
						
				</div>
					<div class="col-sm-12 col-md-5" style="margin-top: 50px;">
						<h2 class="product-title">${board.title}</h2>
						<h1 class="product-title">${board.price}</h1>
						<hr>
						<div class="product-meta" >
							<ul class="list-inline">
							<c:forEach var="ctcode" items="${ctlist}">
							<c:if test="${board.ctcode == ctcode.ctcode}">
								<li class="list-inline-item"><i class="fa fa-folder-open-o"></i>카테고리 <a href="">${ctcode.ctname}</a></li>
								</c:if>
							</c:forEach>
							</ul>
						
							<ul class="list-inline">
							<li class="list-inline-item"><i class="fa fa-heart"></i><a href="">10분전</a></li>
								<li class="list-inline-item"><i class="fa fa-eye"></i> 조회<a href="">32</a></li>
							</ul>
						</div>
						<hr>
					<div class="row">
						<!-- User Profile widget -->

						<div class="col-sm-12 col-md-2">
							<div class="thumbnail-wrapper">
								<div class="thumbnail">
									<div class="thumbnail-centered rounded-circle" style ="width:100px;">
									<div class="rounded-circle">
										<img class="thumbnail-img" src="images/2455914A56ADB1E315.jpg" style="max-width:100%; "/>
									</div>
									</div>
								</div>
							</div>
							</div>
							<div class="col-sm-12 col-md-10">

								<c:forEach var="user" items="${userlist}">
									<c:if test="${board.id == user.id}">
										<h4>
											<a href="">${user.nick}</a>
										</h4>
										<p class="member-time">${user.loc}</p>
									</c:if>
								</c:forEach>
							</div>
						</div>
								<c:if test="${board.id == sessionScope.id}">
							<form action="BitUpdate.bit?" method="get" name="edit" style ="float:left;">
								<input type="hidden" name="bdindex" value="${param.bdindex}">
								<input type="hidden" name="title" value="${board.title}">
								<input type="hidden" name="id" value="${board.id}"> <input
									type="hidden" name="ctcode" value="${board.ctcode}"> <input
									type="hidden" name="content" value="${board.content}">
								<input type="hidden" name="price" value="${board.price}">
								<a href="BitUpdate.bit"><button>수정하기</button></a>

							</form>
							<c:choose>
								<c:when test="${board.trstate == 'Y'}">
									<button id="trOver">거래수정</button>
								</c:when>
								<c:otherwise>
									<button id="trOver">거래완료</button>
								</c:otherwise>
							
							</c:choose>
							<a href="BitDeleteOk.bit?bdindex=${param.bdindex}"><button>삭제하기</button></a>
							<c:if test="${board.trstate == 'Y'}">
								<span>${oldRepNick}님과 판매완료</span>
								
							</c:if>
						</c:if>
						
					</div>

				</div>
				<div class="container mt-3">

				  <!-- 모달 시작 -->
				  <div class="modal fade" id="trModal">
				    <div class="modal-dialog">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h4 class="modal-title">댓글 닉네임 목록</h4>
				          <button type="button" class="close" data-dismiss="modal">×</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
						 <form action="BitTrUpdateOk.bit">
						 <input type="hidden" name="bdindex" value="${param.bdindex}">
						 <input type="hidden" name="boardid" value="${board.id}">
						 <input type="hidden" name="oldRepId" value="${oldRepId }">
							 <c:forEach var="nickId" items="${nickIdTrlist}" varStatus="status">
							 	<c:choose>
							 	<c:when test="${nickId.id == board.id }"></c:when>
							 	<c:otherwise>
							 	
							    <div class="form-check">
							      <label class="form-check-label" for="radio${status.count }">
							        <input type="radio" class="form-check-input" id="${nickId.nick}" name="newRepId" value="${nickId.id}">${nickId.nick} 님 / ID : ${nickId.id}
							      </label>
							    </div>
							    </c:otherwise>
							    </c:choose>
						    </c:forEach>
						    <button type="submit" class="btn btn-primary">선택</button>
						  </form>
				        </div>
				        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				        </div>
				        
				      </div>
				    </div>
				  </div>
				  
				</div>
				
				
				
				
				<hr>

				<div>

					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
							aria-labelledby="pills-home-tab">
							<h3 class="tab-title">상품 정보</h3>
							<p>${board.content}</p>
						</div>
					</div>
				</div>
				<hr>
				<div >
					<h4>상품 문의</h4>
					
						<!-- Message -->
						<div >
						<label for="message">${sessionScope.nick }</label>
							<textarea class="form-control" id="message" rows="8"></textarea>
							<div class="d-flex flex-row-reverse">
						<button class="btn btn-transparent" id="writeReply">등록</button>
						<div class="form-group form-check">
							<label class="form-check-label">
							  <input class="form-check-input" type="checkbox" name="scstate" id="scstate" value="Y"> 비밀댓글 등록하기
							</label>
						</div>
					</div>
						</div>
						
					
					
					<div class="container">
						<div id="replyall">
						
						</div>
					
					</div>
				</div>
			</div>
	</section>
						
						
						</td>
						<td>${purchase.loc}</td>
												
					</tr>
					
					 	<!--  
						<td width="20%" align="center"><b>공지사항유무</b></td>
						<td>${board.homepage}</td>
						
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td>${board.filename}</td>	
						-->		
					</tr>
					
					<!--  <tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${notice.title}</td>
					</tr>
					-->
					
		
					
					<tr>
						<td colspan="4" align="center">
							<a href="UserList.bit?cp=${param.cp}&ps=${param.ps}">회원목록가기</a>
							<!-- 
							<form action="NoticeUpdate.bit" method="post" name="edit">
                                 	<input type="hidden" name="ncindex" value="${param.ncindex }">
                              	    <input type="hidden" name="rtime" value="${notice.rtime }">
                                 	<input type="hidden" name="adminid" value="${notice.adminid }">
                                 	<input type="hidden" name="ncstate" value="${notice.ncstate }">
                                 	<input type="hidden" name="title" value="${notice.title }">
                                 	<input type="hidden" name="nccontent" value="${notice.nccontent }">
                                 	
                                 	
                                
                                    <input type="submit" value="수정">
                               
                                     
                                
                 
                                </form>
				            -->
				            <a href="UserDeleteOK.bit?id=${param.id}&cp=${param.cp}&ps=${param.ps}">삭제</a>
				            <!--  <a href="BoardRewrite.board?idx=${param.idx}&cp=${param.cp}&ps=${param.ps}&subject=${board.subject}">답글</a>-->								
						</td>
					</tr>
				</table>
					<!--  <table width="800px" border="1">
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
			        -->
	
	
	<br>
	
	
		<!--  <table width="800px" border="1" id="table">
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
		-->
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