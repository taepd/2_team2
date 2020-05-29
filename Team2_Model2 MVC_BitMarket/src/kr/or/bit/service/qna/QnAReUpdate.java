package kr.or.bit.service.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Qna;
import kr.or.bit.dto.QnaReply;

public class QnAReUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		QnaReply qnaReply = null;
		Bitdao dao = null;
		
		int result = 0;
		String qaindex="";
		 
		try {
			dao = new Bitdao(); // POINT
			qnaReply = new QnaReply();
			
			qaindex= request.getParameter("qaindex");
			
			String title = request.getParameter("admin_replytitle");
			String qartime = request.getParameter("qartime");
			String id = request.getParameter("id");
			String content = request.getParameter("admin_replycontent");
			
			
			System.out.println("==========================");
			System.out.println("답변수정임 set전: "+qnaReply);
			System.out.println("답변수정 qaindex오고있니: "+qaindex);
			
			qnaReply.setQaindex(Integer.parseInt(qaindex));
			
			qnaReply.setTitle(title);
			qnaReply.setQartime(qartime);
			qnaReply.setId(id);
			qnaReply.setContent(content);
			
			System.out.println("답변 수정 title: "+title);
			System.out.println("답변 수정 id: "+id);
			System.out.println("답변 수정 content: "+content);
			System.out.println("답변 수정 qaindex: "+qaindex);
			System.out.println("답변 수정 qartime: "+qartime);
		

	
			
			result = dao.QnAReplyUpdate(qnaReply);
			
			
			
			request.setAttribute("qnaReply", qnaReply);
			
			System.out.println("답변수정 set후(값 넘어오니?): "+qnaReply);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "수정 성공";
			url = "QnADetail.bit?qaindex="+qaindex;
		} else {
			msg = "수정 실패";
			url = "QnADetail.bit?qaindex="+qaindex;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		forward = new ActionForward();
		forward.setRedirect(false); // forward
		forward.setPath("/WEB-INF/views/redirect.jsp");
		return forward;
	}
}
