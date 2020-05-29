package kr.or.bit.service.qna;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Qna;

public class QnAWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Qna qna = null;
		Bitdao dao = null;
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
				
				dao = new Bitdao(); // POINT
				qna = new Qna();
			
				Enumeration filenames = multi.getFileNames();
				String file = (String)filenames.nextElement();
			
				String id= multi.getParameter("id");
				String title= multi.getParameter("title");
				String content = multi.getParameter("content");
				String scstate = multi.getParameter("scstate");
				String awstate = "0";
				System.out.println();
				
				
				//체크박스 비교(조건에 null도 안넣으면 에러남)
				if(scstate != null && scstate.equals("on")) {
					scstate="y";
					
				}else {
					scstate="n";
				}
				
				
				System.out.println(id);
				System.out.println(title);
				System.out.println(content);
				System.out.println(scstate);
				System.out.println(awstate);
				
				String filename = multi.getFilesystemName(file);             
				
				System.out.println(filename);
				
				qna.setId(id);
				qna.setTitle(title);
				qna.setContent(content);
				qna.setScstate(scstate);
				qna.setAwstate(awstate);
				
				result = dao.QnAWrite(qna);
				
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "등록성공";
			url = "QnAList.bit";
		} else {
			msg = "등록실패";
			url = "QnAWrite.bit";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");

		return forward;
	}


}
