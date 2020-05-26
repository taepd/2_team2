package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import kr.or.bit.dto.Admin;
import kr.or.bit.dto.Emp;
import kr.or.bit.utils.ConnectionHelper;
import kr.or.bit.utils.DB_Close;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
DB작업
CRUD 작업을 하기위한 함수를 생성하는 곳

memo table 에 데이터 에 대해서
전제조회 : select id, email ,content from memo
조건조회 : select id, email ,content from memo where id=?
수정 : update memo set email=? , content=? where id=?
삭제 : delete from memo where id=?
삽입 : insert into memo(id,email,content) values(?,?,?)

default 5개
필요하시면 함수는 추가 .....^^
*/
public class Empdao {
	/*
	 * 기존 방식 Connection conn = null; public memodao() { conn =
	 * Singleton_Helper.getConnection("oracle"); }
	 */
	/*
	 * DataSource ds = null; public memodao(){ try { Context context = new
	 * InitialContext(); //현재 프로젝트에 이름기반 검색 ds =
	 * (DataSource)context.lookup("java:comp/env/jdbc/oracle");//java:comp/env/ +
	 * name //각가의 함수 안에서 얻고 반환하고 .... } catch (Exception e) {
	 * System.out.println(e.getMessage()); }
	 * 
	 * }
	 */

	// 1건의 데이터 read (where 조건으로 사용되는 컬럼은 반드시 unique , primary key)
//	public Emp getMemoListById(String id) {
//		/*
//		  select id, email ,content from memo where id=?
//		  memo m = new memo();
//		  m.setId(rs.getInt(1)) ...
//		  return m
//		*/
//		return null;
//	}

	// 전체 데이터 read (where 조건절이 없어요)
	public List<Emp> getEmpList(int cpage, int pagesize) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Emp> emplist = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from " + "(select rownum rn,empno, ename, job, deptno from emp"
					+ " where rownum <= ?" + // endrow
					") where rn >= ?"; // startrow
			pstmt = conn.prepareStatement(sql);
			// 공식같은 로직
			int start = cpage * pagesize - (pagesize - 1); // 1 * 5 - (5 - 1) >> 1
			int end = cpage * pagesize; // 1 * 5 >> 5
			//
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			rs = pstmt.executeQuery();
			emplist = new ArrayList<Emp>();
			while (rs.next()) {
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setDeptno(rs.getInt("deptno"));

				emplist.add(emp);
			}
			System.out.println(emplist);
		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return emplist;
	}

	// 사원 상세정보 보기
	public Emp getDetail(int empno) throws SQLException { // 예외 던지기 괜찮은 건가?
		Connection conn = ConnectionHelper.getConnection("oracle"); // 객체 얻기

		PreparedStatement pstmt = null;
		String sql = "select * from emp where empno=?"; // * 하지 말자
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, empno);
		ResultSet rs = pstmt.executeQuery();
		Emp emp = new Emp();
		if (rs.next()) {

			emp.setEmpno(rs.getInt("empno"));
			emp.setEname(rs.getString("ename"));
			emp.setJob(rs.getString("job"));
			emp.setMgr(rs.getInt("mgr"));
			emp.setHiredate(rs.getString("hiredate"));
			emp.setSal(rs.getInt("sal"));
			emp.setComm(rs.getInt("comm"));
			emp.setDeptno(rs.getInt("deptno"));
			emp.setImg(rs.getString("img"));

		}

		DB_Close.close(rs);
		DB_Close.close(pstmt);
		conn.close(); // 반환하기

		return emp;
	}

	// Insert
	// 사원 등록
	// Parameter (id,ename,cotent)
	// 권장: public int insertMemo(memo m){} >> FrameWork 자동화..
	public int insertEmp(Emp emp) {
		Connection conn = null;// 추가
		int resultrow = 0;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가

			String sql = "insert into Emp(empno, ename, job, mgr, hiredate, sal, comm, deptno, img) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, emp.getEmpno());
			pstmt.setString(2, emp.getEname());
			pstmt.setString(3, emp.getJob());
			pstmt.setInt(4, emp.getMgr());
			pstmt.setString(5, emp.getHiredate());
			pstmt.setInt(6, emp.getSal());
			pstmt.setInt(7, emp.getComm());
			pstmt.setInt(8, emp.getDeptno());
			pstmt.setString(9, emp.getImg());
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

	// Update
	// 사원 정보 수정
	// Update
	// 사원 정보 수정
	public int updateEmp(Emp emp) {

		Connection conn = null;// 추가
		int resultrow = 0;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가

			String sql = "update emp set ename=?, job=?, mgr=?, sal=?, comm=?, deptno=?, img=? where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emp.getEname());
			pstmt.setString(2, emp.getJob());
			pstmt.setInt(3, emp.getMgr());

			pstmt.setInt(4, emp.getSal());
			pstmt.setInt(5, emp.getComm());
			pstmt.setInt(6, emp.getDeptno());
			pstmt.setString(7, emp.getImg());
			pstmt.setInt(8, emp.getEmpno());
			resultrow = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Update : " + e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); // 반환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultrow;

		// update memo set email=? , content=? where id=?
		// m.getId()

	}

	// Delete
	// 사원정보 삭제
	public int deleteEmp(int empno) {
		// delete from memo where id=?

		Connection conn = null;
		int resultrow = 0;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "delete from emp where empno=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);

			resultrow = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(pstmt);
			try {
				conn.close(); // 반환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return resultrow;
	}

	// 추가함수 (사원번호 존재 유무 판단 함수)
	public String isCheckByEmpno(int empno) {
		Connection conn = null;// 추가
		String isempno = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");// 추가
			String sql = "select empno from emp where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				isempno = "false";

				// }while(rs.next());
			} else {
				isempno = "true";
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();// 반환하기
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return isempno;
	}

	public int getEmpCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int empcount = 0;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select count(*) from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				empcount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();// 반환하기
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return empcount;
	}

	public Admin getAdmin(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Admin admin = null;
		try {

			conn = ConnectionHelper.getConnection("oracle");
			String sql = "SELECT USERID, PWD FROM ADMINLIST WHERE USERID=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				admin = new Admin();
				admin.setUserid(rs.getString(1));
				admin.setPwd(rs.getString(2));
				System.out.println("rs탐");
			}

		} catch (Exception e) {
			System.out.println("AdminSelect : " + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close();// 반환하기
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return admin;
	}

	// 사원번호로 검색하기
	public List<Emp> getEmpListByEmpno(int empno) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Emp> emplistByEmpno = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select empno, ename, job, deptno from emp where empno like '%' || ? || '%'";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, empno);

			rs = pstmt.executeQuery();
			emplistByEmpno = new ArrayList<Emp>();
			while (rs.next()) {
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setDeptno(rs.getInt("deptno"));

				emplistByEmpno.add(emp);
			}

		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return emplistByEmpno;
	}

	// 부서번호로 검색하기
	public List<Emp> getEmpListByDeptno(int deptno) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Emp> emplistByDeptno = null;
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select empno, ename, job, deptno from emp where deptno = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, deptno);

			rs = pstmt.executeQuery();
			emplistByDeptno = new ArrayList<Emp>();
			while (rs.next()) {
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setJob(rs.getString("job"));
				emp.setDeptno(rs.getInt("deptno"));

				emplistByDeptno.add(emp);
			}

		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return emplistByDeptno;
	}

	// 차트 데이터
	public JSONArray getEmpChartJob() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select job,round(avg(sal),0),max(sal),min(sal) from emp group by job";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				jsonObject.put("job", rs.getString(1));
				jsonObject.put("avg", rs.getInt(2));
				jsonObject.put("max", rs.getInt(3));
				jsonObject.put("min", rs.getInt(4));
				jsonArray.add(jsonObject);
			}

		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return jsonArray;
	}

	public List<String> getEmpJob() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> list = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select distinct job from emp";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			while(rs.next()) {
				list.add(rs.getString(1));
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
	
	
	public List<Integer> getDeptno() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Integer> list = null;
		
		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select distinct deptno from emp";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Integer>();
			while(rs.next()) {
				list.add(rs.getInt(1));
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
	}// datatable용 emplist데이터
	public JSONArray getJsonEmpList() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "select * from emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				jsonObject.put("empno", rs.getInt(1));
				jsonObject.put("ename", rs.getString(2));
				jsonObject.put("job", rs.getString(3));
				jsonObject.put("mgr", rs.getInt(4));
				jsonObject.put("hiredate", rs.getString(5));
				jsonObject.put("sal", rs.getDouble(6));
				jsonObject.put("comm", rs.getDouble(7));
				jsonObject.put("deptno", rs.getInt(8));
				jsonObject.put("img", rs.getString(9));
				jsonArray.add(jsonObject);
			}
			System.out.println(jsonArray);
		} catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		} finally {
			DB_Close.close(rs);
			DB_Close.close(pstmt);
			try {
				conn.close(); // 받환하기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return jsonArray;
	}
	

}
