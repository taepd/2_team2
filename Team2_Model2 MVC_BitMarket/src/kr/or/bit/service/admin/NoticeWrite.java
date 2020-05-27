package kr.or.bit.service.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		
		
		int size = 1024*1024*10;
		int result = 0;
		dao = new Bitdao(); // POINT
		notice = new Notice();
		
		

		String adminid = request.getParameter("adminid");
		String title = request.getParameter("title");
		String nccontent = request.getParameter("nccontent");
		String ncstate = request.getParameter("ncstate");
		//현재 날짜 데이터 생성
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		//String rtime = dateFormat.format(new Date());
		if(ncstate==null) {
			ncstate="N";
		}
		
		notice.setAdminid(adminid);
		notice.setTitle(title);
		notice.setNccontent(nccontent);
		notice.setNcstate(ncstate);

		
		 
		result = dao.noticeWrite(notice);
		System.out.println(result);
		
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "등록성공";
			url = "NoticeList.bit";
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
