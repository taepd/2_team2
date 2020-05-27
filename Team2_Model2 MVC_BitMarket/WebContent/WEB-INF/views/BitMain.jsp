<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
	<meta charset="utf-8">
	<title>비트마켓 메인</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    
    var state = 0;
    var cpval = 2;
    
    var isEnd = false;
	$(function(){
		  
		
		$(window).scroll(function() {
			if(state == 0) {
				var maxHeight = $(document).height();
				var currentScroll = window.scrollY + window.innerHeight;
					
			 	if (currentScroll == maxHeight) {
			 			
			    	 	fetchList();
			    		
			 	}
			 	
			}
		 });
		
		
		var fetchList = function() {
			if(isEnd == true){
	            return;
	        }
		
		    let data = {ps : 5,
					    cp : cpval
			           };	
			 console.log(data);
			$.ajax({
				url:"BitBoardListAjax.bit",
				data: data,
				type:"POST",		
				dataType: "json",
				success:function(responsedata){ 
					$.each(responsedata.boardArr,function(index,obj){		
						var href = "";
						$.each(responsedata.userArr, function(index2, obj2) {	
							if(obj.id == obj2.id){
								href = "<a href=''><i class='fa fa-location-arrow'></i>"+obj2.loc+"</a>";
							}		
						});
						$('#boardlist').append(		
								"<div class='col-sm-12 col-lg-4 col-md-6'>"+
							
								"<div class='product-item bg-light'>"+
									"<div class='card'>"+
										"<div class='thumb-content'>"+
											
											"<a href='BitBoardDetail.bit?bdindex=${board.bdindex}'>"+
												"<img class='card-img-top img-fluid' src='images/products/products-1.jpg'" +
													"alt='Card image cap'>"+
											"</a>"+
										"</div>"+
										"<div class='card-body'>"+
											"<h4 class='card-title' id='cdtitle'><a href='BitBoardDetail.bit?bdindex=${board.bdindex}'>"+obj.title+"</a></h4>"+
											"<ul class='list-inline product-meta'>"+
												"<li class='list-inline-item'>"+
												href+
												"</li>"+
												"<li class='list-inline-item'>"+
													"<span><i class='fa fa-calendar'></i>"+obj.rtime+"</span>"+
												"</li>"+
											"</ul>"+
											"<p class='card-text'>"+obj.price+"</p>"+
											"<div class='product-ratings'>"+
												"<ul class='list-inline'>"+
													"<li class='list-inline-item selected'><i class='fa fa-heart'></i></li>"+
												"</ul>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</div>"
								
						   
						);
					});
					if(responsedata.boardArr.length < 5) {
						isEnd = true;
					} else {
						cpval++
					}
				}
				
		      });
				  
		}
		
		//비동기로 리스트 조회
		function change(){
			
			if(state == 1) {
			let data = {ps : $('#paging option:selected').val(),
					    cp : $('#cp').val() 
			           };		
			$.ajax({
				url:"BitBoardListAjax.bit",
				data: data,
				type:"POST",		
				dataType: "json",
				success:function(responsedata){ 
					$('#boardlist').empty();
					
					
					
					
					
					$.each(responsedata.boardArr,function(index,obj){	
						
						var href = "";
						$.each(responsedata.userArr, function(index2, obj2) {
							
							if(obj.id == obj2.id){
								href = "<a href=''><i class='fa fa-location-arrow'></i>"+obj2.loc+"</a>";
							}
							
						})
						$('#boardlist').append(	
								
								"<div class='col-sm-12 col-lg-4 col-md-6'>"+
							
								"<div class='product-item bg-light'>"+
									"<div class='card'>"+
										"<div class='thumb-content'>"+
											
											"<a href=''>"+
												"<img class='card-img-top img-fluid' src='images/products/products-1.jpg'" +
													"alt='Card image cap'>"+
											"</a>"+
										"</div>"+
										"<div class='card-body'>"+
											"<h4 class='card-title' id='cdtitle'><a href=''>"+obj.title+"</a></h4>"+
											"<ul class='list-inline product-meta'>"+
												"<li class='list-inline-item'>"+
												href+
												
													
												"</li>"+
												"<li class='list-inline-item'>"+
													"<a href=''><i class='fa fa-calendar'></i>"+obj.rtime+"</a>"+
												"</li>"+
											"</ul>"+
											"<p class='card-text'>"+obj.price+"</p>"+
											"<div class='product-ratings'>"+
												"<ul class='list-inline'>"+
													"<li class='list-inline-item selected'><i class='fa fa-heart'></i></li>"+
												"</ul>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</div>"
								
						   
						);
					});
			
					
					//페이지 번호 처리
					page(cp=$('#cp').val());
			   }
				
			
			}); 
			}
		}
	
			
		
			
		
		
			//페이징 비동기
			$('#paging').change(change);
			
			//page()
			function page(cp){
				console.log("cp"+cp);
				$('#pagingview').empty();
				var pagesize = $('#paging option:selected').val();
				var totalboardcount = $('#totalboardcount').val();
				
				var pagecount;
			
				if((totalboardcount % pagesize) == 0){
					pagecount = totalboardcount/pagesize;
				}else if(totalboardcount/pagesize<1){
					pagecount=1;
				}else{
				
					pagecount = Math.floor(totalboardcount/pagesize + 1); 
				}
				
				console.log('pagecount = '+pagecount);
				let tmp="";
				
				if(cp>1){
					tmp += '<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp=${cpage-1}&ps='+pagesize+'" cp="'+(parseInt(cp)-1)+'" ps="${pagesize}" aria-label="Previous">'
							+'<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>';
				}
				//page 목록 나열하기
				for(var i=1;i<=pagecount; i++){
					if(cp==i){
						tmp +=('<li class="page-item active"><a class="page-link" href="BitBoardList.bit?cp='+i+'&ps='+pagesize+'" cp="'+i+'" ps="'+pagesize+'">'+i+'</a></li>');
					}else{
						tmp +=('<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp='+i+'&ps='+pagesize+'" cp="'+i+'" ps="'+pagesize+'" >'+i+'</a></li>');
					}
				}
				//다음 링크
				if(cp<pagecount){
					console.log(cp+1);
					tmp += '<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp=${cpage+1}&ps='+pagesize+'" cp="'+(parseInt(cp)+1)+'" ps="${pagesize}" aria-label="Next">'
							+'<span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>';
				};
			
				$('#pagingview').append(tmp);
			};
			
			
			
			
			
			//페이지 링크 비동기
			$(document).on('click', '#pagingview a', function(e){
				if(state == 1) {
				e.preventDefault();
				let data = {ps : $(this).attr('ps'),
					        cp : $(this).attr('cp')
			           };		
				$.ajax({
					url:"BitBoardListAjax.bit",
					data: data,
					type:"POST",		
					dataType: "json",
					success:function(responsedata){ 
						$('#boardlist').empty();
						
						
						
						
						
						$.each(responsedata.boardArr,function(index,obj){	
							
							var href = "";
							$.each(responsedata.userArr, function(index2, obj2) {
								
								if(obj.id == obj2.id){
									href = "<a href=''><i class='fa fa-location-arrow'></i>"+obj2.loc+"</a>";
								}
								
							})
							$('#boardlist').append(	
									
									"<div class='col-sm-12 col-lg-4 col-md-6'>"+
								
									"<div class='product-item bg-light'>"+
										"<div class='card'>"+
											"<div class='thumb-content'>"+
												
												"<a href=''>"+
													"<img class='card-img-top img-fluid' src='images/products/products-1.jpg'" +
														"alt='Card image cap'>"+
												"</a>"+
											"</div>"+
											"<div class='card-body'>"+
												"<h4 class='card-title' id='cdtitle'><a href=''>"+obj.title+"</a></h4>"+
												"<ul class='list-inline product-meta'>"+
													"<li class='list-inline-item'>"+
													href+
													
														
													"</li>"+
													"<li class='list-inline-item'>"+
														"<a href=''><i class='fa fa-calendar'></i>"+obj.rtime+"</a>"+
													"</li>"+
												"</ul>"+
												"<p class='card-text'>"+obj.price+"</p>"+
												"<div class='product-ratings'>"+
													"<ul class='list-inline'>"+
														"<li class='list-inline-item selected'><i class='fa fa-heart'></i></li>"+
													"</ul>"+
												"</div>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"
									
							   
							);
						});
			
						console.log(data.cp);
						//페이지 번호 처리
						page(parseInt(data.cp));
				   }
				
			
			}); 
				}
				
			});
		
		
			$('#imageOn').click(function() {
				$('#pagingform').css('display',"none");
				$('#pagingNav').css('display',"none");
				state = 0;
				cpval = 1;
				$('#boardlist').empty();
				isEnd = false;
				fetchList();
				
			});
			
			$('#normalOn').click(function() {
				$('#pagingform').css('display',"block");
				$('#pagingNav').css('display',"block");
				state = 1;
				change();
			});
		
		
		
		
		
	});
	
    </script>
</head>    	
	
	
	




<body class="body-wrapper">
<%@ include file="/Include/nav.jsp"%>
<!-- set 하기 -->
	<c:set var="boardlist" value="${requestScope.boardlist}" />
	<c:set var="userlist" value="${requestScope.userlist}" />
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="cpage" value="${requestScope.cpage}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="totalboardcount" value="${requestScope.totalboardcount}" />
	<input type="hidden" id="cp" name="${cpage}" value="${cpage}"/>
	<input type="hidden" id="pagecount" name="${pagecount}" value="${pagecount}"/>
	<input type="hidden" id="totalboardcount" name="${totalboardcount}" value="${totalboardcount}"/>

	<section class="section-sm" id="maxwidth">
		<div class="col-md-12">
			<div class="search-result">
				<h3>상품 리스트</h3>

			</div>
		</div>

		<div class="col-md-12">
								<form name="list" style="display: none;" id="pagingform" >
											<select name="ps" id="paging">
													<c:forEach var="i" begin="5" end="20" step="5">
														<c:choose>
															<c:when test="${pagesize == i}">
																<option value="${i}" selected>${i}건</option>
															</c:when>
															<c:otherwise>
																<option value="${i}">${i}건</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select> 
										</form>
			<div class="category-search-filter">
				<div class="row">
					<div class="col-md-6">
						<select id="selecttag">
							<option>카테고리 선택</option>
							<option value="1">디지털/가전</option>
							<option value="2">뷰티/미용</option>
							<option value="4">Highest Price</option>
						</select>
					</div>
					
					<div class="col-md-6">
				
				
									
						<div class="view">
						
							<ul class="list-inline view-switcher">
								<li class="list-inline-item">
									<a href="javascript:void(0);" id="imageOn" ><i class="fa fa-th-large"></i></a>
								</li>
								<li class="list-inline-item">
									<a href="javascript:void(0);" id="normalOn"><i class="fa fa-reorder" > </i></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			

			<div class="product-grid-list">
				<div class="row mt-30" id="boardlist">
					<c:forEach var="board" items="${boardlist}">
						<div class="col-sm-12 col-lg-4 col-md-6">
						<!-- product card -->
						<div class="product-item bg-light">
							<div class="card">
								<div class="thumb-content">
									<!-- <div class="price">$200</div> -->
									<a href="BitBoardDetail.bit?bdindex=${board.bdindex}">
										<img class="card-img-top img-fluid" src="images/products/products-1.jpg"
											alt="Card image cap">
									</a>
								</div>
								<div class="card-body">
									<h4 class="card-title" id="cdtitle"><a href="BitBoardDetail.bit?bdindex=${board.bdindex}">${board.title}</a></h4>
									<ul class="list-inline product-meta">
										<li class="list-inline-item">
												<c:forEach var="user" items="${userlist}">
													<c:if test="${user.id == board.id}">
														<a href=""><i class="fa fa-location-arrow"></i>${user.loc }</a>
													</c:if>
												</c:forEach>
										</li>
										<li class="list-inline-item">
											<span><i class="fa fa-calendar"></i>${board.rtime }</span>
										</li>
									</ul>
									<p class="card-text">${board.price} </p>
									<div class="product-ratings">
										<ul class="list-inline">
											<li class="list-inline-item selected"><i class="fa fa-heart"></i></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>

				</div>
			</div>
			<div class="pagination justify-content-center" >
				<nav aria-label="Page navigation example" style="display: none;" id="pagingNav">
					<ul class="pagination" id="pagingview" >
									<c:if test="${cpage > 1}">
											<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp=${cpage-1}&ps=${pagesize}" cp="${cpage-1}" ps="${pagesize}" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
									</c:if>
										
									<c:forEach var="i" begin="1" end="${pagecount}" step="1">
										<c:choose>
											<c:when test="${cpage==i }">
												<li class="page-item active"><a class="page-link" href="BitBoardList.bit?cp=${i}&ps=${pagesize}" cp="${i}" ps="${pagesize}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp=${i}&ps=${pagesize}" cp="${i}" ps="${pagesize}" >${i}</a></li>
											</c:otherwise>
										</c:choose>

										</c:forEach>
										<!--다음 링크 -->
										<c:if test="${cpage < pagecount}">
					
											<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp=${cpage+1}&ps=${pagesize}" cp="${cpage+1}" ps="${pagesize}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
										</c:if>
					</ul>
				</nav>
			</div>
		</div>
		
	</section>
<%@ include file="/Include/footer.jsp"%>
</body>

</html>