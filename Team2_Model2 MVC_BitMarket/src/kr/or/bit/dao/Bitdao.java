package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.or.bit.dto.Board;
import kr.or.bit.dto.User;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;

public class Bitdao {

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
			
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}else {
				num = 1;
			}
			
			sql = "insert into board (bdindex,title,price,content,RTIME,trstate,delstate,count,id,ctcode)" + 
					"values(?,?,?,?,sysdate,?,?,?,?,?)";
			
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
}
