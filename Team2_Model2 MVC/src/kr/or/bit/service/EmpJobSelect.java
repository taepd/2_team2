package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;

public class EmpJobSelect implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		List<String> list = null;
		try {
			Empdao dao = new Empdao();
			list = dao.getEmpJob();
		
			request.setAttribute("joblist", list);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/EmpJobSelect.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		return forward;
	}
	
}
