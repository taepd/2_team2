package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Category;
import kr.or.bit.dto.ReplyUser_Join;
import kr.or.bit.dto.User;

public class BitBoardDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String bdindex = request.getParameter("bdindex");
	
		System.out.println(bdindex);
		
		try {
			Bitdao dao = new Bitdao(); 
			
			//게시판 내용
			Board board = dao.getBoardByIdx(Integer.parseInt(bdindex));
			
			//전체 유저 리스트
			List<User> userlist = dao.getUserList();
			
			//카테고리 리스트
			List<Category> ctlist = dao.getCategoryList();
			
			//댓글의 닉네임과 id 리스트
			List<ReplyUser_Join> nickIdTrlist = dao.getNickList(Integer.parseInt(bdindex));
			
			
			for(ReplyUser_Join join : nickIdTrlist) {
				if(join.getTrstate().equals("Y") && board.getTrstate().equals("Y")) {
					System.out.println();
					request.setAttribute("trRepId", join.getId());
					request.setAttribute("trRepNick", join.getNick());
				}
			}
			
			
			request.setAttribute("board", board);
			request.setAttribute("userlist", userlist);
			request.setAttribute("ctlist", ctlist);
			request.setAttribute("nickIdTrlist", nickIdTrlist);
			
			
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitDetail.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
