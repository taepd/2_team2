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
			Emp emp = null;

			String empno = request.getParameter("empno");
			String ename = request.getParameter("ename");
			String job = request.getParameter("job");
			String mgr = request.getParameter("mgr");
			String hiredate = request.getParameter("hiredate"); // 타입 date로 해야하나?
			String sal = request.getParameter("sal");
			String comm = request.getParameter("comm");
			String deptno = request.getParameter("deptno");
			String cp = request.getParameter("cp");
			String ps = request.getParameter("ps");
			
			

			try {
				Empdao dao = new Empdao();
				emp = new Emp();
				
				emp.setEmpno(Integer.parseInt(empno));
				emp.setEname(ename);
				emp.setJob(job);
				emp.setMgr(Integer.parseInt(mgr));
				emp.setHiredate(hiredate);
				emp.setSal(Integer.parseInt(sal));
				emp.setComm(Integer.parseInt(comm));
				emp.setDeptno(Integer.parseInt(deptno));

				int result = dao.updateEmp(emp);
				request.setAttribute("emp", emp); // 하는 중
				
				String msg = "";
				String url = "";
				if (result > 0) {
					msg = "수정 성공";
					url = "EmpDetail.emp?empno="+empno;
				} else {
					msg = "수정 실패";
					url = "EmpDetail.emp?empno="+empno;
				}

				request.setAttribute("msg", msg);
				request.setAttribute("url", url);

				forward = new ActionForward();
				forward.setRedirect(false); // forward
				forward.setPath("/WEB-INF/views/redirect.jsp");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return forward;

		}
}
