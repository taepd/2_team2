package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.Emp;
import kr.or.bit.dto.memo;

public class EmpList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int cpage = Integer.parseInt(request.getParameter("cpage"));
		int pagesize = Integer.parseInt(request.getParameter("pagesize"));
		
		try {
			 Empdao dao = new Empdao();
			 List<Emp> empList = dao.getEmpList(cpage, pagesize);
			 request.setAttribute("empList", empList);
			 
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/empList.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}
}
