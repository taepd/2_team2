<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Detail</title>


<!-- 유효성 체크	 -->
<script type="text/javascript">
	function reply_check() {
		var frm = document.reply;
		if (frm.admin_replycontent.value == "") {
			alert("내용을 입력하세요.");
			return false;
		}

		frm.submit();
	}

	 
</script>

</head>





<body>
<!-- set 하기 -->
<c:set var="qnaReplylist" value="${requestScope.qnaReplylist}" />
<c:set var="qna" value="${requestScope.qna}"></c:set>
<%-- <c:set var="qnaReply" value="${requestScope.qnaReply}"></c:set> --%>
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
												<b class="text-danger">제목: ${qna.title }</b>
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
								
								<form action="QnAUpdate.bit" method="post">
									<input type="hidden" name="qaindex" value=${qna.qaindex }></input> <input
										type="hidden" name="title" value=${qna.title }></input> <input
										type="hidden" name="qatime" value=${qna.qatime }></input>
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

								<hr />
								<div class="text-right" style="margin-left: 4px">
									<button class="btn btn-danger"
										onclick="location.href='QnADelete.bit?qaindex=${qna.qaindex }'">삭제
									</button>
									
									<button class="btn btn-danger"
										onclick="location.href='QnAList.bit'">뒤로가기</button>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- ============================================================== -->
	<c:choose>
	<c:when test='${sessionScope.id=="admin"&&qna.awstate==0}'>
				<!--  댓글/admin답변 등록 -->
				<div class="row">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<div class="row">

								<div class="col-md-12">
									<div class="pull-left">

										<form name="reply" action="QnAReWrite.bit" method="POST">
											<!-- hidden 태그  값을 숨겨서 처리  -->
											<input type="hidden" name="qaindex" value=${qna.qaindex }>
											<input type="hidden" name="id" value=${qna.id }>
											<input type="hidden" name="title" value=${qnaReply.title }>
											<!-- hidden data -->
<%-- 											<input type="hidden" name="content" value=${qnaReply.content }> --%>


											
											<hr />
											<div class=row>
												<h3>
													<input class="text-danger"  id="admin_replytitle" name="admin_replytitle" value="[Re]${qna.title}"/>
												</h3>
											</div>

											<hr>

											<div class=row>
												<div class=col>
													<span class="font-bold">| 작성자: </span> <span>${sessionScope.id}</span>
												</div>
											</div>
											<br>
											
											<br>
											<div class=row>
												<div class=col>
													<textarea id="admin_replycontent" name="admin_replycontent" rows="2"
														cols="100" placeholder="댓글을 입력하세요."></textarea>
												</div>
											</div>
											<br>
	
											<div class=row>
												<div class=col-6 style="text-align: right;">
													<input type="button" value="등록" onclick="reply_check();">
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
	
	
	<c:when test='${sessionScope.id=="admin"&&qna.awstate==1}'>
	<!-- ============================================================== -->
				<!--  댓글/admin답변 보기-->
				<div class="row">
					<div class="col-md-12">
						<div class="card card-body printableArea">
							<div class="row">

								<div class="col-md-12">
									<div class="pull-left">

										<form name="reply" action="QnADetail.bit" method="POST">
											<!-- hidden 태그  값을 숨겨서 처리  -->
											<input type="hidden" name="qaindex" value=${qna.qaindex }>
											<input type="hidden" name="id" value=${qna.id }>
											<!-- 이건 지금은 필요없고 추후에..필요에따라? -->


											<!-- hidden data -->
											<hr />
											<div class=row>
												<h3>
													<b class="text-danger">[Re]${qna.title}</b>
												</h3>
											</div>

											<hr>

											<div class=row>
												<div class=col>
													<span class="font-bold">| 작성자: </span> <span>${sessionScope.id}</span>
												</div>
											</div>
											<br>
											
											<br>
											<div class=row>
												<div class=col>
													<textarea id="admin_reply" name="admin_reply" rows="2"
														cols="100" placeholder="댓글을 입력하세요."></textarea>
												</div>
											</div>
											<br>

											<div class=row>
												<div class=col-6 style="text-align: right;">
													<input type="button" value="등록" onclick="reply_check();">
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
	</c:choose>


			</div>




<%-- <c:if test="${}"></c:if>  <!-- if문 --> --%>
<%-- <c:if test="${}"></c:if>  <!-- if문 --> --%>




</body>
</html>