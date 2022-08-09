package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.AccountPlaceDao;
import com.bunge.dao.ProductDao;

public class GoAddressManagement implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		request.setCharacterEncoding("utf-8");
		AccountPlaceDao apDao = new AccountPlaceDao();
		ProductDao pdDao = new ProductDao();
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		// 구매자정보 가져오기
		String strAddressSelect = apDao.getAddressSelect(NICKNAME_PK);
		String[] arrStrAddressSelect = strAddressSelect.split("/");
		String addressName = arrStrAddressSelect[0]; // 이름
		String phoneNumber = arrStrAddressSelect[1]; // 휴대폰번호
		String address = arrStrAddressSelect[2];  // 주소
		String detailedAddress = arrStrAddressSelect[3];  // 상세주소
		
		// 상품정보 가져오기
		String strProductSelect = pdDao.getSellerProduct(productnumber_pk);
		String[] arrStrProductSelect = strProductSelect.split("/");
System.out.println("옴?");
		String nicknameFk = arrStrProductSelect[0];
System.out.println("옴??Fk" + nicknameFk);
		String imagename = arrStrProductSelect[1];
System.out.println("옴??? " + imagename);
		String productname = arrStrProductSelect[2];
		int price = Integer.parseInt(arrStrProductSelect[3]);
		String deliveryCharge = arrStrProductSelect[4];

		if(strAddressSelect.contains("null")) {
			addressName = null;
			phoneNumber = null;
			address = null;
			detailedAddress = null;
		}
		request.setAttribute("addressName", addressName);
		request.setAttribute("phoneNumber", phoneNumber);
		request.setAttribute("address", address);
		request.setAttribute("detailedAddress", detailedAddress);
		request.setAttribute("nicknameFk", nicknameFk);
		request.setAttribute("imagename", imagename);
		request.setAttribute("productname", productname);
		request.setAttribute("deliveryCharge", deliveryCharge);

		request.getRequestDispatcher("AddressManagement.jsp?productnumber_pk="+productnumber_pk).forward(request, response);
	}
}
