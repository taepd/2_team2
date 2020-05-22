package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;

public class EmpDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int empno = Integer.parseInt(request.getParameter("empno"));
		
		Empdao dao = new Empdao();
		
		int result = dao.deleteEmp(empno);
		
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "삭제 성공";
			url = "EmpList.emp";
		} else {
			msg = "삭제 실패";
			url = "EmpDetail.emp?empno="+empno;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		return forward;
	}

}
