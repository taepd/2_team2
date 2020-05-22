
<%@page import="kr.or.bit.dto.Board"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String idx_fk =request.getParameter("idx"); //댓글의 원본 게시글 번호
	String no = request.getParameter("no"); //댓글의 순번(pk)
	String pwd = request.getParameter("delPwd"); //댓글의 암호
	if(idx_fk==null || no ==null || pwd ==null||no.trim().equals("")){
		
	
%>    
	<script type="text/javascript">
		history.back();
	</script>

<%
	return; //더 이상 코드 실행하지 않음
	}
	//parameter가 정상인 경우
	BoardService service = BoardService.getInBoardService();
	int result = service.replyDelete(no, pwd);
	
	//처리하는 코드
	String msg="";
    String url="";
    if(result > 0){
    	msg ="댓글 삭제 성공";
    	url ="board_content.jsp?idx="+idx_fk;
    }else{
    	msg="댓글 삭제 실패";
    	url="board_content.jsp?idx="+idx_fk;
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
%>

    <jsp:forward page="redirect.jsp"></jsp:forward>	