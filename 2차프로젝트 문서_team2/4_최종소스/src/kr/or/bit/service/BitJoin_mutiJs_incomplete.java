package kr.or.bit.service;

 
 
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.User;
 
 

public class BitJoin_mutiJs_incomplete implements Action {
 
 
    private static final String CHARSET = "utf-8";
    private static final String ATTACHES_DIR = "C:\\attaches";
    private static final int LIMIT_SIZE_BYTES = 1024 * 1024;
    
    public ActionForward execute(HttpServletRequest request,  HttpServletResponse response)
            throws ServletException, IOException {
		
    	User user = null;
		Bitdao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload");
		
		
		int size = 1024*1024;
		int result = 0;
		
		 response.setContentType("text/html; charset=UTF-8");
	     request.setCharacterEncoding(CHARSET);
	


 
 
        File attachesDir = new File(uploadpath);
 
 
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        fileItemFactory.setRepository(attachesDir);
        fileItemFactory.setSizeThreshold(size);
        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		
		try {
			
			
			dao = new Bitdao();
			user = new User();
			
			String id = "";
            String pwd = "";
            String nick = "";
            String loc = "";
            String profile="";
            int count = 0;
			List<FileItem> items = fileUpload.parseRequest(request);
            for (FileItem item : items) {
            	if (item.isFormField()) {
                    System.out.printf("파라미터 명 : %s, 파라미터 값 : %s \n", item.getFieldName(), item.getString(CHARSET));
                }else {    
            	
            	System.out.printf("파라미터 명 : %s, 파일 명 : %s,  파일 크기 : %s bytes \n", item.getFieldName(),
                            item.getName(), item.getSize());
                    if (item.getSize() > 0) {
                        String separator = File.separator;
                        int index =  item.getName().lastIndexOf(separator);
                        String fileName = item.getName().substring(index  + 1);
                        File uploadFile = new File(uploadpath +  separator + fileName);
                        item.write(uploadFile);
                    }
                }
                 
                    switch (item.getFieldName()) {
					case "id":
						id = item.getString(CHARSET);
						break;
					case "pwd":
						pwd = item.getString(CHARSET);
						break;
					case "nick":
						nick = item.getString(CHARSET);
						break;
					case "loc":
						loc = item.getString(CHARSET);
						break;
//					case "profile":
//						if(profile.equals("")) {
//							profile += item.getName();
//						}else {
//							profile += ","+item.getName();
//						}
//						break;

					default:
						break;
					}
                    
                   
                    
                    if(item.getFieldName().equals("image_count")) {
                    	count = Integer.parseInt(item.getString(CHARSET));
                    }
                    
                    System.out.println(count);
                    
                    for(int i=0; i<count; i++) {
                    	if(item.getFieldName().equals("image_"+i)) {
							if(profile.equals("")) {
								profile += item.getName();
							}else{
								profile += ","+item.getName();
							}
                    	}
                    }
                    
                    
                    // 프로필 사진 지정안했을 때  기본 이미지 지정
                    if(profile.equals("")) {
    					user.setProfile("profile.png");
    				}else {
    					user.setProfile(profile);
    				}
        			
              
                }
            user.setId(id);
			user.setPwd(pwd);
			user.setNick(nick);
			user.setLoc(loc);
				
				
			result = dao.joinUser(user);
		} catch (Exception e) {
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
		
		//request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		
		return forward;
	}

}
