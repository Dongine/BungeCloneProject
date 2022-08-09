package servelt;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("요청이 들어옴" + request.getParameter("board_num"));
		int bno = Integer.parseInt( request.getParameter("board_num"));
				
		String driver = "oracle.jdbc.driver.OracleDriver";
		//String url = "jdbc:oracle:thin:@192.168.200.42:1521:xe";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "user0616";
		String dbPW = "pass1234"; 
		
		Connection conn = null;
		try{ 
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbID, dbPW);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String sql = "UPDATE simple_board SET title=title || '!' WHERE bno=?";
		// update문 --> pstmt --> pstmt.executeUpdate()
		int result=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
			
		} catch	(SQLException e){
			e.printStackTrace();
		}
		
		response.setContentType("application/json"); // 응답을 json형식으로 만들겠다.
		PrintWriter out = response.getWriter(); // 응답을 작성할 수 있는 writer를 얻음
		JSONObject obj = new JSONObject(); // "JSONObject" -> json-simple
		if(result==1) {
			// update문 정상적으로 실행
			obj.put("result", "OKAY");
		} else {
			// update문 실행중 문제 발생
			obj.put("result", "FAIL");
		}
		out.println(obj);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post.");
	}

}
