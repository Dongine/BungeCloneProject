package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class DirectDealCheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		DealingDao dDao = new DealingDao();
		dDao.updateDealDone(dno);
		
		int productnumber = cDao.getProductnumberFromDno(dno);
		
		dlDao.updateDealCheck(productnumber);
		
		cDao.insertChat(rno, NICKNAME_PK, "/;/직거래완료/;/");
		cDao.updateChatDirectDone(rno);
		request.getRequestDispatcher("Controller?command=GoDirectDealDone&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
