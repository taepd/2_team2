package kr.or.bit.service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;

public class UserDelete implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//String rtime = request.getParameter("rtime");
		String id = request.getParameter("id");
		int result = 0;
		
		Bitdao bitdao = new Bitdao();
		

		result = bitdao.deleteUser(id);

		
		
		
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "삭제 성공";
			url = "UserList.bit";
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
