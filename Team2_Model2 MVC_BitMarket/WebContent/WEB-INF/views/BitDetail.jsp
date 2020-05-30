<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<script type="text/javascript">
	 
	 $(function() {
		 
		 //상세 페이지 댓글 불러오기
		 getReplyList();
		 
		// $(".owl-carousel").owlCarousel();
		 
		 
		 
		 function PrintData(data){
			 
			 	let sessionId = "<%=session.getAttribute("id") %>";
				let a = "";
				$.each(data, function(){
					//depth 체크
					let depthCss = "";
					if(this.depth == 1) {
						depthCss = "padding-left:45px";
					}
					
					//sessionid랑 댓글 id랑 같은 경우
					let idCss = "";
					if(sessionId == this.id) {
						idCss = "background-color:#d0dcf3";
					}
					
					//삭제유무 체크
					if(this.delstate == 'Y') {
						a += '<div style="border-bottom:1px solid darkgray; padding: 15px 0;'+depthCss+';'+idCss+';" name="reply_'+this.rpindex+'">'
							   + '<p>삭제된 댓글 입니다.</p></div>';
						return true;
					}
					
					//판매자의 경우
					if($('#boardid').val() == sessionId) {
						a += '<div style="border-bottom:1px solid darkgray; padding: 15px 0;'+depthCss+';'+idCss+';" name="reply_'+this.rpindex+'">'
						   + '<input type="hidden" id="id" name="id" value="'+this.id+'"/>'
		                   + '<div class="commentInfo'+this.rpindex+'">'
		                  
		                   + ' 작성자 : '+this.nick
						                    
		                   + '<button id="getContent" rpindex="'+this.rpindex+'" userid="'+this.id+'" content="'+this.content+'">수정</button>'
		                   + '<button id="deleteReply" rpindex="'+this.rpindex+'" userid="'+this.id+'">삭제</button>'
		                   + '<button id="getRewrite" rpindex="'+this.rpindex+'" userid="'+this.id+'" nick="'+this.nick+'">답글</button></div>'
		                   + '<div class="commentContent'+this.rpindex+'"> <p> 내용 : '+this.content +'</p>'
		                   + '</div></div>';
		                   return true;
					}
					
					
					
					//
	
						if(this.scstate == 'Y' && sessionId != this.id) {
							a += '<div style="border-bottom:1px solid darkgray; padding: 15px 0;'+depthCss+';'+idCss+';" name="reply_'+this.rpindex+'">'
							   + '<p>비밀글 입니다.</p></div>';
						}else {
							a += '<div style="border-bottom:1px solid darkgray; padding: 15px 0;'+depthCss+';'+idCss+';" name="reply_'+this.rpindex+'">'
							   + '<input type="hidden" id="id" name="id" value="'+this.id+'"/>'
			                   + '<div class="commentInfo'+this.rpindex+'">'
			                  
			                   + ' 작성자 : '+this.nick
							                    
			                   + '<button id="getContent" rpindex="'+this.rpindex+'" userid="'+this.id+'" content="'+this.content+'">수정</button>'
			                   + '<button id="deleteReply" rpindex="'+this.rpindex+'" userid="'+this.id+'">삭제</button>'
			                   + '<button id="getRewrite" rpindex="'+this.rpindex+'" userid="'+this.id+'" nick="'+this.nick+'">답글</button></div>'
			                   + '<div class="commentContent'+this.rpindex+'"> <p> 내용 : '+this.content +'</p>'
			                   + '</div></div>';
						}
					
					
					console.log(this.depth)
					
					
					
				});
				
			    $('#replyall').html(a);
			    $('#message').val("");
			    $('input[name=scstate]').prop('checked', false);

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
			

				if(confirm("삭제하시겠습니까?")) {

					let sessionId = "<%=session.getAttribute("id") %>";
					console.log($(this).attr("userid"), "<%=session.getAttribute("id") %>");
					if(sessionId == $(this).attr("userid")) {
					
						let data = {
							      id  : "${sessionScope.id }" ,
							      rpindex : $(this).attr("rpindex"),
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

				}else{

					return;

				}

					

		});
	
		
		//댓글 수정창 불러오기
		$(document).on("click","#getContent",function(){
			let sessionUId = "<%=session.getAttribute("id") %>";
			let a ='';
			if(sessionUId == $(this).attr("userid")) { //작성자와 sessionid 비교
				  a += '<div class="input-group">';
				    a += '<input type="text" class="form-control" name="content_'+$(this).attr("rpindex")+'" value="'+$(this).attr("content")+'"/>';
				    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" id="updateReply" rpindex="'+$(this).attr("rpindex")+'">수정</button> </span>';
				    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" id="updateCancel" rpindex="'+$(this).attr("rpindex")+'" content="'+$(this).attr("content")+'">취소</button> </span>';
				    a += '</div>';
				    
				    $('.commentContent'+$(this).attr("rpindex")).html(a);
			}else {
				alert("ID가 일치하지 않습니다.");
			}
			
		});
		
		//댓글 수정하기
		$(document).on("click","#updateReply",function(){
			let data = {
				      id  : "${sessionScope.id }",
				      rpindex : $(this).attr("rpindex"),
				      bdindex  : "${param.bdindex}",
				      content : $('[name=content_'+$(this).attr("rpindex")+']').val()
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
						}
					}	
			      );
		});
		
		//댓글 수정 취소하기
		$(document).on("click","#updateCancel",function(){
			let a = '<p> 내용 : '+$(this).attr("content") +'</p>';
			$('.commentContent'+$(this).attr("rpindex")).html(a);
			
		});
		
		//대댓글 창 불러오기
		$(document).on("click","#getRewrite",function(){
			
			if($('[name=reply_form_'+$(this).attr("rpindex")+']').length > 0) {
				return;
			} else {
				let a ='';
				let sessionNick = "<%=session.getAttribute("nick") %>";
					  
					a += '<div name="reply_form_'+$(this).attr("rpindex")+'">'+
					'<label for="message">'+sessionNick+'</label>'+
						'<textarea class="form-control" name="remessage_'+$(this).attr("rpindex")+'" rows="8"></textarea>'+
						'<div class="d-flex flex-row-reverse">'+
						'<button class="btn btn-transparent" id="rewriteCancel">취소</button>'+
					'<button class="btn btn-transparent" id="rewriteReply" rpindex="'+$(this).attr("rpindex")+'">등록</button>'+
					
					'<div class="form-group form-check">'+
						'<label class="form-check-label">'+
						  '<input class="form-check-input" type="checkbox" name="rescstate_'+$(this).attr("rpindex")+'" value="Y"> 비밀댓글 등록하기'+
						'</label>'+
					'</div>'+
				'</div>'+
					'</div>';
					 $('[name=reply_'+$(this).attr("rpindex")+']').after(a);
			}
			
		});
		
		//대댓글 추가
		$(document).on('click','#rewriteReply',function(){
			
			if($.trim($('[name=remessage_'+$(this).attr("rpindex")+']').val()) == ""){
				alert("댓글을 입력하세요.");
				$('[name=remessage_'+$(this).attr("rpindex")+']').focus();
				return false;
			}
			let data = {
					      bdindex  : "${param.bdindex}" ,
					      rpindex  : $(this).attr("rpindex") ,
					      id : "${sessionScope.id }",
					      content : $.trim($('[name=remessage_'+$(this).attr("rpindex")+']').val()),
					      scstate : $("input:checkbox[name='rescstate_"+$(this).attr("rpindex")+"']:checked").val()
					      

			            };
			console.log(data);
			$.ajax(
					{
						url : "BitReplyReWriteOk.bit",  
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
		
		//구매완료 모달
		$('#trOver').on('click', function() {
			 $("#trModal").modal();
		})
		
		
		
	 });			
	
	
	</script>
</head>
<body class="body-wrapper">
<c:set var="board" value="${requestScope.board}"/>
<c:set var="userlist" value="${requestScope.userlist}"/>
<c:set var="ctlist" value="${requestScope.ctlist}"/>
<c:set var="nickIdTrlist" value="${requestScope.nickIdTrlist}"/>
<c:set var="oldRepId" value="${requestScope.trRepId}"/>
<c:set var="oldRepNick" value="${requestScope.trRepNick }"/>




<c:set var="token" value="${board.img}" />
<input type="hidden" name = "boardid" id= "boardid" value="${board.id}">
	<section class="section-sm" id="maxwidth">
		<!-- Container Start -->
		<div class="col-md-12" style="background-color: white;">
			<div class="row mt-30">
					<!-- Left sidebar -->
				<div class="col-sm-12 col-md-7">
						<div id="carousel" class="owl-carousel owl-theme">
							<c:forTokens var="imglist" items="${token}" delims=",">
							<c:if test="${imglist !='null'}">
								<div class="item" style="height:400px;">
									<img class="d-block w-100" style="max-height: 400px;"
										src="upload/${imglist}" onError ="javascript:this.src='upload/noimage.jpg'"alt="slide img">
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
										  <a href="BitUserProfileView.bit?id=${user.id}">${user.nick}</a>  

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

<%@ include file="/Include/footer.jsp"%>
</body>

</html>