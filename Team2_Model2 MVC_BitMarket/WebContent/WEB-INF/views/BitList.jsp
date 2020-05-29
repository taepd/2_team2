	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

	$(function() {

		$.ajax({
			type : "get",
			url : "Category.bit",
			dataType : "json",
			success : function(response) {
				
				let select = "<select name='category' id='categorycss'><option value='선택없음' selected>카테고리 선택</option>";

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
		
		
		$('#selecttag').change(function() {
			
			if($('#selecttag option:selected').val() == "선택없음"){
				$(location).attr('href',"BitList.bit?cp=${cpage}&ps=${pagesize}");
			}
			
			var data = {ctname : $('#selecttag option:selected').val()};
			console.log(data.ctname)
			
			$.ajax({
				
				type:"get",
				data : data,
				url:"BitSelectCategory.bit",
				dataType : "json",                                                
				success:function(response){
					var href ="";
					var href2="";
					var ct = "";
					console.log(response);
					
					$.each(response.ctjsonlistctcode,function(index,obj){	
						if(obj.ctname == data.ctname){
							console.log(data.ctname)
							ct = "<td class='product-category'><span class='categories'>"+obj.ctname+"</span></td>"
						}
					
					})
					
					$('#boardtable').empty();
					
					$.each(response.ctjsonlist,function(index2,obj2){
							console.log(obj2)
							$.each(response.ctjsinlistuser,function(index3,obj3){
								if(obj2.id == obj3.id){
									href = "<span class='add-id'><strong>판매자</strong>"+obj3.nick+"</span>"
									href2 = "<span class='location'><strong>위치</strong>"+obj3.loc+"</span>"
								}
								
					
							});
							$('#boardtable').append(
									'<tr><td class="product-thumb"><img width="80px" height="auto"'+
											'src="images/products/products-1.jpg alt="image description"></td>'+
										'<td class="product-details">'+
											'<h4 class="title">'
												+'<a href="BitDetail.bit?bdindex='+obj2.bdindex+'&cp=${cpage}&ps=${pagesize}">'+obj2.title+'</a>'+
											'</h4> <span class="add-id"><strong>가격</strong>'+obj2.price+'</span>'+
											'<span><strong>등록일</strong>'+obj2.rtime+'</span>'+
											href + href2 +'</td>'+ct+
										'<td class="action" data-title="Action"><a data-toggle="tooltip" data-placement="top"'+
											'title="Tooltip on top" class="view" href=""> <i class="fa fa-heart"></i></a></td></tr>'
							)	
							
						})
				}
			})
		});
  	
	});

</script>
<body class="body-wrapper">

	<c:set var="boardlist" value="${requestScope.boardlist}" />
	<c:set var="pagesize" value="${requestScope.pagesize}" />
	<c:set var="cpage" value="${requestScope.cpage}" />
	<c:set var="pagecount" value="${requestScope.pagecount}" />
	<c:set var="totalempcount" value="${requestScope.totalboardcount}" />
	<c:set var="userlist" value="${requestScope.userlist}" />
	<c:set var="categorylist" value="${requestScope.categorylist}" />

	<section class="section-sm" id="maxwidth">
		<div class="col-md-12">
			<div class="search-result">
				<h3>'모자' 의 검색 결과 : 총 30건의 상품이 검색 되었습니다.</h3>
			</div>
		</div>



		<div class="col-md-12">
			<div class="category-search-filter">
				<div class="row">
					<div class="col-md-6">
						<div id="selecttag">
						</div>
					</div>
					
					<div class="col-md-3">
						<div id="selecttagggggg"></div>
					</div>
					<div class="col-md-3">
						<div class="view">
							<ul class="list-inline view-switcher">
								<li class="list-inline-item"><a href="javascript:void(0);"><i
										class="fa fa-th-large"></i></a></li>
								<li class="list-inline-item"><a href="BitList.bit"><i
										class="fa fa-reorder"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>



			<!-- Recently Favorited -->
			<div class="dashboard-container my-adslist" id="listtable">
				<table class="table table product-dashboard-table">
					<thead>
						<tr>
							<th>이미지</th>
							<th>내용</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">찜</th>
						</tr>
					</thead>
					<tbody id="boardtable">
						<c:forEach var="board" items="${boardlist}">

							<tr>
								<td class="product-thumb"><img width="80px" height="auto"
									src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h4 class="title">
										<a href="BitDetail.bit?bdindex=${board.bdindex}&cp=${cpage}&ps=${pagesize}">${board.title}</a>
									</h4> <span class="add-id"><strong>가격</strong>${board.price}</span>
									<span><strong>등록일</strong>${board.rtime}</span>
									<c:forEach var="user" items="${userlist}">
										<c:if test="${board.id == user.id}">
											<span class="add-id"><strong>판매자</strong>${user.nick}</span>
											<span class="location"><strong>위치</strong>${user.loc}</span>
										</c:if>
									</c:forEach>
								</td>
								<c:forEach var="category" items="${categorylist}">
									<c:if test="${board.ctcode == category.ctcode}">
										<td class="product-category"><span class="categories">${category.ctname}</span></td>
									</c:if>
								</c:forEach>
								<td class="action" data-title="Action"><a data-toggle="tooltip" data-placement="top"
									title="Tooltip on top" class="view" href=""> <i
										class="fa fa-heart"></i>
								</a></td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>






			<div class="pagination justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:choose>
						<c:when test="${cpage >1}">
						<li class="page-item">
						<a class="page-link" href="BitList.bit?cp=${cpage-1}&ps=${pagesize}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						</c:when>
						<c:otherwise>
						<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="1" end="${pagecount}" step="1">
						<c:choose>
							<c:when test="${cpage==i}">
							<li class="page-item active"><a class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
							<li class="page-item"><a class="page-link" href="BitList.bit?cp=${i}&ps=${pagesize}">${i}</a></li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						<c:choose>
						<c:when test="${cpage < pagecount}">
						<li class="page-item"><a class="page-link" href="BitList.bit?cp=${cpage+1}&ps=${pagesize}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span> 
						<span class="sr-only">Next</span>
						</a></li>
						</c:when>
						<c:otherwise>
						<li class="page-item"><a class="page-link" href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span> 
						<span class="sr-only">Next</span>
						</a></li>
						</c:otherwise>
						</c:choose>
						
					</ul>
				</nav>
			</div>
			
			
		</div>
	</section>
	<%@ include file="/Include/footer.jsp"%>
</body>

</html>