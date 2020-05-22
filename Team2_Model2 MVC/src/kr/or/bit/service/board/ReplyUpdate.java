package kr.or.bit.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Boarddao;
import kr.or.bit.dto.Reply;
import net.sf.json.JSONArray;

public class ReplyUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int no = Integer.parseInt(request.getParameter("no"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		HttpSession session = request.getSession();
		
		int resultrow = 0;
		
		Boarddao dao = new Boarddao();
		
		System.out.println("no"+no);
		System.out.println("idx"+idx);
		System.out.println("writer"+writer);
		System.out.println("content"+content);
		System.out.println(session.getAttribute("userid"));
		
		
		
		if(writer.equals(session.getAttribute("userid"))) {
			resultrow = dao.updateReply(no, writer, content);
		}
		System.out.println(resultrow);
		String msg ="";
		String url ="";
		
		forward = new ActionForward();
		if (resultrow > 0) {
			List<Reply> replylist = dao.getReplyList(idx);
			
			JSONArray replyjson = JSONArray.fromObject(replylist);
			request.setAttribute("replyjson", replyjson);
			
			
			
			forward.setRedirect(false);
			forward.setPath("ReplyList.board");
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
