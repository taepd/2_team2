package kr.or.bit.utils;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionHelper {
	public static Connection getConnection(String dsn) { //oracle, mysql
			Connection conn = null;
		try {
			  if(dsn.equals("oracle")) {
				  Class.forName("oracle.jdbc.OracleDriver");
				  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004");
			  }else if(dsn.equals("mysql")) {
				  Class.forName("com.mysql.jdbc.Driver");
				  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopmall","bit","1004");
			  }
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
		
	}
	
	public static Connection getConnection(String dsn , String id , String pwd) { //oracle, mysql
		Connection conn = null;
	try {
		  if(dsn.equals("oracle")) {
			  Class.forName("oracle.jdbc.OracleDriver");
			  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE",id,pwd);
		  }else if(dsn.equals("mysql")) {
			  Class.forName("com.mysql.jdbc.Driver");
			  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopmall",id,pwd);
		  }
		
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
	return conn;
	
}
}



