<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAUpdate</title>



</head>




<!-- <body onload="CheckboxYN()"> -->
<body>
<!-- set -->
<%-- <c:set var="scstate" value="${requestScope.scstate}" /> --%>



<div class="row">
                    
                        <div class="card" style="width:60%; margin: 0 auto;">
                        
                        
                            <form class="form-horizontal" name="bbs" action="QnAUpdateOk.bit" enctype="multipart/form-data" method="POST" style="text-align: center;">
                                   
                                   
                                    <div class="form-group row" style="margin-top: 10px; margin-right: 120px;">
                                       
                                       <div class="form-group row" style="margin-right: 120px;">
									<label for="fname"
										class="col-sm-3 text-right control-label col-form-label">게시글 번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="qaindex"
											name="qaindex" value="${param.qaindex}" readonly>
											
									</div>
								</div>
                                       
                                       
                                       
                                        <label for="lname" class="col-sm-3 text-right control-label col-form-label">글쓴이</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="id" id="id" value="${param.id}" readonly/>
                                        </div>
                                    </div>
                                    <hr />
                                    
                                    <div class="form-group row" style="margin-right: 120px;">
                                        <label for="email1" class="col-sm-3 text-right control-label col-form-label">제목</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="title" id="title" value="${param.title }"/>
<%--                                             <input type="text" class="form-control" name="title" id="title" value="${param.title }"/> --%>
<%--                                             <input type="" class="form-control" name="awstate" id="awstate" value="${param.awstate }"/>답변여부 --%>
	  										
	  										
	  										<c:if test='${param.scstate =="y"}'>
		  										<input type="checkbox" id="scstate" name="scstate" checked/>
				 								<label for="vehicle1"> 비밀글</label><br>
	  										</c:if>
	  										<c:if test='${param.scstate =="n"}'>
		  										<input type="checkbox" id="scstate" name="scstate"/>
					 							<label for="vehicle1"> 비밀글</label><br>
	  										</c:if>
	  										
	  									

	 									 	
                                        </div>
                                        
                                    </div>
                                   <hr />
                                   
                                    
                                    <div class="form-group row" style="margin-right: 120px;">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">내용</label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" name="content" id="content">${param.content}</textarea>
                                        </div>
                                    </div>
                                    
                                    <hr />
                                    <div class="form-group row" style="margin-right: 120px;">
                                        <label for="cono1" class="col-sm-3 text-right control-label col-form-label">첨부파일</label>
                                        <div class="col-sm-9">
                                            <input type="file" name="filename" id="filename" value="${param.filename}">
                                        </div>
                                    </div>
                                    
                                    
                               	<hr />
                               <div style="text-align: center; margin-bottom: 10px">
                                <button type="submit" class="btn btn-light-outline">Submit</button>
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