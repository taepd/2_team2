package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Reply;
import net.sf.json.JSONArray;

public class BitReplyUpdate implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int rpindex = Integer.parseInt(request.getParameter("rpindex"));
		int bdindex = Integer.parseInt(request.getParameter("bdindex"));
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		
		int resultrow = 0;
		
		Bitdao dao = new Bitdao();
		
		
		System.out.println(session.getAttribute("userid"));
		

		if(id.equals(session.getAttribute("userid"))) {
			resultrow = dao.updateReply(rpindex, id, content);
		}
		System.out.println(resultrow);
		String msg ="";
		String url ="";
		
		forward = new ActionForward();
		if (resultrow > 0) {
			forward.setRedirect(false);
			forward.setPath("BitReplyList.bit?bdindex="+bdindex);
		} else {
			msg = "수정실패";
			url = "javascript:history.back()";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
		}
		return forward;
	}
	
	

}


