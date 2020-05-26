import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.Admin;
import kr.or.bit.dto.Board;
import kr.or.bit.dto.User;
import kr.or.bit.utils.*;

//



public class prac {
	
	public static Connection getConnection(String dbname) {
		
		if(dbname.toLowerCase().equals("oracle")) {
			try {
				Context initContext = new InitialContext();
				DataSource source = (DataSource)initContext.lookup("java:comp/env/jdbc/oracle");
				Connection conn = source.getConnection();
				return conn;
			} catch (Exception e) {
				System.out.println("connection" + e.getMessage());
				return null;
			}
		}else if (dbname.toLowerCase().equals("mysql")){
			try {
				
				Class.forName("");
				Connection conn = DriverManager.getConnection("");
				
				return conn;
			} catch (Exception e) {
				return null;
			}
		}else {
			return null;
		}
	}
	
}
