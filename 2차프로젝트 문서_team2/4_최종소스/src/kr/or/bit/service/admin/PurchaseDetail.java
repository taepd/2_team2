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

public class PurchaseDetail implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int bdindex = Integer.parseInt(request.getParameter("bdindex"));

		try {
			 Bitdao dao = new Bitdao();
			 Board purchase = dao.getBoardByIdx(bdindex);

			 
			 
			 request.setAttribute("purchase", purchase);
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/admin/PurchaseDetail.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
}
}
