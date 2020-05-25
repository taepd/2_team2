<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Include/nav.jsp"%>


<body>
<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="BitBoardWrite.bit">
	<select><option>카테고리 선택</option>
			<option value="1">Most Popular</option>
			<option value="2">Lowest Price</option>
			<option value="4">Highest Price</option>
	</select>
		<input type="text" name="title"  placeholder="제목을 입력해주세요"/><br>
		<input type="text" name="price" placeholder="가격을 입력해 주세요"/>
		
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>

<script>

function goWrite(frm) {
	var title = frm.title.value;
	var price = frm.price.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (price.trim() == ''){
		alert("가격을 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>	
</body>
</html>