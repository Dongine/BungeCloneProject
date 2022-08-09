package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class AddressSendAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		System.out.println("productnumber_pkSendAction="+productnumber_pk);
		
		String sellerFk = request.getParameter("sellerFk");
		String productName = request.getParameter("productName");
		int price = Integer.parseInt(request.getParameter("price"));
		String address = request.getParameter("address");
		String detailedAddress = request.getParameter("detailedAddress");
		String addressName = request.getParameter("addressName");
		//String phoneNumber = request.getParameter("phoneNumbe r");
		String imagename = request.getParameter("imagename"); 
		String deliveryCharge = request.getParameter("deliveryCharge");
		
		// 거래내역에 택배거래정보 추가
		dlDao.insertConsumerToSellerDeal(sellerFk, NICKNAME_PK, productName, price, address, detailedAddress, addressName, imagename, deliveryCharge, productnumber_pk);
		
		// dno값 가져오기
		int dno = cDao.getDnoFromConsumerFkProductNumber(NICKNAME_PK, productnumber_pk);
		
		// 채팅방 열기
		cDao.insertRnoPurchaseFkSellerFkDno(NICKNAME_PK, sellerFk, dno);
		
		// 방번호 가져오기
		int rno = cDao.getDnoFromConsumerFkProductNumber(dno);
		
		// 상품상세보기
		cDao.insertChat(rno, NICKNAME_PK, "/;/상품상세보기/;/");
		
		// 택배거래요청
		cDao.insertChat(rno, NICKNAME_PK, "/;/구매자의_거래요청/;/");

		//opener.location.reload();
		request.getRequestDispatcher("Controller?command=GoSellerToDealRequest&productnumber_pk="+productnumber_pk+"&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
