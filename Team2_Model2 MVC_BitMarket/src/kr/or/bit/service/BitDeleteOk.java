package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;

public class BitDeleteOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Bitdao dao = new Bitdao();
		int result = 0;
		
		String bdindex = request.getParameter("bdindex");
		
		result = dao.getDeleteByIdx(Integer.parseInt(bdindex));
		
		String msg = "";
		String url = "";
		
		if(result > 0) {
			msg="게시글이 삭제되었습니다.";
			url="BitMain.bit";
			
		}else {
			msg="게시글 삭제에 실패 하였습니다.";
			url="BitMain.bit";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		return forward;
	}

}
