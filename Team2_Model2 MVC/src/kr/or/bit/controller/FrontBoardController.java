package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.board.AddReadNum;
import kr.or.bit.service.board.BoardDelete;
import kr.or.bit.service.board.BoardDetail;
import kr.or.bit.service.board.BoardList;
import kr.or.bit.service.board.BoardRewrite;
import kr.or.bit.service.board.BoardUpdate;
import kr.or.bit.service.board.BoardWrite;
import kr.or.bit.service.board.ReplyDelete;

import kr.or.bit.service.board.ReplyUpdate;
import kr.or.bit.service.board.ReplyWrite;

/**
 * Servlet implementation class FrontBoardController
 */
@WebServlet("*.board")
public class FrontBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public FrontBoardController() {
        super();
       
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(url_Command.equals("/BoardWrite.board")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/board/BoardWrite.jsp");
    	}else if(url_Command.equals("/BoardWriteOk.board")) {
    		action = new BoardWrite();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BoardUpdate.board")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/board/BoardUpdate.jsp");
    	}else if(url_Command.equals("/BoardUpdateOk.board")) {
    		action = new BoardUpdate();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BoardDeleteOk.board")) {
    		action = new BoardDelete();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BoardList.board")) {
    		action = new BoardList();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BoardDetail.board")) {
    		action = new BoardDetail();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BoardRewrite.board")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/board/BoardRewrite.jsp");
    	}else if(url_Command.equals("/BoardRewriteOk.board")) {
    		action = new BoardRewrite();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/ReplyWriteOk.board")) {
    		action = new ReplyWrite();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/ReplyList.board")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/board/ReplyList.jsp");
    	}else if(url_Command.equals("/ReplyDeleteOk.board")) {
    		action = new ReplyDelete();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/ReplyUpdateOk.board")) {
    		action = new ReplyUpdate();
    		forward = action.execute(request, response);
    	}
    		
    		
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
