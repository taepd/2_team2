package kr.or.bit.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Admin;
import kr.or.bit.dto.User;
import net.sf.json.JSONObject;

public class BItIdCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		User user = null;
		Admin admin = null;

		Bitdao dao = new Bitdao();
 
		user = dao.getUser(id); 
		admin = dao.getAdmin(id);


		JSONObject jsonObj = new JSONObject();
		
		if(admin != null && id.equals(admin.getId())){
			jsonObj.put("result", "fail");

		}else if(user != null && id.equals(user.getId())){ 
	  
			jsonObj.put("result", "fail");
		  
		}else {
			jsonObj.put("result", "success");
		}
	
		  response.setContentType("application/x-json; charset=UTF-8");
		  try {
			response.getWriter().print(jsonObj);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 


		return null;
	}

}