package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class AdminLogin implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			String adminid = request.getParameter("userid");
			String adminpwd = request.getParameter("userpwd");
			
			String msg = "";
			String url = "";
			
			if(adminid != null && adminid.trim().equals("admin") && 
					adminpwd != null && adminpwd.trim().equals("1234")) {
					HttpSession session = request.getSession();
					session.setAttribute("userid", adminid);
					
					msg = "로그인 성공";
					url = "EmpList.emp";
			} else {
					msg = "로그인 실패";
					url = "LoginView.emp";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
			
		return forward;
	}

}
