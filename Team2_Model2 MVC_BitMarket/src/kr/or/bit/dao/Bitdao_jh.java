package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.Admin;
import kr.or.bit.dto.Board;

import kr.or.bit.dto.Category;
import kr.or.bit.dto.Reply;
import kr.or.bit.dto.User;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;

public class Bitdao_jh {

	// 회원가입
	// 사원 등록
	// Parameter (id,ename,cotent)
	// 권장: public int insertMemo(memo m){} >> FrameWork 자동화..
	
	public int joinUser(User user) {
		Connection conn = null;// 추가
		int resultrow = 0;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가

			String sql = "insert into bitUSER(profile, id, pwd, nick , loc) values(?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getProfile());
			pstmt.setString(2, user.getId());
			pstmt.setString(3, user.getPwd());
			pstmt.setString(4, user.getNick());
			pstmt.setString(5, user.getLoc());
			
			
			resultrow = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Insert : " + e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultrow;
				
	}
	public User getUser(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		User user = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "SELECT ID, PWD FROM BITUSER WHERE ID=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getString(1));
				user.setPwd(rs.getString(2));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public String getCtcode(String ctname) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ctcode = "";
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select ctcode from category where ctname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ctcode = rs.getString(1);
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			
		}
		
		
		return ctcode;
	}
	
	
	
	
	
	//글쓰기
	public int boardwrite(Board board) {
		int num = 0;
		int result = 0;
		String sql = "";
		
		ResultSet rs = null;
		Connection conn = null;// 추가
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			pstmt = conn.prepareStatement("select max(bdindex) from board");
			rs = pstmt.executeQuery();
			
			
			sql = "insert into board (bdindex,title,price,content,RTIME,trstate,delstate,count,id,ctcode)" + 
					"values(board_idx.nextval,?,?,?,sysdate,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getTitle());
			pstmt.setInt(3, board.getPrice());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setString(8, board.getId());
			pstmt.setInt(9, 1);
			
			result = pstmt.executeUpdate();
			System.out.println(result);
			
		} catch (Exception e) {
			System.out.println("Insert : " + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//게시글 조회하기
	public List<Board> getBoardList(int cpage, int pagesize) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardlist = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from " +
                    				"(select rownum rn,bdindex,title,price,content,rtime,trstate,delstate,count " +
                    				",id,ctcode,img" +
                    				" from (SELECT * FROM board ORDER BY bdindex desc) "+
                    				" where rownum <= ?" + 
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
				board.setBdindex(rs.getInt("bdindex"));
				board.setTitle(rs.getString("title"));
				board.setPrice(rs.getInt("price"));
				board.setContent(rs.getString("content"));
				board.setRtime(rs.getString("rtime"));
				board.setTrstate(rs.getString("trstate"));
				board.setDelstate(rs.getString("delstate"));
				board.setId(rs.getString("id"));
				board.setCount(rs.getInt("count"));
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
	
	
	//회원 조회하기 (회원의 위치 조회용)
		public List<User> getUserList() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<User> userlist = null;
			
			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "select * from bituser"; 
				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();
				userlist = new ArrayList<User>();
				while(rs.next()) {
					User user = new User();
					user.setId(rs.getString("id"));
					user.setLoc(rs.getString("loc"));
					user.setNick(rs.getString("nick"));
					user.setProfile(rs.getString("profile"));
					userlist.add(user);
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
			return userlist;
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
	
	
	
	public Admin getAdmin(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Admin admin = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "SELECT ID, PWD FROM ADMIN WHERE ID=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				admin = new Admin();
				admin.setId(rs.getString(1));
				admin.setPwd(rs.getString(2));
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return admin;
	}
	/*
	public List<BoardUserCt_Join> getBoardJoinListByCn() {
		Connection conn = null;
		PreparedStatement  pstmt = null;
		ResultSet rs = null;
		List<BoardUserCt_Join> list = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from (SELECT b.title,b.price,b.rtime,b.ctcode,b.bdindex,u.id,u.loc FROM board b JOIN bituser u ON b.id = u.id order by b.bdindex desc) e join category c on e.ctcode = c.ctcode where ctname=?";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<BoardUserCt_Join>();
			while(rs.next()) {
				BoardUserCt_Join boardjoin = new BoardUserCt_Join();
				boardjoin.setBdindex(rs.getInt("bdindex"));
				boardjoin.setCname(rs.getString("cname"));
				boardjoin.setCtcode(rs.getInt("e.ctcode"));
				boardjoin.setId(rs.getString("id"));
				boardjoin.setLoc(rs.getString("loc"));
				boardjoin.setPrice(rs.getInt("price"));
				boardjoin.setRtime(rs.getString("rtime"));
				boardjoin.setTitle(rs.getString("title"));
				
				list.add(boardjoin);
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
		return list;
	}
	*/
	//게시물 상세 조회
	/*
	public Board getBoardByIdx(int bdindex) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from board where bdindex=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board = new Board();
				board.setId(rs.getString("id"));
				board.setContent(rs.getString("content"));
				board.setPrice(rs.getInt("price"));
				board.setRtime(rs.getString("rtime"));
				board.setTitle(rs.getString("title"));
				board.(rs.getInt("readnum"));
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
*/
	
	
	//상세페이지
		public Board getBoardByIdx(int bdindex) throws SQLException {
			Connection conn = ConnectionHelper.getConnection("oracle");
			
			PreparedStatement pstmt = null;
			String sql = "select * from board where bdindex=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bdindex);
			ResultSet rs = pstmt.executeQuery();
			Board board = new Board();
			
			if(rs.next()) {
				board.setBdindex(rs.getInt("bdindex"));
				board.setCtcode(rs.getString("ctcode"));
				board.setTitle(rs.getString("title"));
				board.setPrice(rs.getInt("price"));
				board.setContent(rs.getString("content"));
				board.setRtime(rs.getString("rtime"));
				board.setTrstate(rs.getString("trstate"));
				board.setDelstate(rs.getString("delstate"));
				board.setCount(rs.getInt("count"));
				board.setId(rs.getString("id"));
				board.setImg(rs.getString("img"));
				
			}
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			conn.close(); // 반환하기

			return board;
		}
		
		//카테고리 전체 가져오기
		public List<Category> getCategoryList(){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Category> ctlist = null;
			
			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "select*from category";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				ctlist = new ArrayList<Category>();
				
				while(rs.next()) {
					Category category = new Category();
					category.setCtcode(rs.getString("ctcode"));
					category.setCtname(rs.getString("ctname"));
					
					ctlist.add(category);
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
	 	
			return ctlist;
		}
		
		
		//댓글 쓰기
		public int writeReply(Reply reply) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int resultrow = 0;
			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "insert into reply(rpindex,content,scstate,delstate,trstate,rtime,depth,id,bdindex,refer) "+
							 "values(reply_no.nextval,?,?,'N','N',sysdate,0,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, reply.getContent());
				pstmt.setString(2, reply.getScstate());
				pstmt.setString(3, reply.getId());
				pstmt.setInt(4, reply.getBdindex());
				
				
				int refer = getReplyMaxRefer();
				pstmt.setInt(5, refer);
				
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
		public List<Reply> getReplyList(int bdindex) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Reply> replylist = null;
			
			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "select * from reply where bdindex=? order by rpindex asc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bdindex);
				
				rs=pstmt.executeQuery();
				
				replylist = new ArrayList<Reply>();
				
				while (rs.next()) {
					Reply reply = new Reply();
					reply.setRpindex(rs.getInt("rpindex"));
					reply.setId(rs.getString("id"));
					reply.setContent(rs.getString("content"));
					reply.setRtime(rs.getString("rtime"));
					reply.setScstate(rs.getString("scstate"));
					reply.setDelstate(rs.getString("delstate"));
					reply.setBdindex(rs.getInt("bdindex"));
					
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
		//댓글 삭제하기 (delstate를 y로 바꿈)
		public int deleteReply(int rpindex, String id) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int resultrow = 0;
			
			try {
				conn = ConnectionHelper.getConnection("oracle");
				
				
				String sql = "update reply set delstate='Y' where rpindex=? and id=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rpindex);
				pstmt.setString(2, id);
				
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
		public int updateReply(int rpindex, String id, String content) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int resultrow = 0;
			
			try {
				conn = ConnectionHelper.getConnection("oracle");
				
				String sql = "update reply set content=? where rpindex=? and id=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, rpindex);
				pstmt.setString(3, id);
				
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
		
		//댓글 refer 구하기
		public int getReplyMaxRefer() {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int refer_max = 0;
			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "select nvl(max(refer),0) from reply";
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
}
