package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		
		try {
			 Empdao dao = new Empdao();
			 Emp emp = dao.getDetail(empno);
			 request.setAttribute("emp", emp);
			 
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/EmpDetail.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}
}
