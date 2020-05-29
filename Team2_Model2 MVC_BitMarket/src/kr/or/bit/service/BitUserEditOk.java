package kr.or.bit.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.User;

public class BitUserEditOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		String uploadimg = request.getServletContext().getRealPath("upload");
		String id = "";
		User myuser = null;
		Bitdao dao = null;
		int result = 0;
		
		HttpSession session = request.getSession();
		
		
		int sizeLimit = 1024*1024*15;
		
	    MultipartRequest multi = null; 
	    
	    try {
	    	multi = new MultipartRequest(request, uploadimg, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	    	dao = new Bitdao();
	    	myuser = new User();
	        
	    	Enumeration filenames=multi.getFileNames(); //파일 이름 반환
	    	String file = (String)filenames.nextElement();
	    	
	    	
	    	
	    	id = (String)session.getAttribute("id");
	    	String pwd = multi.getParameter("pwd");
	    	String loc = multi.getParameter("loc");
	    	String nick = multi.getParameter("nick");
	    	String profile =  multi.getFilesystemName(file);
	    	
	    	
	    	myuser.setPwd(pwd);
	    	myuser.setLoc(loc);
	    	myuser.setNick(nick);
	    	myuser.setProfile(profile);
	    	myuser.setId(id);
	    	
	    	
	    	result = dao.updateUser(myuser);
	    	
	    	
	    	request.setAttribute("myuser", myuser);
	    	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	    
	    String msg = "";
		String url = "";
		if (result > 0) {
			msg = "수정 성공";
			url = "BitUserProfile.bit?id="+id;
		} else {
			msg = "수정 실패";
			url = "BitUserProfile.bit?id="+id;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		forward = new ActionForward();
		forward.setRedirect(false); // forward
		forward.setPath("/WEB-INF/views/redirect.jsp");
		return forward;
	}

}
