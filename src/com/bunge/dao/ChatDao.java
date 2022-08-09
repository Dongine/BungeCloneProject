package com.bunge.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bunge.dto.ChatRoomDto;
import com.bunge.dto.RealTimeChatDto;

public class ChatDao {
	// 채팅목록 정보 가져오기
	public ArrayList<ChatRoomDto> getChatRoomSelect(String nicknamePK) {
		ArrayList<ChatRoomDto> listChatRoom = new ArrayList<ChatRoomDto>();
		Connection conn = DBConnection.getConnection();
//		String sql = "select *\r\n" + 
//				"from (\r\n" + 
//				"select c.*, (SELECT max(say_time) FROM real_time_chat WHERE rno=c.rno) time\r\n" + 
//				"from chat_room c\r\n" + 
//				"where ((purchase_fk=?) OR (seller_fk=?)) AND close_yn='n' \r\n" + 
//				"ORDER BY time DESC\r\n" + 
//				") c2\r\n" + 
//				"where c2.time IS NOT NULL\r\n";
		
		String sql = "SELECT *FROM (SELECT c.*, (SELECT max(say_time) FROM real_time_chat WHERE rno=c.rno) time" + 
				" FROM chat_room c" + 
				" WHERE ((purchase_fk=?) OR (seller_fk=?)) AND close_yn='n' ORDER BY time DESC) c2" + 
				" WHERE c2.time IS NOT NULL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePK);
			pstmt.setString(2, nicknamePK);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String purchaseFk = rs.getString("purchase_fk");
				String sellerFk = rs.getString("seller_fk");
				String closeYn = rs.getString("close_yn");
				int dno = rs.getInt("dno");
				ChatRoomDto dto = new ChatRoomDto(rno, purchaseFk, sellerFk, closeYn , dno);
				listChatRoom.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		sql = "select *\r\n" + 
//				"from (\r\n" + 
//				"select c.*, (SELECT max(say_time) FROM real_time_chat WHERE rno=c.rno) time\r\n" + 
//				"from chat_room c\r\n" + 
//				"where (purchase_fk=?) OR (seller_fk=?) \r\n" + 
//				") c2\r\n" + 
//				"where c2.time IS NULL";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, sellerFK);
//			pstmt.setString(2, sellerFK);
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int rno = rs.getInt("rno");
//				String purchaseFk = rs.getString("purchase_fk");
//				String sellerFk = rs.getString("seller_fk");
//				String closeYn = rs.getString("close_yn");
//				int dno = rs.getInt("dno");
//				ChatRoomDto dto = new ChatRoomDto(rno, purchaseFk, sellerFk, closeYn , dno);
//				listChatRoom.add(dto);
//			}
//			rs.close();
//			pstmt.close();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		return listChatRoom;
	}
	
	// 채팅방 정보 리턴
	public ArrayList<RealTimeChatDto> getRealTimeChatSelect(int rnO) {
		ArrayList<RealTimeChatDto> listRealTimeChat = new ArrayList<RealTimeChatDto>();
		Connection conn = DBConnection.getConnection();
		String sql="SELECT cno, rno, say_nickname_fk, say, say_time, read_check, image_url FROM real_time_chat WHERE rno = ? ORDER BY say_time ASC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rnO);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt("cno");
				int rno = rs.getInt("rno");
				String sayNicknameFk = rs.getString("say_nickname_fk");
				String say = rs.getString("say");
				String sayTime = rs.getString("say_time");
				int readCheck = rs.getInt("read_check");
				String imageUrl = rs.getString("image_url");
				RealTimeChatDto dto = new RealTimeChatDto(cno, rno, sayNicknameFk, say, sayTime, readCheck, imageUrl); 
				listRealTimeChat.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return listRealTimeChat;
	}

	// 마지막 대화문장을 리턴
	public String getLastChat(int rno) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT say FROM real_time_chat WHERE rno=? ORDER BY say_time DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rno);
		ResultSet rs = pstmt.executeQuery();
		String retChat = "";
		if(rs.next()) {
			retChat = rs.getString("say");
		}
		rs.close();
		pstmt.close();
		return retChat;
	}
	
	// 마지막 대화의 시간 리턴
	public String getLastChatTime(int rno) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT say_time FROM real_time_chat WHERE rno=? ORDER BY say_time DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rno);
		ResultSet rs = pstmt.executeQuery();
		String retTime = "";
		if(rs.next()) {
			retTime = rs.getString("say_time");
		}
		rs.close();
		pstmt.close();
		return retTime;
	}
	
	// rno를 파라미터로 받아서, 채팅방의 상품이름, 상품이미지, 가격을 리턴
	public String getRealChatProductInfo(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT c.rno, c.dno, d.seller_fk, d.consumer_fk, d.dno, d.product_name, d.price, d.imagename, d.productnumber FROM chat_room c, dealing d WHERE c.dno = d.dno AND c.rno = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  rno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				//int rno = rs.getInt("rno");
				int cDno = rs.getInt("dno");
				String sellerFk = rs.getString("seller_fk");
				String consumerFk = rs.getString("consumer_fk");
				int dDno = rs.getInt("dno");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String imagename = rs.getString("imagename");
				int productnumber = rs.getInt("productnumber");
				strRet = cDno + "/" + sellerFk + "/" + consumerFk + "/" + dDno + "/" + productName + "/" + price + "/" + imagename + "/" + productnumber; 
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// rno(방번호)값을 받아 dno값 리턴
	public int getDnoFromRno(int rno) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT dno FROM chat_room WHERE rno = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rno);
		ResultSet rs = pstmt.executeQuery();
		int dnoRet = 0;
		if(rs.next()) {
			dnoRet = rs.getInt("dno");
		}
		rs.close();
		pstmt.close();
		return dnoRet;
	}
	
	// dno값을 받아 productnumber값 리턴
	public int getProductnumberFromDno(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT productnumber FROM dealing WHERE dno=?";
		int productnumberRet = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				productnumberRet = rs.getInt("productnumber");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return productnumberRet;
	}
	
	// 채팅방 상단 상대방 닉네임 가져오기
	public String getChatOtherNickname(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT rno, purchase_fk, seller_fk FROM chat_room WHERE rno = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String purchaseFk = rs.getString("purchase_fk");
				String sellerFk = rs.getString("seller_fk");
				strRet = purchaseFk + "/" + sellerFk;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	// 구매자에게 거래를 요청했습니다
	public String getDealToSeller(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT d.dno, d.seller_fk, d.product_name, d.price, d.address, d.detailed_address, d.address_name, d.imagename, d.delivery_charge,"
				+ " p.nickname_pk, p.phone_number"
				+ " FROM dealing d, profile p"
				+ " WHERE d.consumer_fk = p.nickname_pk AND d.dno = ? ORDER BY d.dno DESC";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sellerFk = rs.getString("seller_fk");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String address = rs.getString("address");
				String detailedAddress = rs.getString("detailed_address");
				String addressName = rs.getString("address_name");
				String imagename = rs.getString("imagename");
				String deliveryCharge = rs.getString("delivery_charge");
				//String nicknamePk = rs.getString("nickname_pk");
				String phoneNumber = rs.getString("phone_number");
				
				strRet = sellerFk + "/" + productName + "/" + price + "/" + address + "/" + detailedAddress + "/" + addressName + "/" + imagename + "/" + deliveryCharge + "/" + phoneNumber; 
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 구매자에게 거래를 요청받았습니다
	public String getDealFromConsumer(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT d.dno, d.seller_fk, d.consumer_fk, d.product_name, d.price, d.address, d.detailed_address, d.address_name, d.imagename, d.delivery_charge,"
				+ " p.nickname_pk, p.phone_number"
				+ " FROM dealing d, profile p"
				+ " WHERE d.consumer_fk = p.nickname_pk AND d.dno = ? ORDER BY d.dno DESC";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sellerFk = rs.getString("seller_fk");
				String consumerFk = rs.getString("consumer_fk");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String address = rs.getString("address");
				String detailedAddress = rs.getString("detailed_address");
				String addressName = rs.getString("address_name");
				String imagename = rs.getString("imagename");
				String deliveryCharge = rs.getString("delivery_charge");
				//String nicknamePk = rs.getString("nickname_pk");
				String phoneNumber = rs.getString("phone_number");
				
				strRet = sellerFk + "/" + consumerFk + "/" + productName + "/" + price + "/" + address + "/" + detailedAddress + "/" + addressName + "/" + imagename + "/" + deliveryCharge + "/" + phoneNumber; 
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 실시간 채팅
	public void insertChat(int rno, String sayNicknameFk, String say) {
		Connection conn = DBConnection.getConnection();
		String sql="INSERT INTO real_time_chat(cno, rno, say_nickname_fk, say, say_time) VALUES(real_time_chat_seq.nextval, ?, ?, ?, sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			System.out.println("rno값임 : " + rno);
			pstmt.setString(2, sayNicknameFk);
			System.out.println("sayNickname : " + sayNicknameFk);
			pstmt.setString(3, say);
			System.out.println("say : " + say);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 실시간 채팅에서 업로드
	public void insertChatUpload(int rno, String sayNicknameFk, String imageUrl) {
		Connection conn = DBConnection.getConnection();
		String sql="INSERT INTO real_time_chat(cno, rno, say_nickname_fk, say, say_time, image_url) VALUES(real_time_chat_seq.nextval, ?, ?, '/;/사진업로드/;/', sysdate, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.setString(2, sayNicknameFk);
			pstmt.setString(3, imageUrl);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 채팅방 나가기 (목록 나가기)
	public void updateChatGetOut(String closeYn, int rno, int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE chat_room SET close_yn = ? WHERE rno = ? AND dno = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, closeYn);
			pstmt.setInt(2, rno);
			pstmt.setInt(3, dno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 차단기능
	public void insertBlock() {
		Connection conn = DBConnection.getConnection();
		String sql="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 나랑 productnumber_pk를 주고 rno를 리턴(단, 해당 챗룸이 없으면 만들어서 rno리턴)
//	public int getRnoOrCreateRnoFromProductNumber(int productNumber, String nicknamePk) throws Exception {
		Connection conn = DBConnection.getConnection();
//		-- rno가 있는지(=1) 없는지(=0) 판별. 파라미터#1 = 나 닉네임, 파라미터#2 = productnumber_pk값.
//		SELECT count(rno) FROM chat_room
//		WHERE purchase_fk='HSK137'
//		AND seller_fk=(SELECT nickname_fk FROM product WHERE productnumber_pk='2');
		
//		String sql = "SELECT count(rno) FROM chat_room " + 
//				"WHERE purchase_fk=? " + 
//				"AND seller_fk=(SELECT nickname_fk FROM product WHERE productnumber_pk=?)";
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, nicknamePk);
//		pstmt.setInt(2, productNumber);
//		ResultSet rs = pstmt.executeQuery();
//		rs.next();
//		int cnt = rs.getInt(1);    // count(rno)가 대입.  // cnt는 0 또는 1.
//		rs.close();
//		pstmt.close();
//		
//		String sellerNickname = "";
//		sql = "SELECT nickname_fk FROM product WHERE productnumber_pk=?";
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, productNumber);
//		rs = pstmt.executeQuery();
//		if(rs.next()) {
//			sellerNickname = rs.getString(1);
//		}
//		rs.close();
//		pstmt.close();
//		
//		if(cnt==0) {
			
		
//		-- rno가 없을 때(=내가 쟤랑 대화한 적이 없음) 챗룸을 만들어.
//		--디애노 는 insert into dealing values (...) 한 후에 select dno from dealing where ...; 해서 얻음.
//		--(1)
//		INSERT INTO dealing(dno, seller_fk, consumer_fk, product_name, price, 
//		address, detailed_address, address_name, 
//		imagename, delivery_charge, productnumber)
//		VALUES (dealing_seq.nextval, 'HSK137', '나', (SELECT productname FROM product WHERE productnumber_pk='2'), (SELECT price FROM product WHERE productnumber_pk='2'),
//		(SELECT address FROM profile WHERE nickname_pk='나'), (SELECT detailed_address FROM profile WHERE nickname_pk='나'), (SELECT address_name FROM profile WHERE nickname_pk='나'),
//		(SELECT imagename FROM product WHERE productnumber_pk='2'), (SELECT delivery_charge FROM product WHERE productnumber_pk='2'), '2');
			
//			sql = "INSERT INTO dealing(dno, seller_fk, consumer_fk, product_name, price,"
//					 + " address, detailed_address, address_name," 
//					 + " imagename, delivery_charge, productnumber)"
//					 + " VALUES (dealing_seq.nextval, ?, ?, (SELECT productname FROM product WHERE productnumber_pk=?), (SELECT price FROM product WHERE productnumber_pk=?),"
//					 + " (SELECT address FROM profile WHERE nickname_pk=?), (SELECT detailed_address FROM profile WHERE nickname_pk=?), (SELECT address_name FROM profile WHERE nickname_pk=?)," 
//					 + " (SELECT imagename FROM product WHERE productnumber_pk=?), (SELECT delivery_charge FROM product WHERE productnumber_pk=?), ?)";
//			// 파#1 : 쟤   / 파#2 : 나 / 파#3,#4 : productnumber / 파#5,6,7 : '나' / 파#8,9,10 : productnumber
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, sellerNickname);
//			pstmt.setString(2, nicknamePk);
//			pstmt.setInt(3, productNumber);
//			pstmt.setInt(4, productNumber);
//			pstmt.setString(5, nicknamePk);
//			pstmt.setString(6, nicknamePk);
//			pstmt.setString(7, nicknamePk);
//			pstmt.setInt(8, productNumber);
//			pstmt.setInt(9, productNumber);
//			pstmt.setInt(10, productNumber);
//			pstmt.executeUpdate();				// 사실은 이 리턴 값이 1인지를 체크해야 함.
//			pstmt.close();
			
//		--(2)
//		SELECT dno FROM dealing WHERE consumer_fk='나' AND productnumber='2';     -- 이것이 '디애노'
			
//			sql = "SELECT dno FROM dealing WHERE consumer_fk=? AND productnumber=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, nicknamePk);
//			pstmt.setInt(2, productNumber);
//			
//			int dno = -1;	// -1은 그냥 초기값.
//			rs = pstmt.executeQuery();
//			if(rs.next()) {	// CHECK: 여기에 반드시 진입해야 함.
//				dno = rs.getInt(1);
//			}
//			rs.close();
//			pstmt.close();
					
//		--(3)
//		INSERT INTO chat_room(rno, purchase_fk, seller_fk, dno) VALUES(CHAT_ROOM_SEQ.nextval, '나', (SELECT nickname_fk FROM product WHERE productnumber_pk='2'), 디애노);
			
//			sql = "INSERT INTO chat_room(rno, purchase_fk, seller_fk, dno) VALUES(CHAT_ROOM_SEQ.nextval, ?, (SELECT nickname_fk FROM product WHERE productnumber_pk=?), ?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, nicknamePk);
//			pstmt.setInt(2, productNumber);
//			pstmt.setInt(3, dno);
//			pstmt.executeUpdate();				// 원래는 이 리턴값이 1인지 체크해야 함. 
//			pstmt.close(); 
//		} 

//		int resultRno = -1;   // - 1 : 그냥 초기값.
			
//		-- rno가 있을 때(=내가 쟤랑 대화한 적이 있었음) rno를 조회.
//		SELECT rno FROM chat_room
//		WHERE purchase_fk='HSK137'
//		AND seller_fk=(SELECT nickname_fk FROM product WHERE productnumber_pk='2');
			
//		sql = "SELECT rno FROM chat_room" 
//			 + " WHERE purchase_fk=?" 
//			 + " AND seller_fk=(SELECT nickname_fk FROM product WHERE productnumber_pk=?)"; 
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, nicknamePk);
//		pstmt.setInt(2, productNumber);
//		rs = pstmt.executeQuery();
//		if(rs.next()) {   // 체크 : 여기에 반드시 진입해야 함.
//			resultRno = rs.getInt(1);
//		}
//		return resultRno;
//	}
	
	// 마지막 채팅내용 리턴
	public int getRnoLast(String nicknamePK) throws Exception {
		Connection conn = DBConnection.getConnection();
		
		String sql = "select * from real_time_chat"
				+ " where rno in (SELECT rno FROM chat_room WHERE (purchase_fk=?) OR (seller_fk=?))"
				+ " order by cno desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, nicknamePK);
		pstmt.setString(2, nicknamePK);
		ResultSet rs = pstmt.executeQuery();
		int rnoRet = 0;   // 0은 초기값을 뿐.
		if(rs.next()) {   // 체크 : 반드시 여기에 진입해야 함.
			rnoRet = rs.getInt("rno");
		}
		System.out.println("이건 rnoRet이에요 : " + rnoRet);
		return rnoRet;
	}
	
	// 거래내역의 구매자닉네임, 상품번호를 이용하여 dno리턴
	public int getDnoFromConsumerFkProductNumber(String consumerFk, int productnumber) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT dno FROM dealing WHERE consumer_fk=? AND productnumber=?";
		int dnoRet = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consumerFk);
			pstmt.setInt(2, productnumber);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				
			dnoRet = rs.getInt("dno");
			rs.close();
			pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dnoRet;
	}
	
	// 채팅방열기
	public void insertRnoPurchaseFkSellerFkDno(String purchaseFk, String sellerFk, int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO chat_room(rno, purchase_fk, seller_fk, dno) VALUES(CHAT_ROOM_SEQ.nextval, ?, ?, ?)";
		int dnoRet = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, purchaseFk);
			pstmt.setString(2, sellerFk);
			pstmt.setInt(3, dno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// dno를 이용해 rno값 리턴
	public int getDnoFromConsumerFkProductNumber(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT rno FROM chat_room WHERE dno=?";
		int rnoRet = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			rnoRet = rs.getInt("rno");
			rs.close();
			pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return rnoRet;
	}
	
	// 채팅방있는지 확인하기
	public int countRno(String nicknamePk) {
		Connection conn =DBConnection.getConnection();
		String sql = "SELECT count(rno) FROM chat_room WHERE purchase_fk = ? OR seller_fk = ?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			pstmt.setString(2, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(rno)");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 채팅내역 거래취소로 업데이트
	public void updateChatDealCancel(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE real_time_chat SET say=/;/거래취소/;/ WHERE rno = '57' AND (say=/;/구매자의_거래요청/;/ OR say=/;/판매자의_거래요청/;/ OR say=/;/직거래요청/;/)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	// 채팅내역 택배거래완료로 업데이트
	public void updateChatDeliveryDone(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE real_time_chat SET say='/;/택배거래완료/;/' WHERE rno = ? AND (say='/;/구매자의_거래요청/;/' OR say='/;/판매자의_거래요청/;/' OR say='/;/직거래요청/;/')";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 채팅내역 직거래완료로 업데이트
	public void updateChatDirectDone(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE real_time_chat SET say='/;/직거래완료/;/' WHERE rno = ? AND (say='/;/구매자의_거래요청/;/' OR say='/;/판매자의_거래요청/;/' OR say='/;/직거래요청/;/')";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 채팅내역 거래취소로 업데이트
	public void updateChatCancel(int rno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE real_time_chat SET say='/;/거래취소/;/' WHERE rno = ? AND (say='/;/구매자의_거래요청/;/' OR say='/;/판매자의_거래요청/;/' OR say='/;/직거래요청/;/')";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

