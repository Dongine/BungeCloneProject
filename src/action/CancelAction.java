package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;
import com.bunge.dao.DealingDao;

public class CancelAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		DealingDao dlDao = new DealingDao();
		ChatDao cDao = new ChatDao();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
System.out.println("rno값 들어옴!" + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
System.out.println("dno값 들어옴?!" + dno);
		String cancelReason = request.getParameter("cancelReason");
		String cancelReasonDetail = request.getParameter("cancelReasonDetail");
		
		dlDao.updateDealCancel(cancelReason, cancelReasonDetail, dno);
		cDao.updateChatCancel(rno);
		
		// 거래취소 메시지보내기
		cDao.insertChat(rno, NICKNAME_PK, "/;/거래취소/;/");

		//opener.location.reload();
		request.getRequestDispatcher("Controller?command=GoDealCancel&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
