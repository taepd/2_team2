package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Category;
import kr.or.bit.dto.User;

public class BitNorList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String ps = request.getParameter("ps");
		String cp = request.getParameter("cp");
		 
		
		//List 처음 호출
		if(ps == null || ps.trim().equals("")) {
			ps = "10";
		}
		if(cp ==null || cp.trim().equals("")) {
			cp="1";
		}
		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount = 0;
		
		try {
			Bitdao dao = new Bitdao();
			List<Board> boardlist = dao.getBoardList(cpage, pagesize);
			List<User> userlist = dao.getUserList();
			List<Category> categorylist = dao.getCategoryList();
			int totalboardcount = dao.getTotalBoardCount();
			
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("userlist", userlist);
			request.setAttribute("categorylist", categorylist);
			
			
			
			if(totalboardcount % pagesize ==0) {
				pagecount = totalboardcount / pagesize;
			}else {
				pagecount = (totalboardcount / pagesize) + 1;
			}
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("totalboardcount", totalboardcount);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitList.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
