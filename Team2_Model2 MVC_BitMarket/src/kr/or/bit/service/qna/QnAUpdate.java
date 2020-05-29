package kr.or.bit.service.qna;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Qna;

public class QnAUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		Qna qna = null;
		Bitdao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload");
		
		int size = 1024*1024*10;
		int result = 0;
  
		String qaindex="";
		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, 
					uploadpath,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy());
			
			dao = new Bitdao();
			qna = new Qna();
			
			Enumeration filenames = multi.getFileNames();
			String file = (String)filenames.nextElement();
			
			
			
			qaindex = multi.getParameter("qaindex");
			
			
			String id =  multi.getParameter("id");
			String title =  multi.getParameter("title");
			String qatime =  multi.getParameter("qatime");
			String content =  multi.getParameter("content");
			String scstate =  multi.getParameter("scstate");
			String filename =  multi.getFilesystemName(file);
			
			//체크박스 비교(조건에 null도 안넣으면 에러남)
			if(scstate != null && scstate.equals("on")) {
				scstate="y";
				
			}else {
				scstate="n";
			}
			
			System.out.println("scstate 넘어오냐111?: "+scstate);
			
			qna.setQaindex(Integer.parseInt(qaindex));  //?여기왜 세팅안해줬냐
			System.out.println("======================================");
			System.out.println("서비스=qaindex 오고있니?: "+qaindex);
			
			qna.setId(id);
			qna.setTitle(title);
			qna.setQatime(qatime);
			qna.setContent(content);
			qna.setScstate(scstate);
			qna.setFilename(filename);
			
			result = dao.editQna(qna);
			request.setAttribute("qna", qna);
			
			System.out.println("scstate 넘어오냐222?: "+scstate);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "수정 성공";
			url = "QnADetail.bit?qaindex="+qaindex;
		} else {
			msg = "수정 실패";
			url = "QnADetail.bit?qaindex="+qaindex;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		forward = new ActionForward();
		forward.setRedirect(false); // forward
		forward.setPath("/WEB-INF/views/redirect.jsp");
		return forward;
	}
}
