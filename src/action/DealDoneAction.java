package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class DealDoneAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		String dealDate = request.getParameter("dealDate");
		dlDao.updateDealDone(dno);
		
		int productnumber = cDao.getProductnumberFromDno(dno);
		
		dlDao.updateDealCheck(productnumber);
		cDao.insertChat(rno, NICKNAME_PK, "/;/택배거래완료/;/");
		cDao.updateChatDeliveryDone(rno);
		
		//opener.location.reload();
		request.getRequestDispatcher("Controller?command=GoDealDone&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
