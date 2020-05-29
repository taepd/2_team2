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
import kr.or.bit.service.BitNorList;
import kr.or.bit.service.BitReplyDelete;
import kr.or.bit.service.BitReplyList;
import kr.or.bit.service.BitReplyReWrite;
import kr.or.bit.service.BitReplyUpdate;
import kr.or.bit.service.BitReplyWrite;
import kr.or.bit.service.BitSelectCategory;
import kr.or.bit.service.BitTrUpdate;
import kr.or.bit.service.BItLogin;
import kr.or.bit.service.BitBoardDetail;
import kr.or.bit.service.BitImgList;
import kr.or.bit.service.BitBoardListAjax;
import kr.or.bit.service.BitBoardWrite;
import kr.or.bit.service.BitCategory;




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
    	}else if(url_Command.equals("/BitAdminMain.bit")) {
    		//UI
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/BitAdminMain.jsp");
    		
    	}else if(url_Command.equals("/BitBoardListAjax.bit")) { //비동기로 리스트 조회
    		action = new BitBoardListAjax();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitImgList.bit")) { //첫 화면에서 리스트 조회
    		action = new BitImgList();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitNorList.bit")) { //첫 화면에서 리스트 조회
    		action = new BitNorList();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitBoardDetail.bit")) { //게시판 상세조회
    		action = new BitBoardDetail();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitReplyWriteOk.bit")) { //댓글 작성
    		action = new BitReplyWrite();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitReplyReWriteOk.bit")) { //대댓글 작성
    		action = new BitReplyReWrite();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitReplyList.bit")) { //댓글 조회
    		action = new BitReplyList();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitReplyUpdateOk.bit")) { //댓글 수정
    		action = new BitReplyUpdate();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitReplyDeleteOk.bit")) { //댓글 삭제
    		action = new BitReplyDelete();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitSelectCategory.bit")) { //카테고리 셀렉
    		action = new BitSelectCategory();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/Category.bit")) {  //카테고리 셀렉트
    		action = new BitCategory();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/BitTrUpdateOk.bit")) { //거래 완료 체크
    		action = new BitTrUpdate();
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






