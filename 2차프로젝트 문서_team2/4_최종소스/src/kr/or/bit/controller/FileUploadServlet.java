package kr.or.bit.controller;

 
 
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.User;
 
 
@WebServlet("*.up")
public class FileUploadServlet extends HttpServlet {
 
 
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String CHARSET = "utf-8";
    private static final String ATTACHES_DIR = "C:\\attaches";
    private static final int LIMIT_SIZE_BYTES = 1024 * 1024;
 
 
    @Override
    protected void doPost(HttpServletRequest request,  HttpServletResponse response)
            throws ServletException, IOException {
 
 
    	User user = null;
		Bitdao dao = null;
		String uploadpath = request.getServletContext().getRealPath("upload");
		
		
		int size = 1024*1024*10;
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
			
			List<FileItem> items = fileUpload.parseRequest(request);
            for (FileItem item : items) {
                    System.out.printf("파라미터 명 : %s, 파일 명 : %s,  파일 크기 : %s bytes \n", item.getFieldName(),
                            item.getName(), item.getSize());
                    if (item.getSize() > 0) {
                        String separator = File.separator;
                        int index =  item.getName().lastIndexOf(separator);
                        String fileName = item.getName().substring(index  + 1);
                        File uploadFile = new File(uploadpath +  separator + fileName);
                        item.write(uploadFile);
                    }
                    String id = "";
                    String pwd = "";
                    String nick = "";
                    String loc = "";
                    String profile="";
                    /*switch (item.getFieldName()) {
					case "id":
						id = item.getFieldName();
						System.out.println("테스트");
						break;
					case "pwd":
						pwd = item.getFieldName();
						break;
					case "nick":
						nick = item.getFieldName();
						break;
					case "loc":
						loc = item.getFieldName();
						break;
					case "profile":
						if(profile.equals("")) {
							profile += item.getFieldName();
						}else {
							profile += item.getFieldName()+",";
						}
						break;

					default:
						break;
					}*/
                    // 프로필 사진 지정안했을 때  기본 이미지 지정
                    if(profile.equals("")) {
    					user.setProfile("profile.png");
    				}else {
    					user.setProfile(profile);
    				}
        			
        			user.setId(id);
        			user.setPwd(pwd);
        			user.setNick(nick);
        			user.setLoc(loc);
        				
        				
        			result = dao.joinUser(user);
                }
	
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
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
	
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/redirect.jsp");
		dis.forward(request, response);
	}
 
 
}


