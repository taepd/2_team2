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

public class BitUpdateOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		String uploadimg = request.getServletContext().getRealPath("upload");
		
		String bdindex = null;
		Board board = null;
		Bitdao dao =null;
		int result = 0;
		HttpSession session = request.getSession();
		
		
		int sizeLimit = 1024*1024*15;

        
        MultipartRequest multi = null; 
		try {
			multi = new MultipartRequest(request, uploadimg, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	        
	        Enumeration fileNames=multi.getFileNames(); //파일 이름 반환
	       
	        dao = new Bitdao();
	        board = new Board();
	        
	        //변수 초기화
	        String fileInput = ""; //폼으로 받아온 fileName
	        String fileName = ""; //저장된 파일 이름
	        /*
	        boolean save= true; //파일 저장 성공
	        String type = ""; //저장된 파일 종류
	        File fileObj = null; //저장된 파일 객체
	        String originFileName = ""; //원본 파일 이름
	        String fileExtend = ""; //jpg,png,gif 등 확장자
	        String fileSize = ""; //저장된 파일 사이즈
	        String newFileName = "";
	        */
	        String filelist = "";
	        
	        while(fileNames.hasMoreElements()){
	            fileInput = (String)fileNames.nextElement();
	            fileName = multi.getFilesystemName(fileInput);
	            System.out.println(fileInput);
	            
	            if(fileName != null){
	            	board.setImg(fileName);
	            	/*
	                type = multi.getContentType(fileInput);
	                fileObj = multi.getFile(fileInput);
	                originFileName = multi.getOriginalFileName(fileInput);
	                fileExtend = fileName.substring(fileName.lastIndexOf(".")+1);//"file1.jpg"라면 jpg 반환
	                fileSize = String.valueOf(fileObj.length());//file도 결국 문자열이므로 length()로 반환
	                System.out.println("type:"+type+"||originFileName:"+originFileName+
	                        "||fileExtend:"+fileExtend+"||fileSize:"+fileSize);
	                
	                String[] splitType = type.split("/");
	                if(!splitType[0].equals("image")){
	                    save=false;
	                    fileObj.delete(); //저장된 파일 객체로 삭제
	                    break;
	                }else{//만약 이미지 파일이면 저장 파일의 이름 바꾼다.
	                	newFileName = "board_"+System.currentTimeMillis(); //저장된 파일을 바꿀 이름
	                	System.out.println("newFileName:"+newFileName);
	                    newFileName =  newFileName + "." +fileExtend;
	                    fileObj.renameTo(new File(newFileName));
	                }
	                */
	            }filelist += fileName + "/";
	            
	        }
	       
	        
	       
	        
			String ctname = multi.getParameter("category");
			String title = multi.getParameter("title");
			int price = Integer.parseInt(multi.getParameter("price"));
			String content = multi.getParameter("content");
			String id = (String)session.getAttribute("id");
			String ctcode = dao.getCtcode(ctname);
			
			bdindex = multi.getParameter("bdindex");
			
			
			board.setCtcode(ctcode);
			board.setTitle(title);
			board.setPrice(price);
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
