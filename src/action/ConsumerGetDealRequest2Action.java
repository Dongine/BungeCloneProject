package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class ConsumerGetDealRequest2Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String accountNumber = request.getParameter("accountNumber");
		String bankName = request.getParameter("bankName");
		String accountHolder = request.getParameter("accountHolder");
		
		
		dlDao.updateSellerToConsumerDealDone(bankName, accountHolder, accountNumber, dno);
		cDao.insertChat(rno, NICKNAME_PK, "/;/판매자의_거래요청/;/");
		request.getRequestDispatcher("Controller?command=GoConsumerToDealRequest&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
