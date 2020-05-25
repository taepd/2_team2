package kr.or.bit.service.board;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Boarddao;


public class BoardDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String writer = request.getParameter("writer");
		int result = 0;
		HttpSession session = request.getSession();
		
		Boarddao dao = new Boarddao();
		
		if(session.getAttribute("userid").equals(writer)) {
			result = dao.deleteBoard(idx,writer);
		}
		
		
		
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "삭제 성공";
			url = "BoardList.board";
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
