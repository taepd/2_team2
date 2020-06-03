package kr.or.bit.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Notice;
import kr.or.bit.dto.Reply;

public class AdminNoticeDetail implements Action{ 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int ncindex = Integer.parseInt(request.getParameter("ncindex"));

		try {
			 Bitdao dao = new Bitdao();
			 Notice notice = dao.getNoticeByIdx(ncindex);

			 
			 
			 request.setAttribute("notice", notice);
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/admin/NoticeDetail.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
}
}
