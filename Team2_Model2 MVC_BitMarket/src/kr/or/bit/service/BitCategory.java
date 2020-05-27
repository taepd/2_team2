package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import net.sf.json.JSONObject;

public class BitCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Bitdao dao = null;
		List<String> clist = null;
		JSONObject categoryjson = null;
		
		try {
			dao = new Bitdao();
			clist = dao.getCategory();
			
			categoryjson = new JSONObject();
			categoryjson.put("categorylist", clist);
			
			request.setAttribute("categoryjson", categoryjson);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/getCategory.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
