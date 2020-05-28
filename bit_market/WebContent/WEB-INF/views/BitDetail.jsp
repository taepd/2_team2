<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<script type="text/javascript">
	 
	 $(function() {
		 
		 
		 
		 
		 
		 
		 
		 function PrintData(data){
			 
			 
				var a = "";
				$.each(data, function(){
					console.log(data.scstate)
						if(data.scstate == 'Y') {
							a += '<div style="border-bottom:1px solid darkgray; margin-bottom: 15px;">'
							   + '<div>비밀글 입니다.</div></div>';
						}else {
							a += '<div style="border-bottom:1px solid darkgray; margin-bottom: 15px;">'
							   + '<input type="hidden" id="id" name="id" value="'+this.id+'"/>'
			                   + '<div class="commentInfo'+this.rpindex+'">'+'댓글번호 : '+this.rpindex+' /'
			                  
			                   + ' 작성자 : '+this.nick
							                    
			                   + '<button id="getContent" no="'+this.rpindex+'">수정</button>'
			                   + '<button id="deleteReply" no="'+this.rpindex+'">삭제</button>'
			                   + '<div class="commentContent'+this.rpindex+'"> <p> 내용 : '+this.content +'</p>'
			                   + '</div></div>';
						}
				});
				
			    $('#replyall').html(a);
			    $('#message').val("");
			}
		 
		 //댓글목록 불러오기
		 function getReplyList() {
			 let data = {bdindex : "${param.bdindex}"};
			 $.ajax(
						{
							url : "BitReplyList.bit",  
							dataType : "JSON",           
							type : "POST",
							data : data ,
							success : function(responsedata)
							{
								
								PrintData(responsedata);		
							}
						}	
				      );
		}
		 
		 
		 
		 
		//댓글 추가
		$('#writeReply').on("click",function(){
			if($.trim($('#message').val()) == "")
			{
				alert("댓글을 입력하세요.");
				$('#message').focus();
				return false;
			}
			let data = {
					      bdindex  : "${param.bdindex}" ,
					      id : "${sessionScope.id }",
					      content : $.trim($('#message').val()),
					      scstate : $("input:checkbox[name='scstate']:checked").val()

			            };
			console.log(data);
			$.ajax(
					{
						url : "BitReplyWriteOk.bit",  
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
			let sessionId = "<%=session.getAttribute("id") %>";
			
			if(sessionId == $('#id').val()) {
			
				let data = {
					      id  : "${sessionScope.id }" ,
					      rpindex : $(this).attr("no"),
					      bdindex  : "${param.bdindex}"
				            };
				console.log(data);
				$.ajax(
						{
							url : "BitReplyDeleteOk.bit",  
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
						url : "BitReplyUpdateOk.bit",  
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
<body class="body-wrapper">
<c:set var="board" value="${requestScope.board}"/>
<c:set var="userlist" value="${requestScope.userlist}"/>
<c:set var="ctlist" value="${requestScope.ctlist}"/>

<c:forEach var="user" items="${userlist }">
	<c:if test="${sessionScope.id == user.id }">
		<c:set var="nick" value="${user.nick }"/>
	</c:if>
</c:forEach>
	<section class="section-sm" id="maxwidth">
		<!-- Container Start -->
			<div class="col-md-12" style="background-color: white;">
				<div class="row mt-30" >
					<!-- Left sidebar -->
					<div class="col-sm-12 col-md-7" >
						<div class="product-details">
							<div id="carouselExampleIndicators" class="product-slider carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner" >
									<div class="carousel-item active" id="detailpro">
										<img class="d-block w-100" style="height: 100%;" src="images/products/products-1.jpg"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="height: 100%;" src="images/products/products-2.jpg"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="height: 100%;" src="images/products/products-3.jpg"
											alt="Third slide">
									</div>
								</div>
								<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
									data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
									data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>

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
								<div class= "col-sm-12 col-md-2" >
									<img class="rounded-circle" style="width: inherit; max-width: 100%; margin-bottom: 30px;" src="images/user/user-thumb.jpg" alt="">
									
								</div>
								<div class="col-sm-12 col-md-10" >
								
								<c:forEach var="user" items="${userlist}">
								<c:if test="${board.id == user.id}">
								<h4><a href="">${user.nick}</a></h4>
									<p class="member-time">${user.loc}</p>
									</c:if>
								</c:forEach>
								</div>
							</div>
							<c:if test="${board.id == sessionScope.id}">
							<a href="BitUpdate.bit"><button>수정하기</button></a>
							<a href="BitUpdate.bit"><button>삭제하기</button></a>
							</c:if>
						
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
						<label for="message">${nick }</label>
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

<%@ include file="/Include/footer.jsp"%>
</body>

</html>