<%@page import="javax.print.attribute.standard.Severity"%>
<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx =request.getParameter("idx"); //댓글의 원본 게시글 번호
	String pwd = request.getParameter("pwd"); //댓글의 암호
	if(idx==null || pwd ==null){  //쌤은 이 파일은 방어코드 안하심
		
	
%>    
	<script type="text/javascript">
		history.back();
	</script>

<%
	return; //더 이상 코드 실행하지 않음
	}
	//parameter가 정상인 경우
	BoardService service = BoardService.getInBoardService();
	int result = service.board_Delete(idx, pwd);
	
	//처리하는 코드
	String msg="";
    String url="";
    if(result > 0){
    	msg ="게시글 삭제 성공";
    	url ="board_list.jsp";
    }else{
    	msg="게시글 삭제 실패";
    	url="board_list.jsp";
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
%>

    <jsp:forward page="redirect.jsp"></jsp:forward>	