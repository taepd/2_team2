package kr.or.bit.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Empdao;
import net.sf.json.JSONObject;

public class DeptnoSelect implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Empdao dao = null;
		List<Integer> list = null;
		JSONObject deptnoJson = null;
		try {
			dao = new Empdao();
			list = dao.getDeptno();
			
			deptnoJson = new JSONObject();
			deptnoJson.put("deptnolist", list);
			
			request.setAttribute("deptnojson", deptnoJson);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/DeptnoSelect.jsp");
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
		return forward;
	}

}
