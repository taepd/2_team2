package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DataTable implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		
		try {
			 Empdao dao = new Empdao();
			 JSONArray jsonEmpList = dao.getJsonEmpList();
			 /*서블릿에서 바로 최종jsp로 ajax json 데이터 보내고 싶은데 안됨
			 PrintWriter out = response.getWriter();
			 out.print(jsonEmpList);

			 response.setContentType("application/x-json; charset=UTF-8");
			 */
			 request.setAttribute("jsonEmpList", jsonEmpList);
			 

			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/DataTable.jsp");

		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}

}
