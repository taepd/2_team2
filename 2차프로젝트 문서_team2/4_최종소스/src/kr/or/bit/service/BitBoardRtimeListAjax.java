package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class BitBoardRtimeListAjax implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		String ps = request.getParameter("ps"); //pagesize
		String cp = request.getParameter("cp"); //current page
		 
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
			 List<Board> boardlist = dao.getBoardRtimeList(cpage, pagesize);
			 List<User> userlist = dao.getUserList();
			 
			 request.setAttribute("boardlist", boardlist);
			 request.setAttribute("userlist",userlist);
//			 int totalboardcount = dao.getTotalBoardCount();
//				
//			 if(totalboardcount % pagesize == 0){
//				pagecount = totalboardcount / pagesize; //  20 << 100/5
//			 }else{
//				pagecount = (totalboardcount / pagesize) + 1; 
//			 }
			 
//			 System.out.println("tbc" + totalboardcount);
//			 System.out.println("pgs" + pagesize);
//			 System.out.println("pgc"+pagecount);
//			 System.out.println("cp" + cpage);
//			 
//			 
//			 
//			 request.setAttribute("pagesize", pagesize);
//			 request.setAttribute("cpage", cpage);
//			 request.setAttribute("pagecount", pagecount);
//			 request.setAttribute("totalboardcount", totalboardcount);
			 
			 JSONObject jsonObj = new JSONObject();
				
			JSONArray boardArr = JSONArray.fromObject(boardlist);
				JSONArray userArr = JSONArray.fromObject(userlist);
				
			jsonObj.put("boardArr", boardArr);
			jsonObj.put("userArr", userArr);
				
			request.setAttribute("jsonObj", jsonObj);
			 
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/views/BitBoardRtimeListAjax.jsp");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}

}
