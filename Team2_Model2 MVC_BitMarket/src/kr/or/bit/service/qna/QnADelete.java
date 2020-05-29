package kr.or.bit.service.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;

public class QnADelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int qaindex = Integer.parseInt(request.getParameter("qaindex"));
		String id = request.getParameter("id");
		int result = 0;
		HttpSession session = request.getSession();
		 
		Bitdao dao = new Bitdao();
		System.out.println("20");
		
		System.out.println(id);
		System.out.println(session.getAttribute("id"));
		
		if(session.getAttribute("id").equals(id)||session.getAttribute("id").equals("admin")) {
			
			result = dao.deleteQna(qaindex,id);
		}
		
		
		String msg = "";
		String url = "";
		
		if (result > 0) {
			msg = "삭제 성공";
			url = "QnANickList.bit";
			System.out.println("22");
		} else {
			msg = "삭제 실패";
			url = "javascript:history.back()";  //얘는 뭘까?????????????????????????????????
			//오 신기하다 저게 뒤로가기래!
			System.out.println("23");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		System.out.println("24");
		return forward;
	}
}
