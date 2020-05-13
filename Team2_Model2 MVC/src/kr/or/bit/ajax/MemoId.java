package kr.or.bit.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.Empdao;
/*

id 검증 (사용자에 입력한 id ) DB에 있는지 없는지 확인 
isCheckById 사용해서 
return "false" or "true"
 
*/
@WebServlet("/MemoId")
public class MemoId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemoId() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		System.out.println(id);
		Empdao dao=null;
			try {
				dao = new Empdao();
			}catch(Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		String idcheck = dao.isCheckById(id);
		out.print(idcheck); //true or false
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
