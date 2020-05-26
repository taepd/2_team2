package kr.or.bit.service.admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Notice;



public class NoticeWrite implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Notice notice = null;
		Bitdao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload_board");
		
		
		int size = 1024*1024*10;
		int result = 0;
		try {			
				dao = new Bitdao(); // POINT
				notice = new Notice();
			
			
				String subject = request.getParameter("adminid");
				String writer = request.getParameter("title");
				String email = request.getParameter("nccontent");
				String homepage = request.getParameter("ncstate");
				String content = request.getParameter("content");
		
				String img = multi.getFilesystemName(file);
				
				board.setSubject(subject);
				board.setWriter(writer);
				board.setEmail(email);
				board.setHomepage(homepage);
				board.setContent(content);
				board.setFilename(img);
				
				 
				result = dao.writeBoard(board);
		} catch (IOException e) {
			System.out.println(e.getMessage());
			
		}
		System.out.println(result);
		
		

		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "등록성공";
			url = "BoardList.board";
		} else {
			msg = "등록실패";
			url = "javascript:history.back()";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
	}

	
}
