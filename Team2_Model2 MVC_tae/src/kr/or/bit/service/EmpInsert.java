package kr.or.bit.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;

import kr.or.bit.dto.Emp;

public class EmpInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		Emp emp = null;
		Empdao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload");
		
		
		int size = 1024*1024*10;
		int result = 0;
		try {
				MultipartRequest multi = new MultipartRequest(
					request, 
					uploadpath,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy());
				
				dao = new Empdao(); // POINT
				emp = new Emp();
			
				Enumeration filenames = multi.getFileNames();
				String file = (String)filenames.nextElement();
			
				String empno = multi.getParameter("empno");
				String ename = multi.getParameter("ename");
				String job = multi.getParameter("job");
				String mgr = multi.getParameter("mgr");
				String hiredate = multi.getParameter("hiredate"); // 타입 date로 해야하나?
				String sal = multi.getParameter("sal").replace(",", "");
				String comm = multi.getParameter("comm").replace(",", "");
				String deptno = multi.getParameter("deptno");
				String img = multi.getFilesystemName(file);
				
				emp.setEmpno(Integer.parseInt(empno));
				emp.setEname(ename);
				emp.setJob(job);
				emp.setMgr(Integer.parseInt(mgr));
				emp.setHiredate(hiredate);
				emp.setSal(Double.parseDouble(sal));
				emp.setComm(Double.parseDouble(comm));
				emp.setDeptno(Integer.parseInt(deptno));
				emp.setImg(img);
				
				 
				result = dao.insertEmp(emp);
		} catch (IOException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		

		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "등록성공";
			url = "EmpList.emp";
		} else {
			msg = "등록실패";
			url = "EmpInsert.emp";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
	}

}
