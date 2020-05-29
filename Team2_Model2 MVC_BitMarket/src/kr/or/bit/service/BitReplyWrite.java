package kr.or.bit.service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Reply;


public class BitReplyWrite implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int bdindex = Integer.parseInt(request.getParameter("bdindex"));
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		
		String scstate = request.getParameter("scstate");
		if(scstate == null) {
			scstate = "N";
		}
		 
		Reply reply = new Reply();
		reply.setBdindex(bdindex);
		reply.setContent(content);
		reply.setScstate(scstate);
		reply.setId(id);
		
		
		
		
		System.out.println(bdindex);
		Bitdao dao = new Bitdao();
		
		int resultrow = dao.writeReply(reply);
		
		
		System.out.println(resultrow);
		String msg ="";
		String url ="";
		
		forward = new ActionForward();
		if (resultrow > 0) {
		
			forward.setRedirect(false);
			forward.setPath("BitReplyList.bit?bdindex="+bdindex);
		} else {
			msg = "등록실패";
			url = "javascript:history.back()";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/redirect.jsp");
		}

		
		
		return forward;
	}

}
