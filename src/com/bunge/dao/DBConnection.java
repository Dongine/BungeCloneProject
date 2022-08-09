package com.bunge.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn==null) {
			String driver="oracle.jdbc.driver.OracleDriver";
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String dbID="bg";
			String dbPW="1234";
			
			try{
				Class.forName(driver);
				conn = DriverManager.getConnection(url,dbID,dbPW);
			} catch(Exception e){
				e.printStackTrace();
			} 
		}
		return conn;
	}
	
	public static void close() throws Exception {
		conn.close();
	}

}

// Class.forName(driver)
// conn = DriverManager.getConnection(url,id,pw)

// -------> conn = DBCOnnection.getConnection()

