package kr.or.bit.service.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Qna;
import kr.or.bit.dto.QnaReply;
import kr.or.bit.dto.Reply;
import net.sf.json.JSONArray;

public class QnAReWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Bitdao dao = null;
		QnaReply qnaReply = null;
		
		int qaindex = 0;
		int resultrow = 0;
		 
		try {
			
			dao = new Bitdao();
			qnaReply = new QnaReply();
			
			
			qaindex = Integer.parseInt(request.getParameter("qaindex"));
			String id = request.getParameter("id");
			String title = request.getParameter("admin_replytitle");
			String content = request.getParameter("admin_replycontent");
//			
//			System.out.println("댓글쓰기 service 글번호 :"+qaindex);
//			System.out.println("댓글쓰기 service 아이디 :"+id);
//			System.out.println("댓글쓰기 service 제목 :"+title);
//			System.out.println("댓글쓰기 service 내용 :"+content);
			
			qnaReply.setQaindex(qaindex);
			qnaReply.setId(id);
			qnaReply.setTitle(title);
			qnaReply.setContent(content);
			
			resultrow = dao.QnAReplyWrite(qnaReply);  
			System.out.println("댓글쓰기 잘들고오니? :"+resultrow);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
	
		String msg = "";
		String url = "";
		
		if (resultrow > 0) {
			
			int check = dao.QnaReplyCheck(qaindex);  //update하는 dao
			System.out.println(check);
			if(check > 0) {
				msg = "답변 성공";
				url = "QnADetail.bit?qaindex="+qaindex;
			} else {
				msg = "답변 실패";
				url = "QnADetail.bit?qaindex="+qaindex;
			}
			
			
			
		} else {
			msg = "답변 실패";
			url = "QnADetail.bit?qaindex="+qaindex;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
	}
}
