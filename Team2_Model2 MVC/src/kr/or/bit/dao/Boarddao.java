package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.Reply;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;

public class Boarddao {
	
	
	
	//게시글 쓰기
	public int writeBoard(Board board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into board(idx,writer,subject,content,email,homepage,writedate,readnum,filename,filesize,refer)"+
						 "values(board_idx.nextval,?,?,?,?,?,sysdate,0,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getEmail());
			pstmt.setString(5, board.getHomepage());
			pstmt.setString(6, board.getFilename());
			
			int refer = getMaxRefer() + 1;
			
			pstmt.setInt(7, refer);
			
			resultrow = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return resultrow;
	}
	
	//게시글 refer 구하기
	public int getMaxRefer() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int refer_max = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select nvl(max(refer),0) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		
		return refer_max;
	}
	
	
	
	
	
	//게시글 수정
	public int updateBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");	
			String sql = "update board set subject=?, content=?, email=?, homepage=?, filename=? where idx=? and writer=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getHomepage());
			pstmt.setString(5, board.getFilename());
			pstmt.setInt(6, board.getIdx());
			pstmt.setString(7, board.getWriter());
			resultrow = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return resultrow;
	}
	
	//게시글 삭제
	public int deleteBoard(int idx, String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			//ID검증
			String sql_writer = "select writer from board where idx=? and writer=?";
			//댓글 삭제
			String sql_reply = "delete from reply where idx=?";
			//게시글 삭제
			String sql_board = "delete from board where idx=?";
			
			pstmt = conn.prepareStatement(sql_writer);
			pstmt.setInt(1, idx);
			pstmt.setString(2, writer);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(writer.equals(rs.getString(1))) {
					conn.setAutoCommit(false);
					
					
					DB_Close.close(pstmt);	
					pstmt = conn.prepareStatement(sql_reply);
					pstmt.setInt(1, idx);
					pstmt.executeUpdate();
					
					//게시글 삭제
					DB_Close.close(pstmt);
					pstmt = conn.prepareStatement(sql_board);
					pstmt.setInt(1, idx);
					resultrow = pstmt.executeUpdate();
					if(resultrow > 0) {
						conn.commit();
					}
					
				}else { //ID 일치하지 않는 경우
					resultrow = -1;
				}
			}
		} catch (Exception e) {
			//예외 발생시 rollback
			try {
				conn.rollback();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			DB_Close.close(rs);
			try {
				conn.close();
			} catch (Exception e3) {
				System.out.println(e3.getMessage());
			}
		}
		return resultrow;
	}
	
	//게시글 목록 조회
	public List<Board> getBoardList(int cpage, int pagesize) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardlist = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from " +
                    				"(select rownum rn,idx,writer,email,homepage,subject,content,writedate,readnum " +
                    				",filename,filesize,refer,depth,step" +
                    				" from ( SELECT * FROM board ORDER BY refer DESC , step ASC) "+
                    				" where rownum <= ?" +  //endrow
                    	") where rn >= ?";
			pstmt = conn.prepareStatement(sql);
			
			int start = cpage * pagesize - (pagesize - 1);
			int end = cpage * pagesize;
			
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			boardlist = new ArrayList<Board>(); 
			while(rs.next()) {
				Board board = new Board();
				board.setIdx(rs.getInt("idx"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setWritedate(rs.getDate("writedate"));
				board.setReadnum(rs.getInt("readnum"));
				board.setRefer(rs.getInt("refer"));
				board.setStep(rs.getInt("step"));
				board.setDepth(rs.getInt("depth"));
				
				boardlist.add(board);
			}
			System.out.println(boardlist.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return boardlist;
	}
	
	//게시글 총 건수 구하기
	public int getTotalBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totalcount = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalcount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return totalcount;
	}
	
	
	//게시글 상세 보기
	public Board getBoardByIdx(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board = new Board();
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setEmail(rs.getString("email"));
				board.setSubject(rs.getString("subject"));
				board.setWritedate(rs.getDate("writedate"));
				board.setReadnum(rs.getInt("readnum"));
				board.setFilename(rs.getString("filename"));
				board.setFilesize(rs.getInt("filesize"));
				board.setRefer(rs.getInt("refer"));
				board.setStep(rs.getInt("step"));
				board.setDepth(rs.getInt("depth"));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		
		return board;
	}
	
	//조회수 증가
	public boolean getReadNum(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result = false;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "update board set readnum = readnum + 1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			resultrow = pstmt.executeUpdate();
			if(resultrow > 0) {
				result = true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return result;
	}
	
	
	//게시글 답글 쓰기
	public int reWriteBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int resultrow = 0;
		
		try {
			
			int idx = board.getIdx();
			System.out.println("idx"+idx);
			conn = ConnectionHelper.getConnection("oracle");
			
			//refer, depth, step 조회
			String sql_refer_depth_step = "select refer, depth, step from board where idx=?";
			
			//step+1
			String sql_update = "update board set step = step+1 where step > ? and refer=?";
			
			//rewrite
			String sql_rewrite = "insert into board(idx,writer,subject,content,email,homepage,writedate,readnum,filename,filesize,refer,depth,step)" +
								 " values(board_idx.nextval,?,?,?,?,?,sysdate,0,?,0,?,?,?)";
			
			pstmt = conn.prepareStatement(sql_refer_depth_step);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
			
				//닫아주고 실행 (step+1)
				DB_Close.close(pstmt);
				pstmt = conn.prepareStatement(sql_update);
				pstmt.setInt(1, step);
				pstmt.setInt(2, refer);
				pstmt.executeUpdate();
				
				//닫아주고 실행 (rewrite)
				DB_Close.close(pstmt);
				pstmt = conn.prepareStatement(sql_rewrite);
				pstmt.setString(1, board.getWriter());
				pstmt.setString(2, board.getSubject());
				pstmt.setString(3, board.getContent());
				pstmt.setString(4, board.getEmail());
				pstmt.setString(5, board.getHomepage());
				pstmt.setString(6, board.getFilename());
				pstmt.setInt(7, refer);
				pstmt.setInt(8, depth+1);
				pstmt.setInt(9, step+1);
				
				int row = pstmt.executeUpdate();
			
				if(row > 0) {
					resultrow = row;
				}else {
					resultrow = -1;
				}
			}else {
				System.out.println("실패");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return resultrow;
	}
	
	//댓글 입력하기
	public int writeReply(int idx, String writer, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "insert into reply(no,writer,content,writedate,idx) "+
						 "values(reply_no.nextval,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, content);
			pstmt.setInt(3, idx);
			
			resultrow = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return resultrow;
	}
	
	//댓글 조회하기
	public List<Reply> getReplyList(int idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> replylist = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from reply where idx=? order by no asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			rs=pstmt.executeQuery();
			
			replylist = new ArrayList<Reply>();
			
			while (rs.next()) {
				Reply reply = new Reply();
				reply.setNo(rs.getInt("no"));
				reply.setWriter(rs.getString("writer"));
				reply.setContent(rs.getString("content"));
				
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

				String writedate = transFormat.format(rs.getDate("writedate"));

				reply.setWritedate(writedate);
				reply.setIdx_fk(rs.getInt("idx"));
				
				replylist.add(reply);
			}			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		
		
		return replylist;
	}
	//댓글 삭제하기
	public int deleteReply(int no, String writer) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			
			
			String sql = "delete from reply where no=? and writer=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, writer);
			
			resultrow = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return resultrow;
	}
	
	//댓글 수정하기
	public int updateReply(int no, String writer, String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int resultrow = 0;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			
			String sql = "update reply set content=? where no=? and writer=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, no);
			pstmt.setString(3, writer);
			
			resultrow = pstmt.executeUpdate();
			System.out.println(resultrow);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return resultrow;
	}
	
}
