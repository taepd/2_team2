<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");
	String cpage = request.getParameter("cp");
	String pagesize = request.getParameter("ps");
	String subject = request.getParameter("subject"); // 답글의 제목으로 사용
	
	if(idx == null || subject == null || idx.trim().equals("") || subject.trim().equals("")){
		response.sendRedirect("board_list.jsp");
		return;
	}
	if(cpage == null || pagesize == null){
		cpage ="1";
		pagesize = "5";
	}
	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="Stylesheet" 	href="<%=request.getContextPath()%>/style/default.css" />
	<SCRIPT type="text/javascript">
	function boardcheck() {
		if (!bbs.subject.value) {
			alert("제목을 입력하세요");
			bbs.subject.focus();
			return false;
		}
		if (!bbs.writer.value) {

			alert("이름을 입력하세요");
			bbs.writer.focus();
			return false;
		}
		if (!bbs.content.value) {
			alert("글 내용을 입력하세요");
			bbs.content.focus();
			return false;
		}

		if (!bbs.pwd.value) {
			alert("비밀번호를 입력하세요");
			bbs.pwd.focus();
			return false;
		}

		document.bbs.submit();

	}
</SCRIPT>
</head>
<body>
	<%
		pageContext.include("/include/header.jsp");
	%>
	<div id="pageContainer">
		<div style="padding-top: 25px; text-align: center">
			<form name="bbs" action="board_rewriteok.jsp" method="POST">
			
				<input type="hidden" name="cp" value="<%= cpage %>" /> 
				<input type="hidden" name="ps" value="<%= pagesize %>" /> 
				<input type="hidden" name="idx" value="<%= idx %>" />
			

				<table width="95%" border="2" align="center">
					<tr>
						<td width="20%" align="center">제목</td>
						<td width="80%" align="left">
							<input type="text" name="subject" size="40" value="[RE]<%= subject%>">
						</td>

					</tr>

					<tr>
						<td width="20%" align="center">글쓴이</td>
						<td width="80%" align="left">
							<input type="text" name="writer" size="40"></td>

					</tr>

					<tr>
						<td width="20%" align="center">이메일</td>
						<td width="80%" align="left">
						<input type="text" name="email" size="40"></td>

					</tr>
					<tr>
						<td width="20%" align="center">홈페이지</td>
						<td width="80%" align="left">
						 <input type="text" name="homepage" size="40" value="http://"></td>

					</tr>
					<tr>
						<td width="20%" align="center">글내용</td>
						<td width="80%" align="left">
							<textarea rows="10" cols="60" name="content"></textarea></td>

					</tr>
					<tr>
						<td width="20%" align="center">비밀번호</td>
						<td width="80%" align="left">
							<input type="password" name="pwd" size="20"></td>

					</tr>
					<tr>
						<td width="20%" align="center">첨부파일</td>
						<td width="80%" align="left">
							<input type="file" name="filename"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" 	value="글쓰기" onclick="boardcheck();" /> 
						<input type="reset" 	value="다시쓰기" />
						<a href="<%=request.getContextPath()%>/board/board_list.jsp">HOME</a>
						</td>
						
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>

