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
import kr.or.bit.dto.Reply;
import kr.or.bit.dto.User;

public class BitUserEdit implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		try {
			Bitdao dao = new Bitdao();
			List<Board> userboardlist = dao.getBoardById(id);
			
			User myuser = dao.getUserById(id);
			List<Category> categorylist = dao.getCategoryList();
			
			request.setAttribute("categorylist", categorylist);
			request.setAttribute("userboardlist", userboardlist);
			request.setAttribute("myuser", myuser);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitUserEdit.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
