package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Category;
import kr.or.bit.dto.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BitSelectCategory implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		Bitdao dao = new Bitdao();
		String ctname = request.getParameter("ctname");
		String ctcode = dao.getCtcode(ctname);
		JSONObject ctjsonlistall = new JSONObject();
		
		try {
			
			List<Board> boardlistbycategory = dao.getBoardListByCategory(ctcode);
			List<User> boardlistbyuser = dao.getUserList();
			List<Category> boardlistbycategorylist = dao.getCategoryList();
			
			System.out.println(boardlistbyuser);
			System.out.println(boardlistbycategory);
			System.out.println(boardlistbycategorylist);

			JSONArray ctjsinlistuser = JSONArray.fromObject(boardlistbyuser);
			JSONArray ctjsonlist = JSONArray.fromObject(boardlistbycategory);
			JSONArray ctjsonlistctcode = JSONArray.fromObject(boardlistbycategorylist);		
			
			ctjsonlistall.put("ctjsinlistuser", ctjsinlistuser);
			ctjsonlistall.put("ctjsonlist", ctjsonlist);
			ctjsonlistall.put("ctjsonlistctcode", ctjsonlistctcode);
			
			System.out.println("여기있다"+ctjsonlistall);
			request.setAttribute("ctjsonlistall", ctjsonlistall);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/CategorySelect.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
