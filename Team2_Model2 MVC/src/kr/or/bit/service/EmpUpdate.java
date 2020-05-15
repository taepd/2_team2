package kr.or.bit.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;

public class EmpUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
			ActionForward forward = null;
			Emp emp = null;
			Empdao dao = null;
			String uploadpath = request.getServletContext().getRealPath("upload");
			
			
			int size = 1024*1024*10;
			int result = 0;

			String empno="";

			try {
				MultipartRequest multi = new MultipartRequest(
						request, 
						uploadpath,
						size,
						"UTF-8",
						new DefaultFileRenamePolicy());
				
				dao = new Empdao();
				emp = new Emp();
				Enumeration filenames = multi.getFileNames();
				String file = (String)filenames.nextElement();
				
				empno = multi.getParameter("empno");
				String ename = multi.getParameter("ename");
				String job = multi.getParameter("job");
				String mgr = multi.getParameter("mgr");
				String hiredate = multi.getParameter("hiredate"); // 타입 date로 해야하나?
				String sal = multi.getParameter("sal");
				String comm = multi.getParameter("comm");
				
				String deptno = multi.getParameter("deptno");
				String img = multi.getFilesystemName(file);
				
				emp.setEmpno(Integer.parseInt(empno));
				emp.setEname(ename);
				emp.setJob(job);
				emp.setMgr(Integer.parseInt(mgr));
				emp.setHiredate(hiredate);
				emp.setSal(Integer.parseInt(sal));
				emp.setComm(Integer.parseInt(comm));
				emp.setDeptno(Integer.parseInt(deptno));

				result = dao.updateEmp(emp);
				request.setAttribute("emp", emp); // 하는 중
				
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
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
			return forward;

		}
}
