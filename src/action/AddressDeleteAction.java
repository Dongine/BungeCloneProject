package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.AccountPlaceDao;

public class AddressDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));

		int productnumber_pk = 0;
		try {
			productnumber_pk = Integer.parseInt(request.getParameter("productnumber_pk"));
		} catch(NumberFormatException e) { }
	
		AccountPlaceDao apDao = new AccountPlaceDao();
		request.setCharacterEncoding("utf-8");
		String addressName = request.getParameter("address_name");
		String phoneNumber = request.getParameter("phone_number");
		String address = request.getParameter("address");
		String detailedAddress = request.getParameter("detailed_address");
		String nicknamePk = request.getParameter("nickname_pk");
		apDao.updateAddressToDelete(addressName, phoneNumber, address, detailedAddress, NICKNAME_PK);
		//alert("등록된 주소정보가 삭제되었습니다");
		//opener.location.reload();
		request.getRequestDispatcher("Controller?command=GoAddressManagement").forward(request, response);
	}
}
