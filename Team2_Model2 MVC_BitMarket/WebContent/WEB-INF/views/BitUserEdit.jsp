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
								<label for="cono1">위치 설정</label>
								<input type="text" name="loc" class="form-control" required="" title="주소-기본주소" placeholder="동명(읍,면)으로 검색 (ex.서초동)" id="loc" value="${myuser.loc}">
									<div id="layer" style="display: none; overflow: hidden; z-index: 1; top: 0px; left: 0px; max-width: 670px; width: 100%; height: 400px; border: 1px solid rgb(77, 77, 77);">
                                       	 		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1;width:20px" alt="닫기 버튼">
                                    		<div id="__daum__layer_2" style="position: relative; width: 100%; background-color: rgb(255, 255, 255); z-index: 0; overflow: hidden; min-width: 300px; margin: 0px; padding: 0px;"><iframe frameborder="0" src="about:blank" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; border: 0px none; margin: 0px; padding: 0px; overflow: hidden; min-width: 300px;"></iframe></div></div>
                            
                            </div>
							
							
							  
                                <button type="button" id="currentLoc"
								class="btn btn-transparent">
								<i class="fa fa-crosshairs"></i>현재 위치로 찾기
								</button>
							<!-- Submit button -->
							<button class="btn btn-transparent">수정 완료</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
<script>

//카카오 주소
var element_layer = document.getElementById('layer');
var themeObj = {};
function closeDaumPostcode() { element_layer.style.display = 'none'; }
var element_layer = document.getElementById('layer');
$("#loc").click(function () { sample2_execDaumPostcode() })
$("#btnCloseLayer").click(function () { closeDaumPostcode() })
function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            if (data.userSelectedType === 'R') {
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
            //주소 인풋창에 입력
            $("#loc").val(addr);

            element_layer.style.display = 'none';
        },
        width: '100%',
        height: '100%',
        maxSuggestItems: 5,
        theme: themeObj
    }).embed(element_layer);
    element_layer.style.display = 'block';
   
}

//카카오 주소 끝


//html5 geolocation을 이용하여 현재 위치 값 받아내기

$('#currentLoc').click(function getLocation() {
if (navigator.geolocation) { // GPS를 지원하면
navigator.geolocation.getCurrentPosition(function(position) {
alert(position.coords.latitude + ' ' + position.coords.longitude);

//카카오 지도 api 라이브러리 활용, 좌표에서 주소로 변환 // 
var geocoder = new kakao.maps.services.Geocoder();

var coord = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);
var callback = function(result, status) {
  let currentAddr = result[0].address.address_name;
  if (status === kakao.maps.services.Status.OK) {
      console.log('그런 너를 마주칠까 ' + currentAddr + '을 못가');
  }
  $("#loc").val(currentAddr);
  
}; 

geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);

//카카오 지도api 라이브러리 활용, 좌표에서 주소로 변환 끝 //

}, function(error) {
console.error(error);
}, {
enableHighAccuracy: false,
maximumAge: 0,
timeout: Infinity
});
} else {
alert('GPS를 지원하지 않습니다');
}
});
</script>
	<%@ include file="/Include/footer.jsp"%>
</body>
</html>