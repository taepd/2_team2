package kr.or.bit.service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;


public class BitReplyDelete implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
	 	
		int rpindex = Integer.parseInt(request.getParameter("rpindex"));
		int bdindex = Integer.parseInt(request.getParameter("bdindex"));
		String id = request.getParameter("id");
		System.out.println("rp"+rpindex);
		System.out.println("bd"+bdindex); 
		System.out.println("id"+id);
		
		
		Bitdao dao = new Bitdao();
		int resultrow = 0;
		HttpSession session = request.getSession();
		if(id.equals(session.getAttribute("id"))) {
			resultrow = dao.deleteReply(rpindex, id);
		}
		System.out.println(resultrow);
		
		String msg ="";
		String url ="";
		
		forward = new ActionForward();
		if (resultrow > 0) {
			forward.setRedirect(false);
			forward.setPath("BitReplyList.bit?bdindex="+bdindex);
		} else {
			msg = "삭제실패";
			url = "javascript:history.back()";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
		}
	
	
	return forward;

	}
}
