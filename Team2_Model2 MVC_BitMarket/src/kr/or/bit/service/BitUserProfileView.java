package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Category;
import kr.or.bit.dto.User;

public class BitUserProfileView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String id = (String)request.getParameter("id");
		
		try {
			
			Bitdao dao = new Bitdao();
			User detailuser = dao.getUserById(id);
			List<Board> userboardlist = dao.getBoardById(id);
			List<User> userlist = dao.getUserList();
			List<Category> categorylist = dao.getCategoryList();
			
			request.setAttribute("userboardlist", userboardlist);
			request.setAttribute("myuser", detailuser);
			request.setAttribute("userlist", userlist);
			request.setAttribute("categorylist", categorylist);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitUserProfileview.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
