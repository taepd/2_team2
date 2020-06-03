package kr.or.bit.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Notice;
import kr.or.bit.dto.Reply;
import kr.or.bit.dto.User;

public class UserDetail implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		
		try {
			 Bitdao bitdao = new Bitdao();
			 User user = bitdao.getUserById(id);
			 System.out.println(user);
			 
			 
			 request.setAttribute("user", user);
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/admin/UserDetail.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
}
}
