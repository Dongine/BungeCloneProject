package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class GoSellerToDealRequest implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		request.setCharacterEncoding("utf-8");
		
 		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		
		String sellerFk = "";
		String consumerFk = "";
		String productName = "";
		int price = 0;
		String address = "";
		String detailedAddress = "";
		String addressName = "";
		String imagename = "";
		String deliveryCharge = "";
		String phoneNumber = "";
		
		int rno = 0;
		int dno = 0;
		if(productnumber_pk == 0) {
			rno = Integer.parseInt(request.getParameter("rno"));
			dno = Integer.parseInt(request.getParameter("dno"));
			ChatDao cDao = new ChatDao();
			String strDealToSeller = cDao.getDealToSeller(dno);
			String[] arrStrGetDealToSeller = strDealToSeller.split("/");
			sellerFk = arrStrGetDealToSeller[0]; // 구매자닉네임
			productName = arrStrGetDealToSeller[1];
			price = Integer.parseInt(arrStrGetDealToSeller[2]); // 상품가격
			address = arrStrGetDealToSeller[3]; // 주소
			detailedAddress = arrStrGetDealToSeller[4]; // 상세주소
			addressName = arrStrGetDealToSeller[5]; // 집주인명
			imagename = arrStrGetDealToSeller[6]; // 상품사진
			deliveryCharge = arrStrGetDealToSeller[7]; // 배송비여부
			phoneNumber = arrStrGetDealToSeller[8]; // 핸드폰번호   
		} else {
			String strDealingInfoToSeller = dlDao.getDealingInfoToSeller(productnumber_pk);
			System.out.println("strDealingInfoToSeller=" + strDealingInfoToSeller);
			String[] arrStrDealingInfoToSeller = strDealingInfoToSeller.split("/");
			sellerFk = arrStrDealingInfoToSeller[0]; // 판매자 닉네임
			productName = arrStrDealingInfoToSeller[1]; // 상품이름
			price = Integer.parseInt(arrStrDealingInfoToSeller[2]); // 가격
			address = arrStrDealingInfoToSeller[3]; // 주소
			detailedAddress = arrStrDealingInfoToSeller[4]; // 상세주소
			addressName = arrStrDealingInfoToSeller[5]; // 임대인
			imagename = arrStrDealingInfoToSeller[6]; // 상품이미지
			deliveryCharge = arrStrDealingInfoToSeller[7]; // 배송비여부
			phoneNumber = arrStrDealingInfoToSeller[8]; // 구매자핸드폰번호
		}
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("productName", productName);
		request.setAttribute("price", price);
		request.setAttribute("address", address);
		request.setAttribute("detailedAddress", detailedAddress);
		request.setAttribute("addressName", addressName);
		request.setAttribute("imagename", imagename);
		request.setAttribute("deliveryCharge", deliveryCharge);
		request.setAttribute("phoneNumber", phoneNumber);
		request.getRequestDispatcher("SellerToDealRequest.jsp?productnumber_pk="+productnumber_pk+"&rno="+rno+"&dno="+dno).forward(request, response);
	}
	

}
