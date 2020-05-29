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

public class QnADetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		int qaindex= Integer.parseInt(request.getParameter("qaindex"));
		
		try {
			Bitdao dao = new Bitdao();
			Qna qna = dao.getDetail(qaindex);
			List<QnaReply> qnaReplylist = dao.QnAReplyAll(qaindex); //원본글 번호
			QnaReply qnaReply = dao.QnAReplyDetail(qaindex);
			
			
			
			request.setAttribute("qna", qna);
			request.setAttribute("qnaReplylist", qnaReplylist);
			
			
			int totalqnareplycount = dao.getQnAReplyCount();
			
			System.out.println("댓글 들고오냐? -qnadatail임 :"+qnaReply);
			
			
			//조회수증가
			boolean isread = dao.getReadNum(qaindex); //y/n값받은거
			if(isread)System.out.println("조회증가: "+ isread);
			
			System.out.println("댓글제목 :"+qnaReply.getTitle());
			System.out.println("댓글내용 :"+qnaReply.getContent());
			
			request.setAttribute("totalqnareplycount", totalqnareplycount);
			
			forward = new ActionForward();
			forward.setRedirect(false); //forward
			forward.setPath("/WEB-INF/views/qna/QnADetail.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return forward;
	}

}
