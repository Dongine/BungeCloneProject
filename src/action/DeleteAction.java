package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "bg";
		String dbPW = "1234";
		
		Connection conn = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbID,dbPW);
		} catch(Exception e){
			e.printStackTrace();		
		}
	
		session.invalidate();
	
		String sql = "DELETE FROM PROFILE WHERE NICKNAME_PK=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NICKNAME_PK);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			request.getRequestDispatcher("Controller?command=GoMain").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
