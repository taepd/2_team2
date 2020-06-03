package kr.or.bit.service.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;

public class QnAReDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int qaindex = Integer.parseInt(request.getParameter("qaindex"));
		String id = request.getParameter("id");
		
		int result = 0;
		HttpSession session = request.getSession();
		
		System.out.println(id);
		System.out.println(session.getAttribute("id"));
		 
		
		Bitdao dao = new Bitdao();
		
		if(session.getAttribute("id").equals(id)) {
			result = dao.QnAReplyDelete(qaindex,id);
		}
		
		
		String msg = "";
		String url = "";
		
		if (result > 0) {
			msg = "삭제 성공";
			url = "QnADetail.bit?qaindex="+qaindex;
		} else {
			msg = "삭제 실패";
			url = "javascript:history.back()"; 
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		return forward;
	}


}