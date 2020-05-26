package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionHelper2 {
	
	
	    public static Connection dbConn;
	    
	        public static Connection getConnection(String string)
	        {
	            Connection conn = null;
	            try {
	               // String user = "scott"; 
	              //  String pw = "tiger";
	                String url = "jdbc:oracle:thin:@localhost:1521:XE";
	                
	                Class.forName("oracle.jdbc.driver.OracleDriver");        
	                conn = DriverManager.getConnection(url, "bit", "1004");
	                
	                System.out.println("Database에 연결되었습니다.\n");
	                
	            } catch (ClassNotFoundException cnfe) {
	                System.out.println("DB 드라이버 로딩 실패 :"+cnfe.toString());
	            } catch (SQLException sqle) {
	                System.out.println("DB 접속실패 : "+sqle.toString());
	            } catch (Exception e) {
	                System.out.println("Unkonwn error");
	                e.printStackTrace();
	            }
	            return conn;     
	        }
	
}
