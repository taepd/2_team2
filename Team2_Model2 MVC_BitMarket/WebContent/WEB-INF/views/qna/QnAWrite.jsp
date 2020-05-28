<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAWrite</title>
<script type="text/javascript">
function check(){
		
	    if(!bbs.title.value){
	        alert("제목을 입력하세요");
	        bbs.subject.focus();
	        return false;
	    }
	   
	     if(!bbs.content.value){            
	        alert("글 내용을 입력하세요");
	        bbs.content.focus();
	        return false;
	    } 
   
	     
	     
	     
	     
	    document.bbs.submit();
	}
/////////////////////////////////////////////	

	
	
</script>



</head>
<body>

<div class="row">
                    
                        <div class="card" style="width:60%; margin: 0 auto;">
                        
                        
                            <form class="form-horizontal" name="bbs" action="QnAWriteOk.bit" enctype="multipart/form-data" method="post" style="text-align: center;">
                                    <div class="form-group row" style="margin-top: 10px; margin-right: 120px;">
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">글쓴이</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="id" id="id" value="${sessionScope.id}" readonly>
                                        </div>
                                    </div>
                                    <hr />
                                    
                                    <div class="form-group row" style="margin-right: 120px;">
                                        <label for="email1" class="col-sm-3 text-right control-label col-form-label">제목</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="title" id="title">
	  										
	  										<input type="checkbox" id="scstate" name="scstate">
	 									 	<label for="vehicle1"> 비밀글</label><br>
                                        </div>
                                        
                                    </div>
                                   <hr />
                                   
                                    
                                    <div class="form-group row" style="margin-right: 120px;">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">내용</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" name="content" id="content"></textarea>
                                        </div>
                                    </div>
                                    
                                    <hr />
                                    <div class="form-group row" style="margin-right: 120px;">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">첨부파일</label>
                                        <div class="col-sm-9">
                                            <input type="file" name="filename" id="filename">
                                        </div>
                                    </div>
                                    
                                    
                               	<hr />
                               <div style="text-align: center; margin-bottom: 10px">
                                <input type="button" value="글쓰기" onclick="check();">
                                <input type="reset" value="취소">
                               </div>
                            </form>
            </div>
        </div>


<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}$('#imgFileName').html(input.files[0].name);
	};
</script>



</body>
</html>