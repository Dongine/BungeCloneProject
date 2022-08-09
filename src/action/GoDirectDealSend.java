package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.DealingDao;

public class GoDirectDealSend implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		
		String nicknameFk = request.getParameter("nicknameFk");
		String imagename = request.getParameter("imagename");
		String productname = request.getParameter("productname");
		int price = Integer.parseInt(request.getParameter("price"));

		DealingDao dDao = new DealingDao();
		String strConsumerPhoneNumber = dDao.getPhoneNumber(NICKNAME_PK);
		request.setAttribute("nicknameFk", nicknameFk);
		request.setAttribute("imagename", imagename);
		request.setAttribute("productname", productname);
		request.setAttribute("price", price);
		request.setAttribute("strConsumerPhoneNumber", strConsumerPhoneNumber);
		request.getRequestDispatcher("DirectDealSend.jsp?productnumber_pk="+productnumber_pk).forward(request, response);
	}
	
}
