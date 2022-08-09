package servelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		String nickname = request.getParameter("nickname");
		//System.out.println("요청 받음: "+ nickname + "/" +content);
		
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String dbID="bg";
		String dbPW="1234";
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbID,dbPW);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String sql = "insert into PROFILE_COMMENT(NICKNAME_FK, CONTENT) VALUES(?,?)";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,nickname);
			pstmt.setString(2, content);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}

		
		//여기에 sql문으로 select bno를 가져와서 밑에 있는 bno에 넣어주기
		String sql2 = "SELECT BNO\r\n"
				+ "FROM PROFILE_COMMENT\r\n"
				+ "WHERE 1=1\r\n"
				+ "AND BNO IN (SELECT MAX(BNO) FROM PROFILE_COMMENT)";	//select bno from profile_comment order by bno desc
		int bno = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bno = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String sql3 = "select count(*) from profile_comment where NICKNAME_FK=?";
		int cnt = 0;
		try {
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, nickname);
			ResultSet rs = pstmt3.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		obj.put("bno",bno);
		obj.put("cnt",cnt);
		out.println(obj);
	}
	
}
