package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.AccountPlaceDao;
import com.bunge.dao.ProductDao;

public class AddressAddFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		AccountPlaceDao apDao = new AccountPlaceDao();
		ProductDao pdDao = new ProductDao();
	
		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
		System.out.println("이것은 AddressAddAction상품번호다=" + productnumber_pk); 
		String addressName = request.getParameter("addressName");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String detailedAddress = request.getParameter("detailedAddress");
		
		apDao.updateAddressSend(addressName, phoneNumber, address, detailedAddress, NICKNAME_PK);
		if(addressName!=null && phoneNumber!=null && address!=null && detailedAddress!=null) {
			apDao.updateAddressSend(addressName, phoneNumber, address, detailedAddress, NICKNAME_PK); 
		} else {
			String strAddressSelect = apDao.getAddressSelect(NICKNAME_PK);
			String[] arrStrAddressSelect = strAddressSelect.split("/");
			addressName = arrStrAddressSelect[0]; // 이름
			phoneNumber = arrStrAddressSelect[1];  // 핸드폰번호
			address = arrStrAddressSelect[2];  // 주소
			detailedAddress = arrStrAddressSelect[3]; // 상세주소
		} 
		request.getRequestDispatcher("Controller?command=GoAddressManagement&productnumber_pk="+productnumber_pk).forward(request, response);
	}
}
