package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.JjimDao;

public class ProductJjimDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int productnumber = Integer.parseInt(request.getParameter("productnumber_pk"));
		String category1 = request.getParameter("category1");
		String category2 = request.getParameter("category2");
		String category3 = request.getParameter("category3");
		System.out.print("NICKNAME_PK");
		JjimDao jdao = new JjimDao();
		try {
			jdao.jjimdelete(NICKNAME_PK, productnumber);
		} catch(Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("Controller?command=GoProduct&productnumber_pk="+productnumber+"&category1="+category1+"&category2="+category2+"&category3="+category3).forward(request, response);
	}
}
