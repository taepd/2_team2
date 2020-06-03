package kr.or.bit.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.BoardCt_Join;
import kr.or.bit.dto.Notice;
import net.sf.json.JSONArray;


public class PurchaseListAjax implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String ps = request.getParameter("ps"); //pagesize
		String cp = request.getParameter("cp"); //current page
		String searchContent = request.getParameter("searchContent");
		String ctname = request.getParameter("ctname");
		
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
		int pagecount =0;
		
		try {
			 Bitdao dao = new Bitdao();
			 List<BoardCt_Join> purchaselist = dao.getBoardSearchList(cpage, pagesize, searchContent, ctname);
			 //request.setAttribute("emplist", emplist);
			 
				
			 int totalpurchasecount = dao.getTotalBoardCount();
			
				//23건  % 5
				if(totalpurchasecount % pagesize == 0){
					pagecount = totalpurchasecount/ pagesize; //  20 << 100/5
				}else{
					pagecount = (totalpurchasecount / pagesize) + 1; 
				}
				request.setAttribute("pagecount", pagecount);
				 request.setAttribute("totalpurchasecount", totalpurchasecount);
				request.setAttribute("pagesize", pagesize);
				request.setAttribute("cpage", cpage);
				request.setAttribute("pagecount", pagecount);
				request.setAttribute("totalpurchasecount", totalpurchasecount);
				 System.out.println(totalpurchasecount);
				 JSONArray jsonArr = JSONArray.fromObject(purchaselist);
				 request.setAttribute("jsonArr", jsonArr);
			
//				 response.setContentType("application/x-json; charset=UTF-8");
//				 response.getWriter().print(jsonArr);
				 
				 forward = new ActionForward();
				 forward.setRedirect(false); //forward
				 forward.setPath("/WEB-INF/views/admin/PurchaseListAjax.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
		
	}
}
