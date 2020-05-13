package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		 String empno = request.getParameter("empno");
		 String ename = request.getParameter("ename");
		 String job = request.getParameter("job");
		 String mgr = request.getParameter("mgr");
		 String hiredate = request.getParameter("hiredate");  // 타입 date로 해야하나?
		 String sal = request.getParameter("sal");
		 String comm = request.getParameter("comm");
		 String deptno = request.getParameter("deptno");
		
		try {
			 Empdao dao = new Empdao();
			 int result = dao.updateEmp(request);
			 request.setAttribute("emp", emp); //하는 중
			 
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/empList.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}
}
