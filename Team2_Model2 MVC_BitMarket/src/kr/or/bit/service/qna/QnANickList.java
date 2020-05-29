package kr.or.bit.service.qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Qna;
import kr.or.bit.dto.QnaNick;

public class QnANickList implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String ps = request.getParameter("ps"); //pagesize
		String cp = request.getParameter("cp"); //current page
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		
		
		//List 페이지 처음 호출 ...
		if(ps == null || ps.trim().equals("")){
			//default 값 설정
			ps = "5"; //5개씩 
		}
	
		if(cp == null || cp.trim().equals("")){
			//default 값 설정
			cp = "1"; // 1번째 페이지 보겠다 
		}
		
		System.out.println(ps);
		System.out.println(cp);
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount=0;
		
		
		try {
			Bitdao dao = new Bitdao();
			List<QnaNick> qnaNickList = dao.getQnaNickList(cpage, pagesize,id); 
			
			request.setAttribute("qnaNickList", qnaNickList);
			System.out.println(qnaNickList+"넘어가냐-컨트롤러");
			
			//총 게시글 수
			 int totalqnacount = dao.getQnACount();
			 
			//23건  % 5
				if(totalqnacount % pagesize == 0){
					pagecount = totalqnacount / pagesize; //  20 << 100/5
				}else{
					pagecount = (totalqnacount / pagesize) + 1; 
				}
			 

				request.setAttribute("pagesize", pagesize);
				request.setAttribute("cpage", cpage);
				request.setAttribute("pagecount", pagecount);
				request.setAttribute("totalqnacount", totalqnacount);
			
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/qna/QnAList.jsp");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}