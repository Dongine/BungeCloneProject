package action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class GoNewFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String NICKNAME_PK = (String)(session.getAttribute("NICKNAME_PK"));

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "bg";
		String dbPW = "1234";
		
		Connection conn = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbID, dbPW);
		} catch(Exception e){
			e.printStackTrace();
		}

			String typeSelect = request.getParameter("typeSelect");
			String detailsTypeSelect = request.getParameter("detailsTypeSelect");
			String reportedNicknameFk = request.getParameter("reportedNicknameFk");
			String inquiryContent = request.getParameter("inquiryContent");
			String photoAttachment1 = request.getParameter("photoAttachment1");
			String photoAttachment2 = request.getParameter("photoAttachment2");
			String photoAttachment3 = request.getParameter("photoAttachment3");
			String photoAttachment4 = request.getParameter("photoAttachment4");
			String photoAttachment5 = request.getParameter("photoAttachment5");
			String photoAttachment6 = request.getParameter("photoAttachment6");
			
			if(typeSelect.equals("거래신고")){
				String sql ="insert into ONE_TO_ONE_INQUIRY(TYPE_SELECT, DETAILS_TYPE_SELECT, REPORTED_NICKNAME_FK, INQUIRY_CONTENT, PHOTO_ATTACHMENT1, PHOTO_ATTACHMENT2, PHOTO_ATTACHMENT3, PHOTO_ATTACHMENT4, PHOTO_ATTACHMENT5, PHOTO_ATTACHMENT6,report_nickname_fk, REGISTRATION_TIME)" 
				+"VALUES(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
				try {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, typeSelect);
					pstmt.setString(2, detailsTypeSelect);
					pstmt.setString(3, reportedNicknameFk);
					pstmt.setString(4, inquiryContent);
					pstmt.setString(5, photoAttachment1);
					pstmt.setString(6, photoAttachment2);
					pstmt.setString(7, photoAttachment3);
					pstmt.setString(8, photoAttachment4);
					pstmt.setString(9, photoAttachment5);
					pstmt.setString(10, photoAttachment6);
					pstmt.setString(11, NICKNAME_PK);
					
					pstmt.executeUpdate();
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			} else {
				String sql ="insert into ONE_TO_ONE_INQUIRY(TYPE_SELECT, DETAILS_TYPE_SELECT, INQUIRY_CONTENT, PHOTO_ATTACHMENT1, PHOTO_ATTACHMENT2, PHOTO_ATTACHMENT3, PHOTO_ATTACHMENT4, PHOTO_ATTACHMENT5, PHOTO_ATTACHMENT6,report_nickname_fk, REGISTRATION_TIME)" 
				+"VALUES(?,?,?,?,?,?,?,?,?,?,sysdate)";
				try {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, typeSelect);
					pstmt.setString(2, detailsTypeSelect);
					pstmt.setString(3, inquiryContent);
					pstmt.setString(4, photoAttachment1);
					pstmt.setString(5, photoAttachment2);
					pstmt.setString(6, photoAttachment3);
					pstmt.setString(7, photoAttachment4);
					pstmt.setString(8, photoAttachment5);
					pstmt.setString(9, photoAttachment6);
					pstmt.setString(10, NICKNAME_PK);
					pstmt.executeUpdate();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			try {
				request.getRequestDispatcher("Controller?command=GoQna").forward(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
	}
}
