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
import kr.or.bit.service.AdminLogin;
import kr.or.bit.service.AdminLogout;
import kr.or.bit.service.DeptDetail;
import kr.or.bit.service.EmpDelete;
import kr.or.bit.service.EmpDetail;
import kr.or.bit.service.EmpInsert;
import kr.or.bit.service.EmpList;
import kr.or.bit.service.EmpSearchDeptno;
import kr.or.bit.service.EmpSearchEmpno;
import kr.or.bit.service.EmpTotalCount;
import kr.or.bit.service.EmpUpdate;




@WebServlet("*.emp")
public class FrontEmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontEmpController() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(url_Command.equals("/AdminLogin.emp")) {//로그인페이지
    		//UI+로직
    		action = new AdminLogin();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/AdminLogout.emp")) { //로그아웃 페이지
    		//UI+로직
    		action = new AdminLogout();
    		forward = action.execute(request, response);
    	
    	}else if(url_Command.equals("/DeptDetail.emp")) { //비동기(부서번호 조회)
    		//UI+로직
    		action = new DeptDetail();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpDelete.emp")) { //사원 삭제
    		//UI 제공
    		action = new EmpDelete();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpDetail.emp")) { //사원 상세보기
    		//UI 제공
    		action = new EmpDetail();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/LoginView.emp")) { //로그인페이지
    		//UI
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/authentication-login.html");
    		
    	}else if(url_Command.equals("/EmpInsert.emp")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/EmpInsert.jsp");
    		
    	}else if(url_Command.equals("/EmpInsertOk.emp")) { //사원 등록
    		//UI+로직
    		action = new EmpInsert();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpList.emp")) { //사원 목록
    		//UI+로직
    		action = new EmpList();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpSearchDeptno.emp")) { //부서번호로 사원검색
    		//UI 제공
    		action = new EmpSearchDeptno();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpSearchEmpno.emp")) { //사원번호로 사원검색
    		//UI 제공
    		action = new EmpSearchEmpno();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpTotalCount.emp")) { //전체 사원 수
    		//UI 제공
    		action = new EmpTotalCount();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/EmpUpdate.emp")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/EmpUpdate.jsp");
    	}
    	
    	else if(url_Command.equals("/EmpUpdateOk.emp")) { //사원 수정
    		//UI 제공
    		action = new EmpUpdate();
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






