package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.AccountPlaceDao;

public class GoAccountManagement implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
	
		AccountPlaceDao apDao = new AccountPlaceDao();
		request.setCharacterEncoding("utf-8");
		String strAccountSelect = apDao.getAccountSelect(NICKNAME_PK);
		String[] arrStrAccountSelect = strAccountSelect.split("/");
		String bankName = arrStrAccountSelect[0];
		String accountHolder = arrStrAccountSelect[1];  // 예금주
		String accountNumber = arrStrAccountSelect[2];  // 계좌번호
		
		if(strAccountSelect.contains("null")) {
			bankName = null;
			accountHolder = null;
			accountNumber = null;
		}
	
	// 은행 이미지 불러오기
 	String bankImgName = "";
	if(bankName!=null) {
		switch(bankName) {
		case "국민은행": bankImgName="BankImages/img_account_KB.png"; break;
		case "우리은행": bankImgName="BankImages/img_account_woori.png"; break;
		case "신한은행": bankImgName="BankImages/img_account_shinhan.png"; break;
		case "KEB하나은행": bankImgName="BankImages/img_account_hana.png"; break;
		case "카카오뱅크": bankImgName="BankImages/img_account_kakao.png"; break;
		case "농협은행": bankImgName="BankImages/img_account_nh.png"; break;
		case "기업은행": bankImgName="BankImages/img_account_ibk.png"; break;
		case "토스뱅크": bankImgName="BankImages/img_account_toss.png"; break;
		case "우체국": bankImgName="BankImages/img_account_post.png"; break;
		case "SC제일은행": bankImgName="BankImages/img_account_sc.png"; break;
		case "수협중앙회": bankImgName="BankImages/img_account_suhyup.png"; break;
		case "케이뱅크": bankImgName="BankImages/img_account_K.png"; break;
		case "지역농축협": bankImgName="BankImages/img_account_nh (1).png"; break;
		case "한국씨티은행": bankImgName="BankImages/img_account_city.png"; break;
		case "신협중앙회": bankImgName="BankImages/img_account_shinhan.png"; break;
		case "산업은행": bankImgName="BankImages/img_account_sanUp.png"; break;
		case "산림조합중앙회": bankImgName="BankImages/img_account_sanlimjohap.pngs"; break;
		case "상호저축은행": bankImgName="BankImages/img_account_sangho.png"; break;
		case "새마을금고중앙회": bankImgName="BankImages/img_account_semaul.png"; break;
		case "대구은행": bankImgName="BankImages/img_account_degu.png"; break;
		case "부산은행": bankImgName="BankImages/img_account_busan.png"; break;
		case "광주은행": bankImgName="BankImages/img_account_kwangju.png"; break;
		case "전북은행": bankImgName="BankImages/img_account_jounbukpng.png"; break;
		case "경남은행": bankImgName="BankImages/img_account_gyungnam.png"; break;
		case "제주은행": bankImgName="BankImages/img_account_jeju.png"; break;
		case "HSBC은행": bankImgName="BankImages/img_account_hsbc.png"; break;
		case "제이피모간체이스은행": bankImgName="BankImages/img_account_jpmogan.png"; break; 
		case "도이치은행": bankImgName="BankImages/img_account_doichi.png"; break;
		case "비엔피파리바은행": bankImgName="BankImages/img_account_bnpipa.png"; break;
		case "BOA은행": bankImgName="BankImages/img_account_boa.png"; break;
		}
	}
		request.setAttribute("bankName", bankName);
		request.setAttribute("accountHolder", accountHolder);
		request.setAttribute("accountNumber", accountNumber);
		request.setAttribute("bankImgName", bankImgName);
		request.getRequestDispatcher("AccountManagement.jsp?rno="+rno+"&dno="+dno).forward(request, response);
	}

}
