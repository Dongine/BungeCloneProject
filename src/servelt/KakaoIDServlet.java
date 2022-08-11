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

import com.bunge.dao.BlockKakaoIDDao;

@WebServlet("/KakaoIDServlet")
public class KakaoIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kakaoId = request.getParameter("kakaoId");
		
		BlockKakaoIDDao bDao = new BlockKakaoIDDao();
		boolean result  = false;
		try {
			result = bDao.getBlockKakaoList(kakaoId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int ret = 0;  // 1이면 사기계좌, 0이면 정상계좌
		if(result) {
			ret = 1;
		}
		
		response.setContentType("application/json");
		JSONObject obj = new JSONObject();
		obj.put("result",ret);
		
		PrintWriter out = response.getWriter();
		out.println(obj);
	}

}
