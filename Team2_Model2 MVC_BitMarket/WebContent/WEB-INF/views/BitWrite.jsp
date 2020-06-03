<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>

<html>
<head>
<!-- ////////////////////썸머노트///////////////////////////////////////////////////////////////// 
<link	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
-->

<!-- include summernote css/js
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="jquery-3.4.1.min.js"></script>-->
<!-- include summernote-ko-KR 
<script src="Webapp/resources/js/summernote-ko-KR.js"></script>

-->
<script>
	

	
	
/////////////////////////////////////////////////////////////////////////////////////


//---------------썸머노트 
	$(function() {
		$('#summernote')
				.summernote(
						{
							placeholder : 'content',
							minHeight : 370,
							maxHeight : null,
							focus : true,
							lang : 'ko-KR',
							toolbar : [
									[ 'style', [ 'style' ] ],
									[
											'font',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'height', [ 'height' ] ],
									
									[ 'insert', [ 'hr' ] ],
									[ 'view', [ 'fullscreen', 'codeview' ] ]]
									
						});
	});
///////////////////////////////////////////////////////////////////////////////		


//--------------------카테고리 select 태그 
	$(function() {
		$.ajax({
			type : "get",
			url : "Category.bit",
			dataType : "json",
			success : function(response) {

				let select = "<select name='category' id='categorycss'>";

				$.each(response.categorylist, function(index, obj) {
					if (index == 0) {
						select += "<option value='"+obj+"' selected>" + obj
								+ "</option>";
					} else {
						select += "<option value='"+obj+"'>" + obj
								+ "</option>";
					}

				})
				$('#categoryselect').html(select);
			}

		});
		
////////////////////////////////////////////////////////////////	이미지 추가







/*
$(document).on("click","#addFile",function() {
	        var fileIndex = $('#fileview li').children().length;      
	        $('#fileview').append(
	                '<li>'+
	                '   <input type="file" name="fileName['+ fileIndex +']" multiple id="addFile" class="left" accept="image/jpeg,image/gif,image/png,application/pdf,image/x-eps"/>'+
	                '</li>');
});
*/
});

//------------------------------------------------------------------

</script>
</head>
<body>	

	<section class="section-sm" id="maxwidth">
		<div class="col-md-12">
			<div class="search-result">
				<h3>게시글 작성</h3>
			</div>
		</div>
	<div style="width: 90%; margin: auto;">
		<form method="post" action="BitBoardWrite.bit" enctype="multipart/form-data" id="ajaxform">
		
			<div id="categoryselect"></div>
			<div id="preview">
			<img id="previewimg" src="" width="300">
			</div>
			
             <ul id="fileview">
				<li><input type="file" name="images" multiple id="iamges" class="left" accept="image/jpeg,image/gif,image/png,application/pdf,image/x-eps" onchange="preview(this);"/>
           	</li>
           	</ul>
			<table class="table">
			<tr>
				<td  style="padding:10px 0px; align="left"><input type="text" name="title" placeholder="제목을 입력해주세요" size="40"></td>
			</tr>
			<tr>
				<td style="padding:10px 0px; align="left"><input type="text" name="price" placeholder="가격을 입력해 주세요" size="40"></td>
			</tr> 

<!--  
			<div>
				<img id="img" src="upload/${param.img}"  style="width : 150px" alt="your image" />
				<div id="imgFileName">${param.img}</div>
				<label class="btn btn-primary btn-file"> 이미지 등록 
				<input type="file" name="img" style="display: none;" onchange="readURL(this);">
				</label>
			</div>
			
	-->		
            <tr>
            	<td style="padding:10px 0;"><textarea class="form-control" name="content" id="message" rows="10" placeholder="내용을 입력해주세요"></textarea></td>
            </tr>
			<tr>
			<td><button class="btn btn-transparent" onclick="return goWrite(this.form)"style="float: right;">등록</button>
			</td>
			</tr>
			
			</table>
		</form>
	</div>
</section>
	<script>
		/////////////////////////////////////////////////////////////////////
		
			var file = document.querySelector('#addFile');

			file.onchange = function () { 
			    var fileList = file.files ;
			    
			    // 읽기
			    var reader = new FileReader();
			    reader.readAsDataURL(fileList [0]);

			    //로드 한 후
			    reader.onload = function  () {
			        document.querySelector('#previewimg').src = reader.result ;
			    }; 
			}; 
		  
		
		
		function goWrite(frm) {

			var title = frm.title.value;
			var price = frm.price.value;
			var content = frm.content.value;
			var res = /^[0-9]+$/;

			if (!res.test(price)) {
				alert("숫자만 입력해 주세요");
				document.getElementById('price').value = null;
				document.getElementById('price').focus();
				return false;
			}

			if (title.trim() == '') {
				alert("제목을 입력해주세요");
				return false;
			}

			if (price.trim() == '') {
				alert("가격을 입력해주세요");
				return false;
			}

			if (content.trim() == '') {
				alert("내용을 입력해주세요");
				return false;
			}

			frm.submit();
		}
	</script>
</body>
</html>