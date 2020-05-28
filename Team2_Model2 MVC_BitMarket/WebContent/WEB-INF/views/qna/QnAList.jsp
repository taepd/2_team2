<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>qnaNickList</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
	
	
	/*
	$("#answerox").on("click",function(){
		$("#answerox").empty();
		var bchange="";
		bchange = "<button class=\"btn btn-warning\">답변완료</button>";
		
		$("#answerox").append(bchange);
	});
	*/



	$('#qnasearch').keyup(function(){
		if($('#qnasearch').val() == ""){
			$(location).attr('href',"qnaNickList.bit?cp=${cpage}&ps=${pagesize}");
		}
		
		
		
		var data = {qaindex : $('#qnasearch').val()};
		$.ajax(
				 {
					 type:"get",
					 data:data,
					 url:"QnASearch.bit?",
					 dataType:"json",
					 success:function(responsedata){ 
						 
						$('#qnatable').empty();
						$.each(responsedata,function(index,obj){	
							$('#qnatable').append(	
									"<tr><td>"+obj.qaindex+"</td>" +
									"<td><a href='QnADetail.bit?qaindex="+obj.qaindex+"&cp=${cpage}&ps=${pagesize}'>" +
										obj.title+"</a></td>" +
									"<td>"+obj.id+"</td>" +
									"<td>"+obj.qatime+"</td>" +
									"<td>"+obj.count+"</td>" +
									"<td><button><h1>${qna.awstate=='1'?'답변 완료':'답변 예정'}</h1></button></td>"
							   
							);
						});
						$('#zero_config_info').empty();
						$('#zero_config_info').append("총 게시글" + responsedata.length);
						
					 }
				 }
		      );
	});
	


	
	

});//func



</script>




</head>















<body>
<!-- set 하기 -->
	<c:set var="qnaNickList" value="${requestScope.qnaNickList}" />
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="cpage" value="${requestScope.cpage}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="totalqnacount" value="${requestScope.totalqnacount}" />
	
	<div class="page-wrapper">
		
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">Q&A 게시판</h4>
					</div>
				</div>
			</div>




<!-- ------------------------------------------------------------------------------------ -->

			<!-- 페이징 -->
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Q&A 게시판입니다.</h5>
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
								
								
								
								
								
								
<!-- ------------------------------------------------------------------------------------ -->								
									<!-- 검색 여기부터임 -->
								<div class="col-sm-12 col-md-6">
									<div id="zero_config_filter" class="dataTables_filter"> <!-- => 얘는 상관없음-->
										
									
										
										
										<label>Search:<input type="search" id="qnasearch" name="qnasearch"
											class="form-control form-control-sm" placeholder=""
											aria-controls="zero_config">
											</label>
									</div>
									
									
									
								</div>
							</div>
									
									
									
									
<!-- ------------------------------------------------------------------------------------ -->
									<!-- 결과나올 테이블 -->
							<div class="row">
								<div class="col-sm-12">
									<table id="zero_config"
										class="table table-striped table-bordered dataTable no-footer"
										role="grid" aria-describedby="zero_config_info">
										
										<thead>
											<tr role="row" >
												<th>글번호</th>
												<th>제목</th>
												<th>글쓴이</th>
												<th>작성일</th>
												<th>조회수</th>
												<th>답변여부</th>
											</tr>
										</thead>
										
										
										
										
										<tbody id="qnatable">
											<c:forEach var="qna" items="${qnaNickList}">
												<tr>
													<td>${qna.qaindex}</td>
													<td><a href="QnADetail.bit?qaindex=${qna.qaindex}&cp=${cpage}&ps=${pagesize}">
															${qna.title} </a></td>
													<td>${qna.id}</td>
													<td>${qna.qatime}</td>
													<td>${qna.count}</td>
													<td><button><h1>${qna.awstate=='1'?'답변 완료':'답변 예정'}</h1></button></td>
													<td>${qna.nick }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							
							
							
<!-- ------------------------------------------------------------------------------------ -->
							<div class="row">
								<div class="col-sm-12 col-md-5">

									<div class="dataTables_info" id="zero_config_info"
										role="status" aria-live="polite">총 게시글 ${totalqnacount}</div>

								</div>
								
								<!-- ------------------------------------------------------------------------------------ -->
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="zero_config_paginate">


										<c:if test="${cpage > 1}">
											<a href="QnANickList.bit?cp=${cpage-1}&ps=${pagesize}">이전</a>
										</c:if>
										
										<!-- ------------------------------------------------------------------------------------ -->
										<!-- page 목록 나열하기 -->
										<c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<c:choose>
												<c:when test="${cpage==i }">
													<font color="red">[${i}]</font>
												</c:when>
												<c:otherwise>
													<a href="QnANickList.bit?cp=${i}&ps=${pagesize}">[${i}]</a>
												</c:otherwise>
											</c:choose>

										</c:forEach>
										<!-- ------------------------------------------------------------------------------------ -->
										<!--다음 링크 -->
										<c:if test="${cpage < pagecount}">
											<a href="QnANickList.bit?cp=${cpage+1}&ps=${pagesize}">다음</a>
										</c:if>
									</div>
									<a href="QnAWrite.bit">글쓰기</a>
								</div>
							</div>
							
							
							
							
						</div>
					</div>

				</div>
			</div>
<!-- ------------------------------------------------------------------------------------ -->
			
			
			
			
			
			
			
			
		</div>
	
	
	
	
	
	
</body>
</html>