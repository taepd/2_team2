package kr.or.bit.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Notice;


public class AdminNoticeList implements Action{ 

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
		
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount=0;
		
		try {
			 Bitdao dao = new Bitdao();
			 List<Notice> noticelist = dao.getNoticeList(cpage, pagesize);
			 request.setAttribute("noticelist", noticelist);
			
			 int totalnoticecount = dao.getTotalNoticeCount();
				
			 if(totalnoticecount % pagesize == 0){
				pagecount = totalnoticecount / pagesize; //  20 << 100/5
			 }else{
				pagecount = (totalnoticecount / pagesize) + 1; 
			 }
			 request.setAttribute("pagesize", pagesize);
			 request.setAttribute("cpage", cpage);
			 request.setAttribute("pagecount", pagecount);
			 request.setAttribute("totalnoticecount", totalnoticecount);
			 
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward

			 //유저와 관리자 페이지뷰 분리
			 if(dao.getAdmin(id)!=null) {			 
				 forward.setPath("/WEB-INF/views/admin/NoticeList.jsp");
			 }else {
				 forward.setPath("/WEB-INF/views/NoticeUserList.jsp");
			 }
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}

