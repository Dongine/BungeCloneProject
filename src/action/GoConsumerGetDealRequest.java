package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;

public class GoConsumerGetDealRequest implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
	    int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		ChatDao cDao = new ChatDao();
		String strDealFromConsumer = cDao.getDealFromConsumer(dno);
		String[] arrStrDealFromConsumer = strDealFromConsumer.split("/");
		String sellerFk = arrStrDealFromConsumer[0]; // 판매자닉네임
		String consumerFk = arrStrDealFromConsumer[1]; // 구매자닉네임
		String productName = arrStrDealFromConsumer[2]; // 상품명
		int price = Integer.parseInt(arrStrDealFromConsumer[3]); // 상품가격
		String address = arrStrDealFromConsumer[4]; // 주소
		String detailedAddress = arrStrDealFromConsumer[5]; // 상세주소
		String addressName = arrStrDealFromConsumer[6]; // 집주인명
		String imagename = arrStrDealFromConsumer[7]; // 상품사진
		String deliveryCharge = arrStrDealFromConsumer[8]; // 배송비여부
		String phoneNumber = arrStrDealFromConsumer[9]; // 핸드폰번호  
		
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("consumerFk", consumerFk);
		request.setAttribute("productName", productName);
		request.setAttribute("price", price);
		request.setAttribute("address", address);
		request.setAttribute("detailedAddress", detailedAddress);
		request.setAttribute("addressName", addressName);
		request.setAttribute("imagename", imagename);
		request.setAttribute("deliveryCharge", deliveryCharge);
		request.setAttribute("phoneNumber", phoneNumber);
		
		request.getRequestDispatcher("ConsumerGetDealRequest.jsp?rno="+rno+"&dno"+dno).forward(request, response);
	}
}
