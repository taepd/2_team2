package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;

public class BitTrUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String oldRepId = request.getParameter("oldRepId");
		String newRepId = request.getParameter("newRepId");
		System.out.println("nri : " +newRepId);
		
		String bdindex = request.getParameter("bdindex");
		
		String boardId = request.getParameter("boardid");
		
		
		Bitdao dao = new Bitdao();
		
		int resultrow = dao.updateTrstate(boardId, oldRepId, newRepId, Integer.parseInt(bdindex));
		
		 
		String msg = "";
		String url = "";
		
		if(resultrow > 0) {
			msg = "선택되었습니다.";
			url = "BitBoardDetail.bit?bdindex="+bdindex;
			
		}else {
			msg = "다시 선택해주세요.";
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
