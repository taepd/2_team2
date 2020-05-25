package kr.or.bit.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Admin;

public class AdminLogin implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			Admin admin = null;
			
			
			Empdao dao = new Empdao();
			admin = dao.getAdmin(userid);
			ArrayList<Empdao> d = new ArrayList<Empdao>();
			
			
			String msg = "";
			String url = "";
			
			if(userid != null && userid.equals(admin.getUserid()) && pwd != null && pwd.equals(admin.getPwd())) {
					HttpSession session = request.getSession();
					session.setAttribute("userid", userid);
					
					msg = "로그인 성공";
					url = "EmpList.emp";
				
			}else {
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
