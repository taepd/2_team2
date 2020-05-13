package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.Emp;

public class EmpInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		Emp emp = new Emp();

		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgr = request.getParameter("mgr");
		String hiredate = request.getParameter("hiredate"); // 타입 date로 해야하나?
		String sal = request.getParameter("sal");
		String comm = request.getParameter("comm");
		String deptno = request.getParameter("deptno");

		emp.setEmpno(Integer.parseInt(empno));
		emp.setEname(ename);
		emp.setJob(job);
		emp.setMgr(Integer.parseInt(mgr));
		emp.setHiredate(hiredate);
		emp.setSal(Integer.parseInt(sal));
		emp.setComm(Integer.parseInt(comm));
		emp.setDeptno(Integer.parseInt(deptno));		
		
		Empdao dao = new Empdao(); // POINT
		int result = dao.insertEmp(emp);

		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "등록성공";
			url = "empList.emp";
		} else {
			msg = "등록실패";
			url = "memo.html";
		}

		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
	}

}
