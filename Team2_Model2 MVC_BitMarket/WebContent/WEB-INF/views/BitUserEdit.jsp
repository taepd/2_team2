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
	<c:set var="categorylist" value="${requestScope.categorylist}" />
	<section class="user-profile section">
		<div class="container">
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
					<!-- Edit Personal Info -->
					<div class="widget personal-info">
						<h3 class="widget-header user">회원정보 수정</h3>
						<form method="post" action="BitUserEditOk.bit?id=${myuser.id}" enctype="multipart/form-data" id="ajaxform">
							<!-- File chooser -->
							<div class="form-group choose-file">
							
								<img src="upload/${myuser.profile}" style="width:150px;"><input type="hidden" name="profile_" value="${user.profile}">
								<input type="file" value="{}" class="form-control-file d-inline" name="profile" id="input-file">
								
							</div>
							<!-- First Name -->
							<div class="form-group">
								<label for="first-name">회원 ID</label> <input type="text"
									class="form-control" id="first-name" value="${myuser.id}"
									readonly>
							</div>
							<!-- Last Name -->
							<div class="form-group">
								<label for="last-name">변경할 비밀번호</label> <input type="text"
									name="pwd" class="form-control" id="last-name">
							</div>

							<!-- Comunity Name -->
							<div class="form-group">
								<label for="comunity-name">별명</label> <input type="text"
									name="nick" class="form-control" id="comunity-name"
									value="${myuser.nick}">
							</div>

							<!-- Zip Code -->
							<div class="form-group">
								<label for="zip-code">위치 설정</label> <input type="text"
									name="loc" class="form-control" id="zip-code">
							</div>
							<!-- Submit button -->
							<button class="btn btn-transparent">수정 완료</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/Include/footer.jsp"%>
</body>
</html>