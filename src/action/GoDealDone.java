package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.DealingDao;

public class GoDealDone implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
	
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String strDealDone = dlDao.getDealDone(dno);
		String[] arrGetDealDone = strDealDone.split("/");
		String imagename = arrGetDealDone[0];
		int price = Integer.parseInt(arrGetDealDone[1]);
		String productName = arrGetDealDone[2];
		String sellerFk = arrGetDealDone[3];
		String deliveryCharge = arrGetDealDone[4];
		
		request.setAttribute("imagename", imagename);
		request.setAttribute("price", price);
		request.setAttribute("productName", productName);
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("deliveryCharge", deliveryCharge);
		request.getRequestDispatcher("DealDone.jsp?rno="+rno+"&dno="+dno).forward(request, response);
	}
	
}
