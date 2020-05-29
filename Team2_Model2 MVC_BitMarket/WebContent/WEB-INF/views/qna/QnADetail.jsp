<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>QnA Detail</title>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/extra-libs/multicheck/multicheck.css">
<link
	href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="dist/css/style.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>



<!-- 유효성 체크	 -->
<script type="text/javascript">
/*
	function reply_check() {

		var frm = document.QnaReply;
		if (frm.admin_replycontent.value == "") {
			alert("내용을 입력하세요.");
			return false;
		}

		frm.submit();

	}

*/





$(function(){
	$('.replyUpdate').click(function(){
		$('#reUp').empty();
		
		$('#reUp').append(	
				'<form name="QnAReUp_form" action="QnAReUpdate.bit" method="POST"><input type="hidden" name="qaindex" value=${qna.qaindex }>'+
				'<input type="hidden" name="id" value=${sessionScope.id }><hr><div class=row><h3><span class="font-bold">| 제목: </span>'+
				'<input class="text-danger" id="admin_replytitle" name="admin_replytitle" value="'+$(this).attr("title")+'"/></h3></div><hr>'+
				'<div class=row><div class=col><span class="font-bold">| 작성자: </span> <span>'+$(this).attr("id")+'</span></div><br><br>'+
				'<div class=row><div class=col><span class="font-bold">| 내용: </span><br><br>'+ 
				'<textarea id="admin_replycontent" name="admin_replycontent" rows="2" cols="100">'+$(this).attr("content")+'</textarea></div></div><br>'+
				'<input type="hidden" name="qartime" value='+$(this).attr("qartime")+'></input>'+
				'<div class=row><div class=col-6 style="text-align: right;"><input type="button" value="등록" onclick="submit();"></div></div></form>'				
		);
	});

});





</script>


</head>





<body>

<!-- set 하기 -->
<c:set var="qnaReplylist" value="${requestScope.qnaReplylist}" />
<c:set var="qna" value="${requestScope.qna}"></c:set>
<c:set var="qnaReply" value="${qnaReplylist[0]}"></c:set>
<c:set var="totalqnareplycount" value="${requestScope.totalqnareplycount}"></c:set>







<!-- -------------------------------------------- -->
		<div class="page-breadcrumb">
					<div class="row">
						<div class="col-12 d-flex no-block align-items-center">
							<h3>
								<b>게시글번호</b> <span class="pull-right">- ${qna.qaindex}</span>
							</h3>
						</div>
					</div>
		</div>
<!-- -------------------------------------------- -->

		<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<div class="row">
							
							


								<div class="col-md-12">
									<div class="pull-left">
										<!--                                         <div id="profile"> -->
										<%--                                             <img src="upload/${board.img}" style="margin-bottom: 30px;"> --%>
										<!--                                         </div> -->



										<address>
											<h3>
												<b class="text-danger">${qna.title }</b>
											</h3>
											<br>

											<div class=row>
												<div class=col>
													<span class="font-bold">| 작성자: </span> <span>${qna.id }</span>
												</div>
												<div class=col>
													<span class="font-bold">| 조회수 : </span> <span
														href="QnAAddReadNum.bit">${qna.count }</span>
												</div>
											</div>

											<hr>

											<div class=row>
<%-- 											<b>비밀글여부: </b> <span class="pull-right">- ${qna.scstate}</span> --%>
											
											
											
												<div class=col>
													<span class="font-bold">| 작성일 : </span> <span>${qna.qatime }</span>
												</div>

												<div class=col>
													<span class="font-bold">| 첨부파일명 : </span> <span>${qna.filename }</span>
												</div>
											</div>

											<hr>

											<div class=row>
												<div class=col>
													<span class="font-bold">| 내용 <br></span> <br>
													<div class=jumbotron>
														<span>${qna.content }</span>
													</div>
												</div>
											</div>
										</address>

									</div>
								</div>


								<hr />
							<c:if test='${sessionScope.id=="admin"||sessionScope.id == qna.id}'>
								<form action="QnAUpdate.bit" method="post">
									<input type="hidden" name="qaindex" value=${qna.qaindex }></input>
									<input type="hidden" name="title" value=${qna.title }></input> 
									<input type="hidden" name="qatime" value=${qna.qatime }></input>
									<input type="hidden" name="count" value=${qna.count }></input>
									<input type="hidden" name="scstate" value=${qna.scstate }></input>
									<input type="hidden" name="content" value=${qna.content }></input>
									<input type="hidden" name="filename" value=${qna.filename }></input>
									<input type="hidden" name="id" value=${qna.id }></input>
									<input type="hidden" name="awstate" value=${qna.awstate }></input>
									<div class="text-right">
										<button type="submit" class="btn btn-danger">수정</button>
									</div>	
									
								</form>
		
								<hr/>
								
								<div class="text-right" style="margin-left: 4px">
									<button class="btn btn-danger"
									onclick="location.href='QnADelete.bit?qaindex=${qna.qaindex }&id=${qna.id }'">삭제
<%-- 										onclick="location.href='QnADelete.bit?qaindex=${qna.qaindex }'">삭제 --%>
									</button>									
								</div>	
							</c:if>
							<div>
								<button class="btn btn-danger "
										onclick="location.href='QnANickList.bit'">뒤로가기</button>	
							</div>
							












							</div>
						</div>
					</div>
				</div>

<!-- =========================================================댓글(답변) 시작================================================ -->
	<c:choose>
	<c:when test='${sessionScope.id=="admin"&&qna.awstate == 0}'> <!-- 댓글(답변이) 아무것도 없을때 -->
	<!-- 세션아이디가 admin이고 awstate가 0일때 -->
				<!--  댓글/admin답변 등록 -->
				<div class="row">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<div class="row">

								<div class="col-md-12">
									<div class="pull-left">

										<form name="QnAReWr_form" action="QnAReWrite.bit" method="POST">
											<!-- hidden 태그  값을 숨겨서 처리  -->
											<input type="hidden" name="qaindex" value=${qna.qaindex }>
											<input type="hidden" name="id" value=${sessionScope.id }>


											
											<hr />
											<div class=row>
												<h3>
													<input class="text-danger"  id="admin_replytitle" name="admin_replytitle" value="[Re]${qna.title}"/>
												</h3>
											</div>

											<hr>

											<div class=row>
												<div class=col>
												
													<span class="font-bold">| 작성자: </span>
													<input class="text-danger"  id="id" name="id" value="${sessionScope.id}"/>
												</div>
											</div>
											<br>
											
											<br>
											<div class=row>
												<div class=col>
													<textarea id="admin_replycontent" name="admin_replycontent" rows="2"
														cols="100" placeholder="댓글을 입력하세요." value="${qnaReply.content}"></textarea>
												</div>
											</div>
											<br>
	
											<div class=row>
												<div class=col-6 style="text-align: right;">
<!-- 													<input type="button" value="등록" onclick="reply_check();"> -->
													<input type="button" value="등록" onclick="submit();">
												</div>
											</div>
											
											
										</form>
										
										
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
	</c:when>
	
	
	
	
	<c:when test='${qna.awstate==1}'>       <!-- 댓글(답변이) 이 존재할 때-->
	<!-- ============================================================== -->
				<!--  댓글/admin답변 보기-->
				<div class="row" name="ShowQnAReply">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<div class="row">

								<div class="col-md-12">
									<div class="pull-left" id="reUp">


											<!-- hidden data -->
											<hr />
											<div class=row>
												<h3>
													<b class="text-danger">${qnaReply.title}</b>
												</h3>
											</div>
											
											
											
											
											<hr />
											<div class=row>
												<div class=col>
													<span class="font-bold">| 작성일: </span> <span>${qnaReply.qartime}</span>
												</div>
											</div>
											
											<hr>
											<div class=row>
												<div class=col>
<%-- 													<span class="font-bold">| 작성자: </span> <span>${sessionScope.id}</span> --%>
													<span class="font-bold">| 작성자: </span> <span>${qnaReply.id}</span>
												</div>
											</div>
											<br>
											
											<br>
											<div class=row>
												<div class=col>
													<b class="text-danger">${qnaReply.content}</b>
												</div>
											</div>
											<br>
											




							<c:if test='${sessionScope.id=="admin"&&qna.awstate==1}'>
									<div class="text-right">
										<button class="replyUpdate" qartime="${qnaReply.qartime}" id="${qnaReply.id}" title="${qnaReply.title}" content= "${qnaReply.content}">수정</button>
									</div>
								<hr />
								
								<div class="text-right" style="margin-left: 4px">
									<button class="btn btn-danger"
									onclick="location.href='QnAReDelete.bit?qaindex=${qna.qaindex }&id=${qnaReply.id }'">삭제
<%-- 										onclick="location.href='QnADelete.bit?qaindex=${qna.qaindex }'">삭제 --%>
									</button>
								</div>
							</c:if>
								
								
								
								
								
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

	
	</c:when>
	</c:choose>

			</div>




<%-- <c:if test="${}"></c:if>  <!-- if문 --> --%>
<%-- <c:if test="${}"></c:if>  <!-- if문 --> --%>




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








