
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
<c:set var="user" value="${requestScope.user}"></c:set>
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
						<h4 class="page-title">회원관리</h4>
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
				<b>회원 정보</b>
				<table width="800px" border="1">
					<tr>
						
						<td width="20%" align="center"><b> 회원아이디 </b></td>
						<td width="30%">${param.id}</td>
						<td width="20%" align="center"><b>비밀 번호</b></td>
						<td>${user.pwd}</td>
						<td width="20%" align="center"><b>가입일</b></td>
						<td>${user.rtime}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>닉네임</b></td>
						<td width="30%">${user.nick}</td>
						<td width="20%" align="center"><b>입력 주소</b></td>
						<td>${user.loc}</td>
						<td width="20%" align="center"><b>프로필사진</b></td>
						<td>${user.profile}</td>
						
					</tr>
					 <tr>
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
					<tr height="100">
					   
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
						
						<!--<c:if test="${!empty notice.nccontent }">
							${fn:replace(notice.nccontent, newLineChar,"<br/>")}
						</c:if>	
						-->	
						</td>
					</tr>
					
		
					
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