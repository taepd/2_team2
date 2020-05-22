package kr.or.bit.service.board;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Boarddao;
import kr.or.bit.dto.Board;

public class BoardRewrite implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Board board = null;
		Boarddao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload_board");
		
		
		int size = 1024*1024*10;
		int result = 0;
		try {
				MultipartRequest multi = new MultipartRequest(
					request, 
					uploadpath,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy());
				
				dao = new Boarddao(); // POINT
				board = new Board();
			
				Enumeration filenames = multi.getFileNames();
				String file = (String)filenames.nextElement();
				
				String idx = multi.getParameter("idx");
				String subject = multi.getParameter("subject");
				String writer = multi.getParameter("writer");
				String email = multi.getParameter("email");
				String homepage = multi.getParameter("homepage");
				String content = multi.getParameter("content");
		
				String img = multi.getFilesystemName(file);
				//idx 지정이 안되어있음
				board.setIdx(Integer.parseInt(idx));
				board.setSubject(subject);
				board.setWriter(writer);
				board.setEmail(email);
				board.setHomepage(homepage);
				board.setContent(content);
				board.setFilename(img);
				
				 
				result = dao.reWriteBoard(board);
				System.out.println("result"+result);
		} catch (IOException e) {
			System.out.println(e.getMessage());
			
		}

		

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
