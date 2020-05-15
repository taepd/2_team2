package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Emp;
import net.sf.json.JSONArray;

public class EmpSearchEmpno implements Action {

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
			ActionForward forward = null;
			
			String en = request.getParameter("empno");
			
			int empno = Integer.parseInt(en);
			
			
			try {
				 Empdao dao = new Empdao();
				 List<Emp> emplistByEmpno = dao.getEmpListByEmpno(empno);
				 
				 JSONArray jsonlist = JSONArray.fromObject(emplistByEmpno);
				 
				 request.setAttribute("jsonlist", jsonlist);
				 
				 
				 forward = new ActionForward();
				 forward.setRedirect(false); //forward
				 forward.setPath("/WEB-INF/views/EmpSearch.jsp");
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return forward;
			
		}
	}
	
