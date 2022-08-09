package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class GoDirectDealCheck implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int	rno = Integer.parseInt(request.getParameter("rno"));
		int dno=0;
		try {
			dno = cDao.getDnoFromRno(rno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String strDirectDealCheck = dDao.getDirectDealCheck(dno);
		String[] arrStrDirectDealCheck = strDirectDealCheck.split("/");
		String sellerFk = arrStrDirectDealCheck[0];
		String consumerFk = arrStrDirectDealCheck[1];
		String productName = arrStrDirectDealCheck[2];
		int price = Integer.parseInt(arrStrDirectDealCheck[3]);
		String place = arrStrDirectDealCheck[4];
		String imagename = arrStrDirectDealCheck[5];
		int productNumber = Integer.parseInt(arrStrDirectDealCheck[6]);
		String directDealPromiseDate = arrStrDirectDealCheck[7];
		String sellerPhoneNumber = dDao.getPhoneNumber(sellerFk);
		String consumerPhoneNumber = dDao.getPhoneNumber(consumerFk);
		
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("consumerFk", consumerFk);
		request.setAttribute("productName", productName);
		request.setAttribute("price", price);
		request.setAttribute("place", place);
		request.setAttribute("imagename", imagename);
		request.setAttribute("productNumber", productNumber);
		request.setAttribute("directDealPromiseDate", directDealPromiseDate);
		request.setAttribute("sellerPhoneNumber", sellerPhoneNumber);
		request.setAttribute("consumerPhoneNumber", consumerPhoneNumber);
		request.getRequestDispatcher("DirectDealCheck.jsp?rno="+rno+"&dno="+dno).forward(request, response);
	}

}
