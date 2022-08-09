package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.DealingDao;

public class GoDealCancel implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String strDealCancel = dlDao.getDealCancel(dno);
		String[] arrGetDealCancel = strDealCancel.split("/");
		String deliveryCharge = arrGetDealCancel[0]; // 배송비여부
		String imagename = arrGetDealCancel[1]; // 상품이미지이름
		int price = Integer.parseInt(arrGetDealCancel[2]); // 가격
		String productName = arrGetDealCancel[3]; // 상품명
		String sellerFk = arrGetDealCancel[4]; // 판매자닉네임
		String cancelReason = arrGetDealCancel[5]; // 취소이유
		String cancelReasonDetail = arrGetDealCancel[6]; // 취소상세이유
		
		request.setAttribute("deliveryCharge", deliveryCharge);
		request.setAttribute("imagename", imagename);
		request.setAttribute("price", price);
		request.setAttribute("productName", productName);
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("cancelReason", cancelReason);
		request.setAttribute("cancelReasonDetail", cancelReasonDetail);
		request.getRequestDispatcher("DealCancel.jsp?rno="+rno+"&dno="+dno).forward(request, response);
	}

}
