package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.AccountAddAction;
import action.AccountDeleteAction;
import action.Action;
import action.AddressAddFormAction;
import action.AddressDeleteAction;
import action.AddressSendAction;
import action.CancelAction;
import action.ConsumerGetDealRequest2Action;
import action.DealDoneAction;
import action.DeleteAction;
import action.DirectDealCheckFormAction;
import action.DirectDealSendFormAction;
import action.GoAccountAdd;
import action.GoAccountManagement;
import action.GoAddressAdd;
import action.GoAddressManagement;
import action.GoAddressSend;
import action.GoCancel;
import action.GoCenter;
import action.GoConsumerGetDealRequest;
import action.GoConsumerGetDealRequest2;
import action.GoConsumerToDealRequest;
import action.GoDealCancel;
import action.GoDealDone;
import action.GoDirectDealCheck;
import action.GoDirectDealDone;
import action.GoDirectDealSend;
import action.GoFaq;
import action.GoFaq_1;
import action.GoFaq_1_2;
import action.GoFaq_1_3;
import action.GoFaq_2;
import action.GoFaq_3;
import action.GoFaq_3_1;
import action.GoFaq_3_2;
import action.GoLoginAction;
import action.GoMain;
import action.GoMainTalk;
import action.GoMainTalkFromProduct;
import action.GoManagement;
import action.GoModificationAction;
import action.GoNewFormAction;
import action.GoNotice;
import action.GoNotice_1;
import action.GoOperate;
import action.GoProductAction;
import action.GoProductListAction;
import action.GoQna;
import action.GoQna_New;
import action.GoRegister;
import action.GoReportHistoryInquiry;
import action.GoReviewWrite;
import action.GoSale;
import action.GoSearchbar;
import action.GoSellerGetDealRequest;
import action.GoSellerToDealRequest;
import action.GoSetting;
import action.GoTM4;
import action.GoTM_QNA;
import action.GoViolation;
import action.LoginAction;
import action.LoginFormAction;
import action.LogoutAction;
import action.MainAction;
import action.ProductJjimDeleteAction;
import action.ProductJjimInsertAction;
import action.ProductModificationAction;
import action.ProductRegistAction;
import action.RealTimeChatUploadFormAction;
import action.RegisterAction;
import action.RegisterFormAction;
import action.ReviewWriteAction;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		System.out.println("[컨트롤러에서의 로그] command " + command);
		if(command==null)
				response.sendRedirect("Controller?command=board_list");
		
		Action action = null;
		switch(command) {
		case "GoLogin" : action = new GoLoginAction(); break;
		case "LoginAction" : action = new LoginAction(); break;
		case "Login" : action = new LoginFormAction(); break;
		case "Main" : action = new MainAction(); break;
		case "GoLogout" : action = new LogoutAction(); break;
		case "GoRegister" : action = new GoRegister(); break;
		case "Register" : action = new RegisterFormAction(); break;
		case "RegisterAction" : action = new RegisterAction(); break;
		case "GoTM_QNA" : action = new GoTM_QNA(); break;
		case "GoTM4" : action = new GoTM4(); break;
		case "GoCenter" : action = new GoCenter(); break;
		case "GoOperate" : action = new GoOperate(); break;
		case "GoNotice" : action = new GoNotice(); break;
		case "GoFaq" : action = new GoFaq(); break;
		case "GoQna" : action = new GoQna(); break;
		case "GoViolation" : action = new GoViolation(); break;
		case "GoNotice_1" : action = new GoNotice_1(); break;
		case "GoFaq_1" : action = new GoFaq_1(); break;
		case "GoFaq_1_2" : action = new GoFaq_1_2(); break;
		case "GoFaq_1_3" : action = new GoFaq_1_3(); break;
		case "GoFaq_3" : action = new GoFaq_3(); break;
		case "GoFaq_3_1" : action = new GoFaq_3_1(); break;
		case "GoFaq_3_2" : action = new GoFaq_3_2(); break;
		case "GoFaq_2" : action = new GoFaq_2(); break;
		case "GoQna_New" : action = new GoQna_New(); break;	// css 오류
		case "GoNewFormAction" : action = new GoNewFormAction(); break;
		case "GoSetting" : action = new GoSetting(); break;
		case "DeleteAction" : action = new DeleteAction(); break;
		
		case "GoMainTalk" : action = new GoMainTalk(); break; // 번개톡 메인화면으로 이동
		case "GoMainTalkFromProduct" : action = new GoMainTalkFromProduct(); break; // 상품페이지에서 번개톡으로 이동
		case "GoAddressSend" : action = new GoAddressSend(); break; // 주소보내기로 이동
		case "AddressSendAction" : action = new AddressSendAction(); break; // 주소보내기액션
		case "GoAddressManagement" : action = new GoAddressManagement(); break; // 주소관리로 이동
		case "GoAddressAdd" : action = new GoAddressAdd(); break; // 주소추가로 이동
		case "AddressAddAction" : action = new AddressAddFormAction(); break; // 주소추가액션
		case "AddressDeleteAction" : action = new AddressDeleteAction(); break; // 주소삭제액션
		case "GoAccountManagement" : action = new GoAccountManagement(); break; // 주소관리로 이동
		case "GoAccountAdd" : action = new GoAccountAdd(); break; // 계좌추가로 이동
		case "AccountAddAction" : action = new AccountAddAction(); break; // 계좌추가액션
		case "AccountDeleteAction" : action = new AccountDeleteAction(); break; // 계좌삭제액션
		case "GoConsumerToDealRequest" : action = new GoConsumerToDealRequest(); break; // 구매자에게 거래요청
		case "GoConsumerGetDealRequest" : action = new GoConsumerGetDealRequest(); break; // 구매자에게 거래를 요청받음
		case "GoConsumerGetDealRequest2" : action = new GoConsumerGetDealRequest2(); break;
		case "ConsumerGetDealRequest2Action" : action = new ConsumerGetDealRequest2Action(); break;
		case "GoSellerToDealRequest" : action = new GoSellerToDealRequest(); break;  // 판매자에게 거래요청으로 이동
		case "GoSellerGetDealRequest" : action = new GoSellerGetDealRequest(); break; // 판매자에게 거래를 요청받음으로 이동
		case "GoDirectDealSend" : action = new GoDirectDealSend(); break; // 직거래요청
		case "DirectDealSendAction" : action = new DirectDealSendFormAction(); break; // 직거래요청액션
		case "GoDirectDealCheck" : action = new GoDirectDealCheck(); break; // 직거래체크로 이동
		case "DirectDealCheckAction" : action = new DirectDealCheckFormAction(); break; // 직거래체크액션
		case "GoDirectDealDone" : action = new GoDirectDealDone(); break; // 직거래완료로 이동
		case "GoDealDone" : action = new GoDealDone(); break; // 거래완료로 이동
		case "DealDoneAction" : action = new DealDoneAction(); break; // 거래
		case "GoCancel" : action = new GoCancel(); break; // 거래취소로 이동
		case "CancelAction" : action = new CancelAction(); break; // 거래취소액션
		case "GoDealCancel" : action = new GoDealCancel(); break; // 거래취소로 이동
		case "GoReviewWrite" : action = new GoReviewWrite(); break; // 후기작성으로 이동
		case "ReviewWriteAction" : action = new ReviewWriteAction(); break; // 후기작성액션
		case "GoReportHistoryInquiry" : action = new GoReportHistoryInquiry(); break; // 신고내역조회로 이동
		case "RealTimeChatUploadAction" : action = new RealTimeChatUploadFormAction(); break; // 사진업로드액션
		
		
		case "GoProductList" : action = new GoProductListAction(); break;				// 상품리스트로 이동
		case "GoProduct" : action = new GoProductAction(); break;						// 상품으로 이동
		case "GoSearchbar" : action = new GoSearchbar(); break;							// 검색한 값으로 상품리스트 이동
		case "GoSale" : action = new GoSale(); break;									// 판매하기로 이동
		case "GoManagement" : action = new GoManagement(); break;						// 상품관리로 이동
		case "ProductRegist" : action = new ProductRegistAction(); break;				// 상품등록
		case "GoModification" : action = new GoModificationAction(); break;				// 상품수정로 이동
		case "ProductModification" : action = new ProductModificationAction(); break; 	// 상품수정
		case "GoMain" : action = new GoMain(); break;									// 메인으로 이동
		case "ProductJjimInsertAction" : action = new ProductJjimInsertAction(); break;	// 찜추가
		case "ProductJjimDeleteAction" : action = new ProductJjimDeleteAction(); break; // 찜삭제
		
		// 찜 추가 예정
		
		}
		if(action != null)
			action.execute(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
