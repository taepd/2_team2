package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;

import kr.or.bit.dto.Emp;
import net.sf.json.JSONArray;


public class JobList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
			
		try {
			 Empdao dao = new Empdao();
			 JSONArray jobList = dao.getJobList();
			 //List<String> jobList = dao.getJobList();
			 request.setAttribute("jobList", jobList);
			 
			
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/JobList.jsp");
	
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}
}
