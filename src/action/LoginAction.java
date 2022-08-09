package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;

public class LoginAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String dbID="bg";
		String dbPW="1234";
		
		Connection conn = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbID,dbPW);
		} catch(Exception e) {
			e.printStackTrace();
		}
		String NICKNAME_PK = request.getParameter("NICKNAME_PK");
		String NAME = request.getParameter("NAME");
		
		session.setAttribute("NICKNAME_PK", NICKNAME_PK);
		
		String sql = "select count(*) from PROFILE where NICKNAME_PK=? and NAME=?";
		try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, NICKNAME_PK);
		pstmt.setString(2, NAME);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()){
			int num = rs.getInt(1);
			if(num==1){
				session.setAttribute("loginId", NICKNAME_PK);
				request.getRequestDispatcher("Controller?command=Main").forward(request, response);
			} else {
				response.sendRedirect("Controller?command=Login");
			}
		}
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}
}
