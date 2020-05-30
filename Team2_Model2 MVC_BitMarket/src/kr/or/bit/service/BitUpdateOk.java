package kr.or.bit.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.Bitdao;
import kr.or.bit.dto.Board;

public class BitUpdateOk implements Action {
	
	private static final String CHARSET = "utf-8";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		String uploadpath = request.getServletContext().getRealPath("upload");
		
		String bdindex = null;
		Board board = new Board();
		Bitdao dao = new Bitdao(); 
		int result = 0;
		HttpSession session = request.getSession();
		
		
		int size = 1024*1024;
		
		response.setContentType("text/html; charset=UTF-8");
	    request.setCharacterEncoding(CHARSET);

	    File attachesDir = new File(uploadpath);
	    
	    DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        fileItemFactory.setRepository(attachesDir);
        fileItemFactory.setSizeThreshold(size);
        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		
		try {
			String ctname = "";
			String title = "";
			String price = "";
            String content = "";
            String filelist="";
            String id = (String)session.getAttribute("id");
			
            String fileName=""; //중복파일의 파일명 갱신을 위해
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
                        fileName = item.getName().substring(index  + 1);
                        File uploadFile = new File(uploadpath +  separator + fileName);
                        
                        //올릴려는 파일과 같은 이름이 존재하면 중복파일 처리
                        if (uploadFile.exists()){
                        	System.out.println("업로드 테스트");
                            for(int i=0; true; i++){
                                //파일명 중복을 피하기 위한 일련 번호를 생성하여
                                //파일명으로 조합
                                uploadFile = new File(uploadpath +  separator + "("+(i+1)+")"+fileName);
                                //조합된 파일명이 존재하지 않는다면, 일련번호가
                                //붙은 파일명 다시 생성
                                if(!uploadFile.exists()){ //존재하지 않는 경우
                                    fileName = "("+(i+1)+")"+fileName;
                                    break;
                                }
                            }
                        }
                        
                        item.write(uploadFile);
                    }
                }
                 
                    switch (item.getFieldName()) {
					case "category":
						ctname = item.getString(CHARSET);
						
						break;
					case "title":
						title = item.getString(CHARSET);
						break;
					case "price":
						price = item.getString(CHARSET);
						break;
					case "content":
						content = item.getString(CHARSET);
						break;
					case "loc":
						content = item.getString(CHARSET);
						break;	
					case "images":
						if(filelist.equals("")) {
							filelist += fileName;
						}else {
							filelist += ","+fileName;
						}
						break;

					default:
						break;
					}
                    // 이미지 지정 안했을 때  기본 이미지 지정
                    if(filelist == null) {
    					board.setImg("noimage.jpg");
    				}else {
    					board.setImg(filelist);
    				}
        
                }
            bdindex = request.getParameter("bdindex");
			
            String ctcode = dao.getCtcode(ctname);
            
			board.setCtcode(ctcode);
			board.setTitle(title);
			board.setPrice(Integer.parseInt(price));
			board.setContent(content);
			board.setId(id);
			board.setImg(filelist);
			board.setBdindex(Integer.parseInt(bdindex));

			result = dao.updateBoard(board);
			request.setAttribute("board", board);

	    
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		String msg = "";
		String url = "";
		
		if(result > 0) {
			msg="게시글이 정상적으로 수정 되었습니다.";
			url="BitDetail.bit?bdindex="+bdindex;
			
		}else {
			msg="게시글 수정에 실패 하였습니다.";
			url="BitDetail.bit?bdindex="+bdindex;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/redirect.jsp");
		
		return forward;
	}
}
