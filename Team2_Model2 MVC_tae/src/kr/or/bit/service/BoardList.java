package kr.or.bit.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.BoardDao;
import kr.or.bit.dto.Board;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BoardList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;

		// 상세보기 >> 다시 LIST 넘어올때 >> 현재 페이지 설정
		String ps = request.getParameter("ps"); // pagesize
		String cp = request.getParameter("cp"); // current page

		// List 페이지 처음 호출 ...
		if (ps == null || ps.trim().equals("")) {
			// default 값 설정
			ps = "5"; // 5개씩
		}

		if (cp == null || cp.trim().equals("")) {
			// default 값 설정
			cp = "1"; // 1번째 페이지 보겠다
		}

		int pagesize = Integer.parseInt(ps);
		int cpage = Integer.parseInt(cp);
		int pagecount = 0;

		try {
			BoardDao dao = new BoardDao();
			// 전체 목록 가져오기
			List<Board> list = dao.list(cpage, pagesize); // list >> 1 , 5
			request.setAttribute("list", list);
			
			/*if (list == null || list.size() == 0) {
				PrintWriter out = response.getWriter();
				out.print("<tr><td colspan='5'>데이터가 없습니다</td></tr>");
			}*/
			
			// 게시물 총 건수
			int totalboardcount = dao.totalBoardCount();

			// 23건 % 5
			if (totalboardcount % pagesize == 0) {
				pagecount = totalboardcount / pagesize; // 20 << 100/5
			} else {
				pagecount = (totalboardcount / pagesize) + 1;
			}
			// 102건 : pagesize=5 >> pagecount=21페이지

			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("totalempcount", totalboardcount);
			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/board/board_list.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;

	}
}
