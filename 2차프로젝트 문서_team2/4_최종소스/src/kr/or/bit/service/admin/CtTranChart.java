package kr.or.bit.service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CtTranChart implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		
		try {
			 Bitdao dao = new Bitdao();
			 JSONArray jsonArr = dao.getCtTranChart();

			 request.setAttribute("jsonArr", jsonArr);
			 
			 
		     response.setContentType("application/x-json; charset=UTF-8");
			 response.getWriter().print(jsonArr);
				 
			 

//			 forward = new ActionForward();
//			 forward.setRedirect(false); //forward
//			 forward.setPath("/WEB-INF/views/EmpChart.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
		
	}

}
