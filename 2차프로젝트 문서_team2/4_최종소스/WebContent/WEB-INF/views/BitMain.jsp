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
		
		//검색결과 텍스트
		changeText();
		
		
		//카테고리 목록 불러오기
		$.ajax({
			type : "get",
			url : "Category.bit",
			dataType : "json",
			success : function(response) {
				
				let select = "<select class='nice-select' name='category' id='categorycss'><option value='선택없음' selected>카테고리 선택</option>";
				
				$.each(response.categorylist, function(index, obj) {
					
					if (index == 0) {
						select += "<option value='"+obj+"'>" + obj
								+ "</option>";
					} else {
						select += "<option value='"+obj+"'>" + obj
								+ "</option>";
					}

				})
				$('#selecttag').html(select);
			}

		});
		
		//카테고리별 셀렉트
		$('#selecttag').change(function() {
			isEnd = false;
			
			$('#searchContent').val("");
			changeText();
			if($('#selecttag option:selected').val() == "선택없음"){
				$(location).attr('href',"BitImgList.bit");
			}
			
			var data = {ctname : $('#selecttag option:selected').val(),
						ps : 6,
				    	cp : 1
				    	
			
						};
						console.log(data);
			
			$.ajax({
				
				type:"get",
				data : data,
				url:"BitBoardListAjax.bit",
				dataType : "json",                                                
				success:function(responsedata){
					$('#boardlist').empty();
					$.each(responsedata.boardArr,function(index,obj){		
						let href = "";
						let strArray = obj.img.split(',');
						$.each(responsedata.userArr, function(index2, obj2) {	
							if(obj.id == obj2.id){
								href = "<i class='fa fa-location-arrow'></i>"+obj2.loc+
										"<br><b><a href='BitUserProfileView.bit?id="+obj2.id+"'>"+obj2.nick+"</a></b>";
										
							}
						});
						
						$('#boardlist').append(		
								"<div class='col-sm-12 col-lg-4 col-md-6'>"+
							
								"<div class='product-item bg-light'>"+
									"<div class='card'>"+
										"<div class='thumb-content'>"+
											
											"<a href='BitBoardDetail.bit?bdindex="+obj.bdindex+"'>"+
												"<img class='card-img-top img-fluid' src='upload/"+strArray[0]+"'" +
													"alt='Card image cap' style=\"height:250px\">"+
											"</a>"+
										"</div>"+
										"<div class='card-body'>"+
											"<h4 class='card-title' id='cdtitle'><a href='BitBoardDetail.bit?bdindex="+obj.bdindex+"'>"+obj.title+"</a></h4>"+
													
											"<ul class='list-inline product-meta'>"+
												"<li class='list-inline-item'>"+
												href+
												"</li>"+
												"<li class='list-inline-item'>"+
													"<span><i class='fa fa-calendar'></i>"+obj.rtime+"</span>"+
												"</li>"+
											"</ul>"+
											"<p class='card-text'>"+obj.price+"</p>"+
											"<p class='card-text'>"+obj.ctname+"</p>"+
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
				}
			});
		});
		
		
		//거리 순, 최신 순 정렬
		$('#sort').change(function() {
			isEnd = false;
			var target="";
			$('#searchContent').val("");
			changeText();
			if($('#sort option:selected').val() == "선택없음"){
				$(location).attr('href',"BitImgList.bit");
			}else if($('#sort option:selected').val() == "recent"){
				target="BitBoardRtimeListAjax.bit"
			}else if($('#sort option:selected').val() == "distance"){
				target="BitBoardUserListAjax.bit";
			}
			
			var data = {ctname : $('#sort option:selected').val(),
						ps : 6,
				    	cp : 1
				    	
			
						};
						console.log(data);
			
			$.ajax({
				
				type:"get",
				data : data,
				url: target,
				dataType : "json",                                                
				success:function(responsedata){
					$('#boardlist').empty();
					$.each(responsedata.boardArr,function(index,obj){		
						let href = "";
						let strArray = obj.img.split(',');
						if(obj.dist=='0')return true;//본인 게시물 제외하는게 나을까?
						   //테이블 하나 더 조인하기 힘들어서
								let ctname =""; 
						   switch(obj.ctcode){
						   case "1": ctname="디지털/가전";
						   break;
						   case "2": ctname="스포츠/레저";
						   break;
						   case "3": ctname="의류/잡화";
						   break;
						   case "4": ctname="뷰티/미용";
						   break;
						   case "5": ctname="생활/가구";
						   break;
						   }
								
						$.each(responsedata.userArr, function(index2, obj2) {	
							if(obj.id == obj2.id){
								href = "<i class='fa fa-location-arrow'></i>"+obj2.loc+
										"<br><b><a href='BitUserProfileView.bit?id="+obj2.id+"'>"+obj2.nick+"</a></b>";
										
							}
						});
						
						$('#boardlist').append(		
								"<div class='col-sm-12 col-lg-4 col-md-6'>"+
							
								"<div class='product-item bg-light'>"+
									"<div class='card'>"+
										"<div class='thumb-content'>"+
											
											"<a href='BitBoardDetail.bit?bdindex="+obj.bdindex+"'>"+
												"<img class='card-img-top img-fluid' src='upload/"+strArray[0]+"'" +
													"alt='Card image cap' style=\"height:250px\">"+
											"</a>"+
										"</div>"+
										"<div class='card-body'>"+
											"<h4 class='card-title' id='cdtitle'><a href='BitBoardDetail.bit?bdindex="+obj.bdindex+"'>"+obj.title+"</a></h4>"+
													
											"<ul class='list-inline product-meta'>"+
												"<li class='list-inline-item'>"+
												href+
												"</li>"+
												"<li class='list-inline-item'>"+
													"<span><i class='fa fa-calendar'></i>"+obj.rtime+"</span>"+
												"</li>"+
											"</ul>"+
											"<p class='card-text'>"+obj.price+"</p>"+
											"<p class='card-text'>"+ctname+"</p>"+
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
						if(obj.dist==null){
							return true;
						}else if(parseFloat(obj.dist)<=3){
							$('.card-body').css('background-color','#a1f9b785');
						}else if(parseFloat(obj.dist)<=6){
							$('.card-body').css('background-color','#a1e5f985');
						}else if(parseFloat(obj.dist)<=9){
							$('.card-body').css('background-color','#a1a4f985');
						}else if(parseFloat(obj.dist)<=12){
							$('.card-body').css('background-color','#f9a1ee85');
						}
						
						
						
						
						console.log(obj.dist);
				});
				}
			});
		});
		
		  
		//무한스크롤 스크롤에 따라 동적인 변화 발생
		$(window).scroll(function() {
			
				var maxHeight = $(document).height();
				var currentScroll = window.scrollY + window.innerHeight;
					
			 	if (currentScroll == maxHeight) {
			 			
			    	 	fetchList();
			 	}
			
		 });
		
		//스크롤이 바닥에 닿았을 때 비동기로 리스트 불러오기
		var fetchList = function() {
			if(isEnd == true){
	            return;
	        }
		
		    let data = {ps : 6,
					    cp : cpval,
					    searchContent : $('#searchContent').val(),
					    ctname : $('#selecttag option:selected').val()
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
						let strArray = obj.img.split(',');
						$.each(responsedata.userArr, function(index2, obj2) {	
							if(obj.id == obj2.id){
								href = "<i class='fa fa-location-arrow'></i>"+obj2.loc+
								"<b><a href='BitUserProfileView.bit?id="+obj2.id+">"+obj2.nick+"</a></b>";
										
							}
						});
						$('#boardlist').append(		
								"<div class='col-sm-12 col-lg-4 col-md-6'>"+
							
								"<div class='product-item bg-light'>"+
									"<div class='card'>"+
										"<div class='thumb-content'>"+
											
											"<a href='BitBoardDetail.bit?bdindex="+obj.bdindex+"'>"+
												"<img class='card-img-top img-fluid' src='upload/"+strArray[0]+"'" +
													"alt='Card image cap'>"+
											"</a>"+
										"</div>"+
										"<div class='card-body'>"+
											"<h4 class='card-title' id='cdtitle'><a href='BitBoardDetail.bit?bdindex="+obj.bdindex+"'>"+obj.title+"</a></h4>"+
													
											"<ul class='list-inline product-meta'>"+
												"<li class='list-inline-item'>"+
												href+
												"</li>"+
												"<li class='list-inline-item'>"+
													"<span><i class='fa fa-calendar'></i>"+obj.rtime+"</span>"+
												"</li>"+
											"</ul>"+
											"<p class='card-text'>"+obj.price+"</p>"+
											"<p class='card-text'>"+obj.ctname+"</p>"+
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
					if(responsedata.boardArr.length < 6) {
						isEnd = true;
						cpval = 2;
					} else {
						cpval++
					}
				}
				
		      });
				  
		}
		
		//검색결과 텍스트 변화
		function changeText() {
			let a = "";
			console.log($('#searchContent').val())
			if($('#searchContent').val() == null || $('#searchContent').val() == "") {
				a = "<h3>상품 리스트</h3>"
			
			} else {
				a = "<h3>"+$('#searchContent').val()+"의 검색 결과"+"</h3>";
				
			}
			$('#searchText').html(a);
		}
		
		
		
		
		
		/*
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
		
		/*
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
		
		*/
	
		
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
	<input type="hidden" id="searchContent" value="${requestScope.searchContent }">
	<section class="section-sm" id="maxwidth">
		<div class="col-md-12">
			<div class="search-result" id="searchText">
			
			
					<h3>상품 리스트</h3>
				
		
			</div>
		</div>

		<div class="col-md-12">
		<!--  
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
										-->
			<div class="category-search-filter">
				<div class="row">
					<div class="col-md-6">
						<div id="selecttag">
						</div>

					</div>
					<div class="col-md-6">
				
				
									
						<div class="view">
							<select name='sort' id='sort'>
								<option value='선택없음' selected>정렬 방식 선택</option>
								<option value="recent">최신 순 </option>
								<option value="distance">거리 순</option>
							</select>
						
							<ul class="list-inline view-switcher">
								<li class="list-inline-item">
									<a href="BitImgList.bit"><i class="fa fa-th-large fa-2x"></i></a>
								</li>
								<li class="list-inline-item">
									<a href="BitNorList.bit"><i class="fa fa-reorder fa-2x"> </i></a>
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
									<c:forTokens var="imglist" items="${board.img}" delims="," varStatus="status">
							<c:if test="${status.first}">
										
										<img class="card-img-top img-fluid" src="upload/${imglist }"
											alt="Card image cap" style="height:250px">
								
							</c:if>
						</c:forTokens>
									
									
										
									</a>
								</div>
								<div class="card-body">
									<h4 class="card-title" id="cdtitle"><a href="BitBoardDetail.bit?bdindex=${board.bdindex}">${board.title}</a></h4>
									<ul class="list-inline product-meta">
										<li class="list-inline-item">
												<c:forEach var="user" items="${userlist}">
													<c:if test="${user.id == board.id}">
														<i class="fa fa-location-arrow"></i>${user.loc}
														<br>
														<b> <a
															href="BitUserProfileView.bit?id=${user.id}">${user.nick}</a>
														</b>
													</c:if>
												</c:forEach>
										</li>
										<li class="list-inline-item">
											<span><i class="fa fa-calendar"></i>${board.rtime }</span>
										</li>
									</ul>
									<p class="card-text">${board.price} </p>
									<p class="card-text">${board.ctname} </p>
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
			<!--  
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
										
										<c:if test="${cpage < pagecount}">
					
											<li class="page-item"><a class="page-link" href="BitBoardList.bit?cp=${cpage+1}&ps=${pagesize}" cp="${cpage+1}" ps="${pagesize}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
										</c:if>
					</ul>
				</nav>
			</div>
			-->
		</div>
		
	</section>
<%@ include file="/Include/footer.jsp"%>
</body>

</html>