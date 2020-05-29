<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body class="body-wrapper">
<!--==================================
=            User Profile            =
===================================-->
<c:set var="boardlist" value="${requestScope.userboardlist}" />
<c:set var="replylist" value="${requestScope.userreplylist}" />
<c:set var="myuser" value="${requestScope.myuser}" />
<c:set var="userlist" value="${requestScope.userlist}"/>
<c:set var="categorylist" value="${requestScope.categorylist}" />
<section class="dashboard section">
	<!-- Container Start -->
	<div class="container">
		<!-- Row Start -->
		<div class="row">
			<div class="col-md-10 offset-md-1 col-lg-4 offset-lg-0">
				<div class="sidebar" >
						<!-- User Image -->

						<div class="widget user-dashboard-profile" >
						<div  style="max-width: 50%; margin-bottom:15px; margin-left:75px;">
							<div class="rounded-circle" style="border: 5px solid #F4F7F9; position: relative; padding-top: 100%; overflow: hidden;">
								<div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; transform: translate(50%, 50%);">
									<img id="proimg" src="upload/${myuser.profile}"
										style="width :auto; height: 160px; transform: translate(-50%, -50%);">
								</div>
							</div>
						</div>
							<!-- User Name -->
							<h5 class="text-center">${myuser.nick}</h5>
							<p>${myuser.loc}</p>
						</div>
						<!-- Dashboard Links -->
						<%@ include file="/Include/usermenu.jsp"%>
					</div>
			</div>
			<div class="col-md-10 offset-md-1 col-lg-8 offset-lg-0">
				<!-- Recently Favorited -->
				<div class="widget dashboard-container my-adslist">
					<h3 class="widget-header">등록한 게시글</h3>
					<table class="table table-responsive product-dashboard-table">
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
							<c:forEach var="userlist" items="${userlist}">
							<c:if test="${board.id ==userlist.id}">
							
							<tr>
								<td class="product-thumb"><img width="80px" height="auto"
									src="images/products/products-1.jpg" alt="image description"></td>
								<td class="product-details">
									<h4 class="title">
										<a href="BitDetail.bit?bdindex=${board.bdindex}&cp=${cpage}&ps=${pagesize}">${board.title}</a>
									</h4> <span class="add-id"><strong>가격</strong>${board.price}</span>
									<span><strong>등록일</strong>${board.rtime}</span>
								
											<span class="add-id"><strong>판매자</strong>${userlist.nick}</span>
											<span class="location"><strong>위치</strong>${userlist.loc}</span>
											
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
							</c:if>
							</c:forEach>
						</c:forEach>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
		<!-- Row End -->
	</div>
	<!-- Container End -->
</section>
<%@ include file="/Include/footer.jsp"%>
</body>
</html>