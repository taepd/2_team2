<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAList</title>
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
			$(location).attr('href',"QnAList.bit?cp=${cpage}&ps=${pagesize}");
		}
		var data = {empno : $('#qnasearch').val()};
		$.ajax(
				 {
					 type:"get",
					 data:data,
					 url:"QnASearch.bit?",
					 dataType:"json",
					 success:function(responsedata){ 
						 
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
						
					 }
					
				 }
		
		      );
	});












});



</script>

<style type="text/css">

/*공통옵션*/
ul li{list-style:none;}
.fl{float:left;}
.tc{text-align:center};

/*게시판 목록*/
.qnaboard {width: 950px;}
.w70 {width:70px;}
.w500{width:500px;}
.w120{width: 120px;}
.w100{width:100px;}

.qnaboardlist {width: 950px;}
.w70 {width:70px;}
.w500{width:500px;}
.w120{width: 120px;}
.w100{width:100px;}

.qnatitle{
height: 50px;
line-height: 50px;
background: skyblue;
font-weight: bold;
}

.t_line {border-right:solid 1px gray;}
.lt_line {border-bottom:solid 1px gray;}
.list{
height: 40px;
line-height: 40px;
background: #f3f3f3;

}




</style>


</head>















<body>
<!-- set 하기 -->
	<c:set var="qnalist" value="${requestScope.qnalist}" />
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






			<!-- 페이징 -->
			<div class="card">
				<div class="card-body">
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
								
								
								
								
								
								
								<div class=row>
								<div class="col-sm-12 col-md-5">

									<div class="dataTables_info" id="zero_config_info"
										role="status" aria-live="polite">전체  ${totalqnacount}</div>

								</div>
								<div class="col-sm-12 col-md-6">
									<!-- 검색 여기부터임 -->
									<div id="zero_config_filter" class="dataTables_filter"> <!-- => 얘는 상관없음-->
										<div class= row>
										<select id="qnasearch_select">
											<option value="제목 및 내용" selected>제목 및 내용</option>
											<option value="제목">제목</option>
											<option value="내용">내용</option>
										</select>
										
										<label>
										<input type="search" id="empsearch" name="qnasearch"
											class="form-control form-control-sm" placeholder=""
											aria-controls="zero_config"/>
											</label>
											</div>
									</div>
									<!-- 검색 여기부터임 -->
								</div>
							</div>
								
							</div>
									
									
									
									
									
				<!-- 결과나올 ul*li -->
		
				<!-- 기본메뉴 -->
				<ul class="qnaboard">
					<li class="fl tc w70 title t_line">번호</li>
					<li class="fl tc w500 title t_line">제목</li>
					<li class="fl tc w120 title t_line">글쓴이</li>
					<li class="fl tc w100 title t_line">작성일</li>
					<li class="fl tc w100 title t_line">조회수</li>
					<li class="fl tc w100 title t_line">답변여부</li>
				</ul>
				
				<!-- 리스트 -->
				<ul class="qnaboardlist">
					<c:forEach var="qna" items="${qnalist}">
						<li class="fl tc w70 list t_line lt_line">${qna.qaindex}</li>
						<li class="fl tc w500 list t_line lt_line">${qna.title}</li>
						<li class="fl tc w120 list t_line lt_line">${qna.id}</li>
						<li class="fl tc w100 list t_line lt_line">${qna.qatime}</li>
						<li class="fl tc w100 list t_line lt_line">${qna.count}</li>
						<li class="fl tc w100 list t_line lt_line" id="answerox"><button><h1 onclick="this.innerHTML='답변완료'">답변예정</h1></button></li>
					</c:forEach>
				</ul>
		
							
							
							
							<div class="row">
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
									<div>
										<a href="QnAWrite.bit">글쓰기</a>
									</div>
								</div>
							</div>
							
							
							
							
						</div>
					</div>

				</div>
			</div>
		</div>
	
	
	
	
	
	
</body>
</html>