package kr.or.bit.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;

import kr.or.bit.dto.ReplyUser_Join;
import net.sf.json.JSONArray;

public class BitReplyList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String bdindex = request.getParameter("bdindex");
		
		Bitdao dao = new Bitdao();
		
		List<ReplyUser_Join> replylist = dao.getReplyList(Integer.parseInt(bdindex));
		System.out.println(replylist.toString());
		JSONArray replyjson = JSONArray.fromObject(replylist);
		request.setAttribute("replyjson", replyjson);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/BitReplyListAjax.jsp");
		
		
		return forward;
	}

}
