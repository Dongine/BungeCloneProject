package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.AccountPlaceDao;

public class AccountDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		System.out.println("rno 들어옴 : " + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		AccountPlaceDao apDao = new AccountPlaceDao();
		request.setCharacterEncoding("utf-8");
		String bankName = request.getParameter("bankName");
		String accountHolder = request.getParameter("accountHolder");
		String accountNumber = request.getParameter("accountNumber");
		apDao.updateAccountToDelete(bankName, accountHolder, accountNumber, NICKNAME_PK);
		//alert("등록된 계좌정보가 삭제되었습니다");
		request.getRequestDispatcher("Controller?command=GoAccountManagement&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
