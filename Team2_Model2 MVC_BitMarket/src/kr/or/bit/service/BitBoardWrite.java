package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;

public class BitBoardWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();
		Bitdao dao = new Bitdao();
		int result = 0;
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("id");
		
		String ctname = request.getParameter("ctname");
		
		
		String ctcode = dao.getCtcode(ctname);
		
		
		board.setCtcode(ctcode);
		board.setTitle(title);
		board.setPrice(price);
		board.setContent(content);
		board.setId(id);
		
		result = dao.boardwrite(board);
		
		String msg = "";
		String url = "";
		
		if(result > 0) {
			msg="글이 등록 되었습니다";
			url="BitMain.bit";
			
		}else {
			msg="글 등록에 실패 하였습니다.";
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
