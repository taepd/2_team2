package kr.or.bit.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Boarddao;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Emp;
import kr.or.bit.dto.Reply;

public class BoardDetail implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		try {
			 Boarddao dao = new Boarddao();
			 Board board = dao.getBoardByIdx(idx);
			 List<Reply> replylist = dao.getReplyList(idx);
			 HttpSession session = request.getSession();
			 if(!session.getAttribute("userid").equals(board.getWriter())) {
				 dao.getReadNum(idx);
			 }
			 
			 
			 request.setAttribute("board", board);
			 request.setAttribute("replylist", replylist);
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/board/BoardDetail.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}
}
