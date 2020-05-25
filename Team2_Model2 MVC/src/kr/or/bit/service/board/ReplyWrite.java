package kr.or.bit.service.board;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Boarddao;
import kr.or.bit.dto.Reply;
import net.sf.json.JSONArray;

public class ReplyWrite implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		System.out.println(idx);
		Boarddao dao = new Boarddao();
		
		int resultrow = dao.writeReply(idx, writer, content);
		
		
		System.out.println(resultrow);
		String msg ="";
		String url ="";
		
		forward = new ActionForward();
		if (resultrow > 0) {
			List<Reply> replylist = dao.getReplyList(idx);
			System.out.println(replylist.toString());
			JSONArray replyjson = JSONArray.fromObject(replylist);
			request.setAttribute("replyjson", replyjson);
			
			
			
			forward.setRedirect(false);
			forward.setPath("ReplyList.board");
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
