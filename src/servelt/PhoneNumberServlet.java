package servelt;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bunge.dao.BlockAccountDao;
import com.bunge.dao.BlockPhoneNumberDao;

@WebServlet("/PhoneNumberServlet")
public class PhoneNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String phoneNumber = request.getParameter("phoneNumber");
			//System.out.println("서버에 요청이 들어옴. phoneNumber : " + phoneNumber);
			
			BlockPhoneNumberDao bDao = new BlockPhoneNumberDao();
			boolean result  = false;
			try {
				result = bDao.getBlockPhoneList(phoneNumber);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println(result);
			int ret = 0; // 1이면 사기계좌, 0이면 정상계좌.
			if(result) {
				ret = 1;
			}
			
			response.setContentType("application/json");
			JSONObject obj = new JSONObject();
			obj.put("result", ret);
			
			PrintWriter out = response.getWriter();
			out.println(obj);
	}

}
