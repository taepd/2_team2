package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Category;
import kr.or.bit.dto.Reply;
import kr.or.bit.dto.User;

public class BitUserReplyList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		System.out.println(id);
		try {
			Bitdao dao = new Bitdao();
			User myuser = dao.getUserById(id);
			List<User> userlist = dao.getUserList();
			List<Board> boardlist = dao.getBoardListAll();
			List<Reply> userreplylist = dao.getReplyById(id);
			List<Category> categorylist = dao.getCategoryList();
			
			System.out.println("무슨일이지"+boardlist);
			System.out.println("유저ㅣㅆ다"+userlist);
			
			List<Board> delboardlist = new ArrayList<Board>();
			

			for(Board boardfor : boardlist) {
				for(User userfor : userlist) {
					
					if(boardfor.getId()!=(userfor.getId())) {
						
						Board board = new Board();
						board.setBdindex(boardfor.getBdindex());
						board.setId(boardfor.getId());
						board.setRtime(boardfor.getRtime());
						board.setPrice(boardfor.getPrice());
						board.setTitle(boardfor.getTitle());
						board.setCtcode(boardfor.getCtcode());
						board.setImg(boardfor.getImg());
						board.setTrstate(boardfor.getTrstate());
						board.setCount(boardfor.getCount());
						delboardlist.add(board);
					
					}	
				}
			}
			
			
			request.setAttribute("categorylist", categorylist);
			request.setAttribute("boardlist", boardlist);
			request.setAttribute("userreplylist", userreplylist);
			request.setAttribute("myuser", myuser);
			request.setAttribute("userlist", userlist);
			request.setAttribute("delboardlist", delboardlist);
			
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitUserProfileReply.jsp");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return forward;
	}

}
