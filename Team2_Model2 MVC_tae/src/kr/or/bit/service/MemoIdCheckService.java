package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;

public class MemoIdCheckService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String idCheck = null;
		
		try {
			String id = request.getParameter("id");
	       	Empdao dao = new Empdao();
	    	idCheck = dao.isCheckById(id);
	    	request.setAttribute("message", idCheck);
	    	
	    	forward = new ActionForward();
	    	forward.setRedirect(false);
	    	forward.setPath("/WEB-INF/views/uservalid.jsp");
	    	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return forward;
	}

}
