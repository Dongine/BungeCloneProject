package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class GoDirectDealDone implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK")); 
		int rno = Integer.parseInt(request.getParameter("rno"));
		DealingDao dDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		
		int dno = 0;
		try {
			dno = cDao.getDnoFromRno(rno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String strDirectDealDone = dDao.getDirectDealDone(dno);
		String[] arrStrDirectDealDone = strDirectDealDone.split("/");
		String sellerFk = arrStrDirectDealDone[0];
		String consumerFk = arrStrDirectDealDone[1];
		String productName = arrStrDirectDealDone[2];
		int price = Integer.parseInt(arrStrDirectDealDone[3]);
		String place = arrStrDirectDealDone[4];
		String imagename = arrStrDirectDealDone[5];
		int productnumber = Integer.parseInt(arrStrDirectDealDone[6]);
		String dealDate = arrStrDirectDealDone[7];
		String sellerPhoneNumber = dDao.getPhoneNumber(sellerFk);
		String consumerPhoneNumber = dDao.getPhoneNumber(consumerFk);
		
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("consumerFk", consumerFk);
		request.setAttribute("productName", productName);
		request.setAttribute("price", price);
		request.setAttribute("place", place);
		request.setAttribute("imagename", imagename);
		request.setAttribute("productnumber", productnumber);
		request.setAttribute("dealDate", dealDate);
		request.setAttribute("sellerPhoneNumber", sellerPhoneNumber);
		request.setAttribute("consumerPhoneNumber", consumerPhoneNumber);
		request.getRequestDispatcher("DirectDealDone.jsp?rno="+rno+"&dno="+dno).forward(request, response);
	}

}
