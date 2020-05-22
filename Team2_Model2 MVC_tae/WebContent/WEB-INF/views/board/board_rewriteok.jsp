<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	/* 
	servlet에서 사용하는 정상적 방법
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String homepage = request.getParameter("homepage");
	String filename = request.getParameter("filename");
	String pwd = request.getParameter("pwd"); 
	
	Board board = new Board();
	board.setSubject(subject)
	*/
%>
<jsp:useBean id="board" class="kr.or.bit.dto.Board" scope="page">
	<jsp:setProperty property="*" name="board"/>
</jsp:useBean>
<%
	BoardService service = BoardService.getInBoardService();
	int result=service.rewriteok(board);
	
	//list 이동시 현재 pagesize, cpage
	String cpage = request.getParameter("cp"); //current page
	String pagesize = request.getParameter("ps"); //pagesize
	//위 코드는 필요에 따라서 url="board_list.jsp?cp=<%=cpage";
	
	String msg="";
    String url="";
    if(result > 0){
    	msg ="insert success";
    	url ="board_list.jsp";
    }else{
    	msg="insert fail";
    	url="board_write.jsp?idx="+board.getIdx();
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
    

%> 

    <jsp:forward page="redirect.jsp"></jsp:forward>	























