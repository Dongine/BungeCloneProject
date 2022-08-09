package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bunge.dao.ChatDao;

public class GoConsumerGetDealRequest2 implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));
		int rno = Integer.parseInt(request.getParameter("rno"));
		int dno = Integer.parseInt(request.getParameter("dno"));
		String bankName = request.getParameter("bankName");
		String accountNumber = request.getParameter("accountNumber");
		String accountHolder = request.getParameter("accountHolder");
		
		// 거래내역DB에서 상품정보, 구매자의 정보 가져오기
		ChatDao cDao = new ChatDao();
		String strDealFromConsumer = cDao.getDealFromConsumer(dno);
		String[] arrStrDealFromConsumer = strDealFromConsumer.split("/");
		String sellerFk = arrStrDealFromConsumer[0];
		String consumerFk = arrStrDealFromConsumer[1]; // 구매자닉네임
		String productName = arrStrDealFromConsumer[2];
		int price = Integer.parseInt(arrStrDealFromConsumer[3]); // 상품가격
		String address = arrStrDealFromConsumer[4]; // 주소
		String detailedAddress = arrStrDealFromConsumer[5]; // 상세주소
		String addressName = arrStrDealFromConsumer[6]; // 집주인명
		String imagename = arrStrDealFromConsumer[7]; // 상품사진
		String deliveryCharge = arrStrDealFromConsumer[8]; // 배송비여부
		String phoneNumber = arrStrDealFromConsumer[9]; // 핸드폰번호  
		
		// 은행 이미지 불러오기
		String bankImgName = "";
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
		
		request.setAttribute("sellerFk", sellerFk);
		request.setAttribute("consumerFk", consumerFk);
		request.setAttribute("productName", productName);
		request.setAttribute("price", price);
		request.setAttribute("address", address);
		request.setAttribute("detailedAddress", detailedAddress);
		request.setAttribute("addressName", addressName);
		request.setAttribute("imagename", imagename);
		request.setAttribute("deliveryCharge", deliveryCharge);
		request.setAttribute("phoneNumber", phoneNumber);
		request.setAttribute("bankImgName", bankImgName);
		request.getRequestDispatcher("ConsumerGetDealRequest2.jsp?rno="+rno+"&dno="+dno+"&bankName="+bankName+"&accountNumber="+accountNumber+"&accountHolder="+accountHolder).forward(request, response);
	}
}
