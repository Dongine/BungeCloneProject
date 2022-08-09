package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.AccountPlaceDao;

public class AccountAddAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		request.setCharacterEncoding("utf-8");
		AccountPlaceDao apDao = new AccountPlaceDao();
	
		int rno = Integer.parseInt(request.getParameter("rno"));
		//System.out.println("rno 들어옴 : " + rno);
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		// AccountAdd에서 예금주, 계좌번호, 은행명 받아오기
		String bankName = request.getParameter("bankName");
		String accountHolder = request.getParameter("accountHolder");
		String accountNumber = request.getParameter("accountNumber");
		
 		if(bankName!=null && accountHolder!=null && accountNumber!=null) {
			apDao.updateAccountSend(bankName, accountHolder, accountNumber, NICKNAME_PK); 
		} else {
			String strAccountSelect = apDao.getAccountSelect(NICKNAME_PK);
			String[] arrStrAccountSelect = strAccountSelect.split("/");
			bankName = arrStrAccountSelect[0]; // 은행이름
			accountHolder = arrStrAccountSelect[1];  // 예금주
			accountNumber = arrStrAccountSelect[2];  // 계좌번호
		} 
 		request.getRequestDispatcher("Controller?command=GoAccountManagement&rno="+rno+"&dno="+dno).forward(request, response);
	}
}
