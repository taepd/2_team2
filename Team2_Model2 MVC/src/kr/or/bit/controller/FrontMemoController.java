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
import kr.or.bit.service.MemoAddService;
import kr.or.bit.service.MemoIdCheckService;
import kr.or.bit.service.MemoListService;




@WebServlet("*.memo")
public class FrontMemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontMemoController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(url_Command.equals("")) {
    		
    	}else if(url_Command.equals("/MemoAdd.memo")) { //글쓰기 처리
    		//UI+로직
    		action = new MemoAddService();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/MemoList.memo")) { //목록보기
    		//UI+로직
    		action = new MemoListService();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/MemoId.memo")) { //비동기(ID 사용유무)
    		//UI+로직
    		action = new MemoIdCheckService();
    		forward = action.execute(request, response);
    	}else if(url_Command.equals("/MemoView.memo")) { //만약 있다면 상세보기
    		//UI+로직
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/memolist.jsp");
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






