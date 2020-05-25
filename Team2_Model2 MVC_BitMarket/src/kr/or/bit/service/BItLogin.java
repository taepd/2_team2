package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.User;

public class BItLogin implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			User user = null;
			
			
			Bitdao dao = new Bitdao();
			user = dao.getUser(id);
						
			String msg = "";
			String url = "";
			
			if(id != null && id.equals(user.getId()) && pwd != null && pwd.equals(user.getPwd())) {
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					
					msg = "로그인 성공";
					url = "BitMain.bit";
				
			}else {
					msg = "로그인 실패";
					url = "Loginpage.bit";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
			
		return forward;
	}

}
