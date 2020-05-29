package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Category;
import kr.or.bit.dto.User;

public class BitDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		
		int bdindex = Integer.parseInt(request.getParameter("bdindex"));
		//System.out.println(bdindex);
		try {
			Bitdao dao = new Bitdao();
			Board board = dao.getBoardByIdx(bdindex);
			List<User> userlist = dao.getUserList();
			List<Category> ctlist = dao.getCategoryList();
			
			request.setAttribute("board", board);
			request.setAttribute("userlist", userlist);
			request.setAttribute("ctlist", ctlist);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitDetail.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
