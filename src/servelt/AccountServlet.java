package servelt;

import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bunge.dao.BlockAccountDao;
import com.bunge.dao.BlockPhoneNumberDao;
import com.bunge.dao.DBConnection;

@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String account = request.getParameter("account");
		//System.out.println("서버에 요청이 들어옴. account : " + account);
		
		BlockAccountDao bDao = new BlockAccountDao();
		boolean result  = false;
		try {
			result = bDao.getBlockAccountList(account);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int ret = 0;  // 1이면 사기계좌, 0이면 정상계좌.
		if(result) {
			ret = 1;
		}
		
		// 이제, ret를 응답으로 실어서 보내면 돼. --> JSON.
		response.setContentType("application/json");  // MIME
		JSONObject obj = new JSONObject();
		obj.put("result",ret);
		
		PrintWriter out = response.getWriter();
		out.println(obj);
	}
}
