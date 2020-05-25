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
import kr.or.bit.service.BitJoin;
import kr.or.bit.service.BitLogout;
import kr.or.bit.service.BItLogin;
import kr.or.bit.service.BitBoardWrite;




@WebServlet("*.bit")
public class FrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       

    public FrontController() {
        super();
        
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(url_Command.equals("/Login.bit")) {//로그인
    		//로직
    		action = new BItLogin();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/Loginpage.bit")) {
    		//UI
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/Login.jsp");
    		
    	}else if(url_Command.equals("/BitJoin.bit")) { // 회원가입
    		//UI
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/Register.jsp");
    		
    	}else if(url_Command.equals("/BitJoinOK.bit")) { // 회원가입
    		//로직
    		action = new BitJoin();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitMain.bit")) {
    		//UI
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/BitMain.jsp");
    		
    	}else if(url_Command.equals("/BitLogout.bit")) {
    		action = new BitLogout();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/Bitwrite.bit")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/BitWrite.jsp");
    	
    	}else if(url_Command.equals("/BitBoardWrite.bit")) {
    		action = new BitBoardWrite();
    		forward = action.execute(request, response);
    	}
    		
    	

    	
    	//뷰 지정하기
    	//RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	if(forward !=null) {
    		if(forward.isRedirect()) { //형식적으로 있지만 잘 안쓴다 주소가 바뀌기 때문에.
    			response.sendRedirect(forward.getPath());
    		}else { //false (모든 자원) 사용
    			//UI
    			//UI + 로직
    			//forward url 주소 변환 없이 view 내용을 받을 수 있다
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






