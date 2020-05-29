package kr.or.bit.service.admin;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.Notice;

public class NoticeUpdate implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		Notice notice = null;
		Bitdao bitdao = null;
		//String uploadpath = request.getServletContext().getRealPath("upload_board");
		
		
		int size = 1024*1024*10;
		int result = 0;
		try {
				/*MultipartRequest multi = new MultipartRequest(
					request, 
					uploadpath,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy());
				*/
				bitdao = new Bitdao(); // POINT
				notice = new Notice();
			
				
				
				String ncindex = request.getParameter("ncindex");
				String title = request.getParameter("title");
				String nccontent = request.getParameter("nccontent");
				String rtime = request.getParameter("rtime");
				String ncstate = request.getParameter("ncstate");
				String adminid = request.getParameter("adminid");
				
				if(ncstate==null) {
					ncstate="N";
				}
				
				
				notice.setNcindex(Integer.parseInt(ncindex));
				notice.setTitle(title);
				notice.setNccontent(nccontent);
				notice.setRtime(rtime);
				notice.setNcstate(ncstate);
				notice.setAdminid(adminid);
				
				
				 
				result = bitdao.updateNotice(notice);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}

		

		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "수정성공";
			url = "NoticeList.bit";
		} else {
			msg = "수정실패";
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
