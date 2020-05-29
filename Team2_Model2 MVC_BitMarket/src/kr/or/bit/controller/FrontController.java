package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.BitJoin;
import kr.or.bit.service.BitList;
import kr.or.bit.service.BitLogout;
import kr.or.bit.service.BitNorList;
import kr.or.bit.service.BitReplyDelete;
import kr.or.bit.service.BitReplyList;
import kr.or.bit.service.BitReplyReWrite;
import kr.or.bit.service.BitReplyUpdate;
import kr.or.bit.service.BitReplyWrite;
import kr.or.bit.service.BitSelectCategory;
import kr.or.bit.service.BitTrUpdate;
import kr.or.bit.service.BitUpdateOk;
import kr.or.bit.service.BitUserEdit;
import kr.or.bit.service.BitUserEditOk;
import kr.or.bit.service.BitUserProfile;
import kr.or.bit.service.BitUserProfileView;
import kr.or.bit.service.BitUserReplyList;
import kr.or.bit.service.admin.AdminNoticeDetail;
import kr.or.bit.service.admin.AdminNoticeList;
import kr.or.bit.service.admin.NoticeDelete;
import kr.or.bit.service.admin.NoticeListAjax;
import kr.or.bit.service.admin.NoticeUpdate;
import kr.or.bit.service.admin.NoticeWrite;
import kr.or.bit.service.admin.UserDelete;
import kr.or.bit.service.admin.UserDetail;
import kr.or.bit.service.admin.UserList;
import kr.or.bit.service.admin.UserListAjax;
import kr.or.bit.service.qna.QnAAddReadNum;
import kr.or.bit.service.qna.QnADelete; 
import kr.or.bit.service.qna.QnADetail;
import kr.or.bit.service.qna.QnANickList;
import kr.or.bit.service.qna.QnAReDelete;
import kr.or.bit.service.qna.QnAReUpdate;
import kr.or.bit.service.qna.QnAReWrite;
import kr.or.bit.service.qna.QnASearch;
import kr.or.bit.service.qna.QnAUpdate;
import kr.or.bit.service.qna.QnAWrite;
import kr.or.bit.service.BItIdCheck;
import kr.or.bit.service.BItLogin;
import kr.or.bit.service.BitBoardDetail;
import kr.or.bit.service.BitBoardList;
import kr.or.bit.service.BitBoardListAjax;
import kr.or.bit.service.BitBoardWrite;
import kr.or.bit.service.BitCategory;
import kr.or.bit.service.BitDeleteOk;
import kr.or.bit.service.BitDetail;
import kr.or.bit.service.BitImgList;

@WebServlet("*.bit")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();

	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (url_Command.equals("/Login.bit")) {// 로그인
			// 로직
			action = new BItLogin();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/Loginpage.bit")) { // 로그인 페이지로 이동
			// UI
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/Login.jsp");

		} else if (url_Command.equals("/BitJoin.bit")) { // 회원가입 페이지로 이동
			// UI
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/Register.jsp");

		} else if (url_Command.equals("/BitJoinOK.bit")) { // 회원가입
			// 로직
			action = new BitJoin();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitMain.bit")) { // 메인 페이지로 이동 (이미지 게시판으로)
			// UI
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitMain.jsp");

		} else if (url_Command.equals("/BitLogout.bit")) { // 로그아웃
			action = new BitLogout();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/Bitwrite.bit")) { // 메인 글쓰기 게시판 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitWrite.jsp");

		} else if (url_Command.equals("/BitBoardWrite.bit")) { // 메인 게시판 글쓰기
			action = new BitBoardWrite();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitAdminMain.bit")) { // admim 메인페이지 이동
			// UI
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/admin/BitAdminMain.jsp");

		} else if (url_Command.equals("/IdCheck.bit")) { // 아이디 중복 체크
			action = new BItIdCheck();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/NoticeList.bit")) { // 공지사항 게시판 이동
			action = new AdminNoticeList();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/NoticeListAjax.bit")) { // 공지사항 페이징 비동기 호출
			action = new NoticeListAjax();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/NoticeWrite.bit")) { // 공지사항 글쓰기 페이지 이동
			// UI
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/admin/NoticeWrite.jsp");
		} else if (url_Command.equals("/NoticeWriteOk.bit")) { // 공지사항 글 등록
			action = new NoticeWrite();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/AdminNoticeDetail.bit")) { // 공지사항 상세글 보기
			action = new AdminNoticeDetail();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/Category.bit")) { // 카테고리 셀렉트
			action = new BitCategory();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/BitDetail.bit")) { // 상세 페이지
			action = new BitDetail();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/BitList.bit")) { // 리스트 뷰
			action = new BitList();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/BitSelectCategory.bit")) { // 카테고리 셀렉
			action = new BitSelectCategory();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/BitUpdate.bit")) { // 업데이트 페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/BitUpdate.jsp");

		} else if (url_Command.equals("/BitUpdateOk.bit")) { // 업데이트
			action = new BitUpdateOk();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/BitDeleteOk.bit")) { // 삭제
			action = new BitDeleteOk();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/BitUserProfile.bit")) { //마이페이지 이동
    		action = new BitUserProfile();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/BitUserEdit.bit")) { //회원 수정 페이지 이동
    		action = new BitUserEdit();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/BitUserEditOk.bit")) {  //회원 수정 (업데이트)
    		action = new BitUserEditOk();
    		forward = action.execute(request, response);
    		
    	}else if(url_Command.equals("/BitUserReplyList.bit")) {
    		action = new BitUserReplyList();
    		forward = action.execute(request, response);
    		
    	}else if (url_Command.equals("/BitBoardListAjax.bit")) { // 비동기로 리스트 조회
			action = new BitBoardListAjax();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitImgList.bit")) { // 첫 화면에서 리스트 조회
			action = new BitImgList();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitNorList.bit")) { // 첫 화면에서 리스트 조회
			action = new BitNorList();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitBoardDetail.bit")) { // 메인 게시글 상세보기
			action = new BitBoardDetail();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitReplyWriteOk.bit")) { // 댓글 작성
			action = new BitReplyWrite();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitReplyReWriteOk.bit")) { // 대댓글 작성
			action = new BitReplyReWrite();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitReplyList.bit")) { // 댓글 조회
			action = new BitReplyList();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitReplyUpdateOk.bit")) { // 댓글 수정
			action = new BitReplyUpdate();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitReplyDeleteOk.bit")) { // 댓글 삭제
			action = new BitReplyDelete();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitSelectCategory.bit")) { // 카테고리 셀렉
			action = new BitSelectCategory();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/Category.bit")) { // 카테고리 셀렉트
			action = new BitCategory();
			forward = action.execute(request, response);
		} else if (url_Command.equals("/BitTrUpdateOk.bit")) { // 거래 완료 체크
			action = new BitTrUpdate();
			forward = action.execute(request, response);
		}
		// 공지사항 시작
		else if (url_Command.equals("/NoticeUpdate.bit")) { // 공지사항 수정 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/admin/NoticeUpdate.jsp");

		} else if (url_Command.equals("/NoticeUpdateOk.bit")) { // 공지사항 수정 완료
			action = new NoticeUpdate();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/NoticeDeleteOk.bit")) { // 공지사항 삭제
			action = new NoticeDelete();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/UserList.bit")) {// 회원 목록 이동
			action = new UserList();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/UserDetail.bit")) { // 회원 정보 상세 이동
			action = new UserDetail();
			forward = action.execute(request, response);

		} else if (url_Command.equals("/UserDeleteOK.bit")) { // 회원 정보 삭제
			action = new UserDelete();
			forward = action.execute(request, response);
		}else if(url_Command.equals("/UserListAjax.bit")) {    // 회원 목록 AJAX
    		action = new UserListAjax();
    		forward = action.execute(request, response);   	
    	
    	}else if(url_Command.equals("/BitUserProfileView.bit")) { //다른 이용자 페이지 조회
    		action = new BitUserProfileView();
    		forward = action.execute(request, response);
    		
    	}

/////////////////////////////////////////////+++
//QnA 리스트 로직
		else if (url_Command.equals("/QnAList.bit"))

		{
			action = new QnANickList();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 상세보기 로직
		} else if (url_Command.equals("/QnADetail.bit")) {
			action = new QnADetail();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 글쓰기 UI	
		} else if (url_Command.equals("/QnAWrite.bit")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/qna/QnAWrite.jsp");

/////////////////////////////////////////////
//QnA 글쓰기 로직
		} else if (url_Command.equals("/QnAWriteOk.bit")) {
			action = new QnAWrite();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 삭제 로직	
		} else if (url_Command.equals("/QnADelete.bit")) {
			action = new QnADelete();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 수정 UI	
		} else if (url_Command.equals("/QnAUpdate.bit")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/qna/QnAUpdate.jsp");

/////////////////////////////////////////////
//QnA 수정 로직	
		} else if (url_Command.equals("/QnAUpdateOk.bit")) {
//String scstate = request.getParameter("scstate");
//request.setAttribute("scstate", scstate);
			action = new QnAUpdate();
			forward = action.execute(request, response);

/////////////////////////////////////////////+++
//QnA 댓글(관리자 답변)	쓰기
		} else if (url_Command.equals("/QnAReWrite.bit")) {
			action = new QnAReWrite();
			forward = action.execute(request, response);

/////////////////////////////////////////////+++
//QnA 댓글(관리자 답변)	수정
		} else if (url_Command.equals("/QnAReUpdate.bit")) {
			action = new QnAReUpdate();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 댓글(관리자 답변)	삭제	
		} else if (url_Command.equals("/QnAReDelete.bit")) {
			action = new QnAReDelete();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 조회수증가
		} else if (url_Command.equals("/QnAAddReadNum.bit")) {
			action = new QnAAddReadNum();
			forward = action.execute(request, response);

/////////////////////////////////////////////
//QnA 검색
		} else if (url_Command.equals("/QnASearch.bit")) {
			action = new QnASearch();
			forward = action.execute(request, response);

/////////////////////////////////////////////+++
//QnA 리스트 로직(닉네임 포함)
		} else if (url_Command.equals("/QnANickList.bit")) {
			action = new QnANickList();
			forward = action.execute(request, response);

		}

		// 뷰 지정하기
		// RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		if (forward != null) {
			if (forward.isRedirect()) { // 형식적으로 있지만 잘 안쓴다 주소가 바뀌기 때문에.
				response.sendRedirect(forward.getPath());
			} else { // false (모든 자원) 사용
				// UI
				// UI + 로직
				// forward url 주소 변환 없이 view 내용을 받을 수 있다
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
