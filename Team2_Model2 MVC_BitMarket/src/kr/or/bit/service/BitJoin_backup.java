package kr.or.bit.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.User;

public class BitJoin_backup implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		User user = null;
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
			
			dao = new Bitdao();
			user = new User();
			
			Enumeration filenames = multi.getFileNames();
			String file = (String)filenames.nextElement();
			
			String profile = multi.getFilesystemName(file);
			String id = multi.getParameter("id");
			String pwd = multi.getParameter("pwd");
			String nick = multi.getParameter("nick");
			String loc = multi.getParameter("loc");
			

			// 프로필 사진 지정안했을 때  기본 이미지 지정
			if(profile==null) {
				user.setProfile("profile.png");
			}else {
				user.setProfile(profile);
			}
			
			user.setId(id);
			user.setPwd(pwd);
			user.setNick(nick);
			user.setLoc(loc);
			
			
			result = dao.joinUser(user);
			
			
			
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		String msg = "";
		String url = "";
		if(result > 0) {
			msg="회원가입 성공";
			url="Loginpage.bit";
		}else {
			msg="회원가입 실패";
			url="BitJoin.bit";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		
		return forward;
	}

}
