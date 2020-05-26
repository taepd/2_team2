<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bitmarket MemberInfo</title>
</head>
<script>
	function alertdelete() {
		alert("정말로 삭제하시겠습니까?");
	}
</script>
<body>
	<h3>회원상세정보</h3>
	<div>
		<table>
			<tr>
			<td><p><b>아이디</b> <input type="text" value="<% %>"> </td>
			</tr>
			<tr>
			<td><p><b>닉네임</b> <input type="text" value=""> </td>
			</tr>
			<tr>
			<td><p><b>위치</b> <input type="text" value=""> </td>
			</tr>
		</table>
	</div>
	<div>
	<form>
		<input type="button" onclick='alertdelete()' value="회원삭제">
		<input type="button" onclick="location.href='TransInform.jsp'" value="거래내역">
	</form>	
	</div>
</body>
</html>