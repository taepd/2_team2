<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>

<!-- ////////////////////썸머노트///////////////////////////////////////////////////////////////// -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="jquery-3.4.1.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="Webapp/resources/js/summernote-ko-KR.js"></script>


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
		
		
//--------------------카테고리 select 태그 
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

$(document).on("click","#addFile",function() {
	        var fileIndex = $('#fileview li').children().length;      
	        $('#fileview').append(
	                '<li>'+
	                '   <input type="file" name="fileName['+ fileIndex +']" multiple id="addFile" class="left" accept="image/jpeg,image/gif,image/png,application/pdf,image/x-eps"/>'+
	                '</li>');
});   
		
	});
//---------------------------------------------
</script>
<body>	
	<section class="section-sm" id="maxwidth">
		<div class="col-md-12">
			<div class="search-result">
				<h3>게시글 작성</h3>
			</div>
		</div>

	<div style="width: 80%; margin: auto;">
		<form method="post" action="BitUpdateOk.bit?bdindex=${param.bdindex}" enctype="multipart/form-data" id="ajaxform">
			
			<div id="categoryselect"></div>
			<div id="preview" >
			</div>
			
			<table class="table">
			<tr>
				<td  align="left"><input type="text" name="title" placeholder="제목을 입력해주세요" value="${param.title}" size="40"></td>
			</tr>
			<tr>
				<td align="left"><input type="text" name="price" placeholder="가격을 입력해 주세요" value="${param.price}" size="40"></td>
			</tr>
			<ul id="fileview">
				<li><input type="file" name="fileName[0]" multiple id="addFile" class="left" accept="image/jpeg,image/gif,image/png,application/pdf,image/x-eps" onchange="preview(this);"/>
           	</li>
           	</ul>
            

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
            	<td><textarea id="summernote" name="content">${param.content}</textarea></td>
            </tr>
			<tr>
			<td><input id="subBtn" type="button" value="수정 완료" style="float: right;" onclick="goWrite(this.form)" /></td>
			</tr>	
			</table>
		</form>
	</div>
</section>
	<script>
		/////////////////////////////////////////////////////////////////////
		function preview(arr){
		      arr.forEach(function(f){
		        
		        //파일명이 길면 파일명...으로 처리
		        var fileName = f.name;
		        
		        //div에 이미지 추가
		        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
		        str += '<span>'+fileName+'</span><br>';
		        
		        //이미지 파일 미리보기
		        if(f.type.match('image.*')){
		          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
		          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
		            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
		            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
		            str += '</li></div>';
		            $(str).appendTo('#preview');
		          } 
		          reader.readAsDataURL(f);
		        }else{
		          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
		          $(str).appendTo('#preview');
		        }
		      });//arr.forEach
		    }
		/*
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#img').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
			
		};
		*/
		
		  
		
		
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