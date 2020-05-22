package kr.or.bit.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dao.Empdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Emp;

public class BoardWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		Board board = null;
		BoardDao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload");
		
		
		int size = 1024*1024*10;
		int result = 0;
		try {
				MultipartRequest multi = new MultipartRequest(
					request, 
					uploadpath,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy());
				
				dao = new BoardDao(); // POINT
				board = new Board();
			
				Enumeration filenames = multi.getFileNames();
				String file = (String)filenames.nextElement();
			
				String subject = multi.getParameter("subject");
				String write = multi.getParameter("write");
				String email = multi.getParameter("email");
				String homepage = multi.getParameter("homepage");
				String content = multi.getParameter("content"); // 타입 date로 해야하나?
				String pwd = multi.getParameter("pwd");
				String attachedFile = multi.getFilesystemName(file);
				
				board.setSubject(subject);
				board.setWriter(write);
				board.setEmail(email);
				board.setHomepage(homepage);
				board.setContent(content);
				board.setPwd(pwd);
				board.setFilename(attachedFile);
				
				
				 
				result = dao.insertEmp(emp);
		} catch (IOException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		

		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "등록성공";
			url = "EmpList.emp";
		} else {
			msg = "등록실패";
			url = "EmpInsert.emp";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
	}

}
