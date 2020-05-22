<%@page import="kr.or.bit.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
	//데이터 받기
	String writer=request.getParameter("reply_writer");
	String content=request.getParameter("reply_content");
	String pwd=request.getParameter("reply_pwd");
	String idx_fk=request.getParameter("idx");
	String userid= "empty";	
	
	//service 객체 생성
	BoardService service = BoardService.getInBoardService();
	
	int result = service.replyWrite(Integer.parseInt(idx_fk), writer, userid, content, pwd);
	
	//처리하는 코드
	String msg="";
    String url="";
    if(result > 0){
    	msg ="댓글 입력 성공";
    	url ="board_content.jsp?idx="+idx_fk;
    }else{
    	msg="댓글 입력 실패";
    	url="board_content.jsp?idx="+idx_fk;
    }
    
    request.setAttribute("board_msg",msg);
    request.setAttribute("board_url", url);
%>

    <jsp:forward page="redirect.jsp"></jsp:forward>	




