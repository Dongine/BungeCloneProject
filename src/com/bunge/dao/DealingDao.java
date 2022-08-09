package com.bunge.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DealingDao {
		
	// 판매자가 구매자에게 계좌번호 보내기
//	public void insertSellerToConsumerDeal(String sellerFk, String consumerFk, String productName, String price, String accountNumber) {
//		Connection conn = DBConnection.getConnection();
//		String sql = "INSERT INTO dealing(bno, seller_fk, consumer_fk, product_name, price, account_number) values(DEALING_SEQ.nextval, ?, ?, ?, ?, ?);";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, sellerFk);
//			pstmt.setString(2, consumerFk);
//			pstmt.setString(3, productName);
//			pstmt.setString(4, price);
//			pstmt.setString(5, accountNumber);
//			pstmt.executeUpdate();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}

	// 판매자에게 거래요청받기
	public String getDealFromSeller(String nicknamePK) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT d.seller_fk, d.product_name , d.price, d.account_number, p.nickname_pk, p.account_number, p.account_holder, p.bank_name from dealing d, profile p where d.account_number = p.account_number AND p.nickname_pk = d.seller_fk and p.nickname_pk = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePK);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String sellerFk = rs.getString("seller_fk");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String accountNumber = rs.getString("account_number");
				String nicknamePk = rs.getString("nickname_pk");
				String accountHolder = rs.getString("account_holder");
				String bankName = rs.getString("bankName");
				strRet = sellerFk + "/" + productName + "/" + price + "/" + accountNumber + "/" + nicknamePk + "/" + accountHolder + "/" + bankName;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 거래를 수락하고 판매자에게 주소보내기
//	public void updateConsumerToSellerDealDone(String address, String detailedAddress, String dealDate, String sellerFk, String consumerFk) {
//		Connection conn = DBConnection.getConnection();
//		String sql = "UPDATE dealing SET address = ?, detailed_address = ?, deal_date WHERE seller_fk = ? AND consumer_fk = ?";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, address);
//			pstmt.setString(2, detailedAddress);
//			pstmt.setString(3, dealDate);
//			pstmt.setString(4, sellerFk);
//			pstmt.setString(5, consumerFk);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	// 구매자가 판매자에게 주소 보내기
	public void insertConsumerToSellerDeal(String sellerFk, String consumerFk, String productName, int price, String address, String detailedAddress, String addressName, String imagename, String deliveryCharge, int productnumber_pk) {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO dealing(dno, seller_fk, consumer_fk, product_name, price, address, detailed_address, address_name, imagename, delivery_charge, productnumber) "
				 + "VALUES(dealing_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		System.out.println(sellerFk +"/"+consumerFk +"/"+ productName +"/" +price +"/" +address+"/"+detailedAddress+"/" + addressName + "/"+imagename+"/"+deliveryCharge +"/"+productnumber_pk);
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerFk);
			pstmt.setString(2, consumerFk);
			pstmt.setString(3, productName);
			pstmt.setInt(4, price);
			pstmt.setString(5, address);
			pstmt.setString(6, detailedAddress);
			pstmt.setString(7, addressName);
			pstmt.setString(8, imagename);
			pstmt.setString(9, deliveryCharge);
			pstmt.setInt(10, productnumber_pk);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 구매자에게 거래요청받기
	public String getDealFromConsumer(String nicknamePK) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT d.seller_fk, d.product_name , d.price, d.address, d.detailed_address, p.address_name, p.nickname_pk, p.address, p.detailed_address, p.account_holder, p.bank_name from dealing d, profile p where d.address = p.address AND d.detailed_address = p.detailed_address AND p.nickname_pk = d.seller_fk and p.nickname_pk = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePK);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String sellerFk = rs.getString("seller_fk");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String addressName = rs.getString("address_name");
				String address = rs.getString("address");
				String detailedAddress = rs.getString("detailed_address");
				String nicknamePk = rs.getString("nickname_pk");
				strRet = sellerFk + "/" + productName + "/" + price + "/" + addressName +"/" + address + "/" + detailedAddress + "/" + nicknamePk;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 거래를 수락하고 구매자에게 계좌보내기
//	public void updateSellerToConsumerDealDone(String accountHolder, String accountNumber, String bankName, String dealDate, String sellerFk, String consumerFk) {
//		Connection conn = DBConnection.getConnection();
//		String sql = "UPDATE dealing SET account_holder = ?, account_number = ?, bankName = ?, deal_date = ? WHERE seller_fk = ? AND consumer_fk = ?";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, accountHolder);
//			pstmt.setString(2, accountNumber);
//			pstmt.setString(3, bankName);
//			pstmt.setString(4, dealDate);
//			pstmt.setString(5, sellerFk);
//			pstmt.setString(6, consumerFk);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	// 거래를 수락하고 구매자에게 계좌보내기
	public void updateSellerToConsumerDealDone(String bankName, String accountHolder, String accountNumber, int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE dealing SET bank_name = ?, account_holder = ?, account_number = ? WHERE dno = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bankName);
			pstmt.setString(2, accountHolder);
			pstmt.setString(3, accountNumber);
			pstmt.setInt(4, dno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 구매자에게 거래를 요청하였습니다
	public String getConsumerFromSellerDeal(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT imagename, price, delivery_charge, product_name, account_number, bank_name, account_holder FROM dealing WHERE dno = ?";
		String strRet="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String imagename = rs.getString("imagename");
				int price = rs.getInt("price");
				String deliveryCharge = rs.getString("delivery_charge");
				String productName = rs.getString("product_name");
				String accountNumber = rs.getString("account_number");
				String bankName = rs.getString("bank_name");
				String accountHolder = rs.getString("account_holder");
				strRet = imagename + "/" + price + "/" + deliveryCharge + "/" + productName + "/" + accountNumber + "/" + bankName + "/" + accountHolder;
				rs.close();
				pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	
	// 직거래 요청하기
	public void insertDirectToDeal(String sellerFk, String consumerFk, String productName, int price, String place, String imagename, int productnumber, String directDealPromiseDate) {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO dealing(dno, seller_fk, consumer_fk, product_name, price, place, imagename, productnumber, direct_deal_promise_date)"
				+ " VALUES(dealing_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerFk);
			System.out.println("판매자닉네임 제발 : " + sellerFk);
			pstmt.setString(2, consumerFk);
			System.out.println("구매자닉네임 제발 : " + consumerFk);
			pstmt.setString(3, productName);
			System.out.println("상품이름 제발 : " + productName);
			pstmt.setInt(4, price);
			System.out.println("가격 제발 : " +  price);
			pstmt.setString(5, place);
			System.out.println("장소 제발 : " + place);
			pstmt.setString(6, imagename);
			System.out.println("이미지이름 제발 : " + imagename);
			pstmt.setInt(7, productnumber);
			System.out.println("상품번호 제발 : " + productnumber);
			pstmt.setString(8, directDealPromiseDate);
			System.out.println("직거래약속날 제발 : " + directDealPromiseDate);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 닉네임으로 핸드폰번호 리턴
	public String getPhoneNumber(String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql="SELECT phone_number FROM profile WHERE nickname_pk=?";
		String strRet="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String phoneNumber = rs.getString("phone_number");
				strRet = phoneNumber;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 직거래체크 정보리턴
	public String getDirectDealCheck(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql="SELECT dno, seller_fk, consumer_fk, product_name, price, place, imagename, productnumber, direct_deal_promise_date FROM dealing WHERE dno=?";
		String strRet="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sellerFk = rs.getString("seller_fk");
				String consumerFk = rs.getString("consumer_fk");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String place = rs.getString("place");
				String imageName = rs.getString("imagename");
				int productnumber = rs.getInt("productnumber");
				String directDealPromiseDate = rs.getString("direct_deal_promise_date");
				strRet = sellerFk + "/" + consumerFk + "/" + productName + "/" + price + "/" + place + "/" + imageName + "/" + productnumber + "/" + directDealPromiseDate;
				rs.close();
				pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 거래완료 (등록)
	public void updateDealDone(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE dealing SET deal_date = sysdate WHERE dno = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 상품번호를 이용해 판매완료로 update
	public void updateDealCheck(int productnumberPk) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE product SET purchase_status='판매완료' WHERE productnumber_pk=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productnumberPk);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 택배거래완료 (리턴)
	public String getDealDone(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT imagename, price, product_name, seller_fk, consumer_fk, delivery_charge FROM dealing WHERE dno = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String imagename = rs.getString("imagename");
				int price = rs.getInt("price");
				String productName = rs.getString("product_name");
				String sellerFk = rs.getString("seller_fk");
				String deliveryCharge = rs.getString("delivery_charge");
				strRet = imagename + "/" + price + "/" + productName + "/" + sellerFk + "/" + deliveryCharge;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 직거래완료 (리턴)
	public String getDirectDealDone(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT dno, seller_fk, consumer_fk, product_name, price, place, imagename, productnumber, deal_date FROM dealing WHERE dno=?";
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
				String place = rs.getString("place");
				String imagename = rs.getString("imagename");
				int productnumber = rs.getInt("productnumber");
				String dealDate = rs.getString("deal_date");
				strRet = sellerFk + "/" + consumerFk + "/" + productName + "/" + price + "/" + place + "/" + imagename + "/" + productnumber + "/" + dealDate;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 거래 취소 (등록)
	public void updateDealCancel(String cancelReason, String cancelReasonDetail, int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE dealing SET CANCEL_DATE = sysdate, CANCEL_REASON =  ?, CANCEL_REASON_DETAIL = ? WHERE dno = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cancelReason);
			pstmt.setString(2, cancelReasonDetail);
			pstmt.setInt(3, dno);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 거래취소 (불러오기)
	public  String getDealCancel(int dno) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT delivery_charge, imagename, price, product_name, seller_fk, cancel_reason, cancel_reason_detail FROM dealing WHERE dno = ?";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String deliveryCharge = rs.getString("delivery_charge");
				String imagename = rs.getString("imagename");
				int price = rs.getInt("price");
				String productName = rs.getString("product_name");
				String sellerFk = rs.getString("seller_fk");
				String cancelReason = rs.getString("cancel_reason");
				String cancelReasonDetail = rs.getString("cancel_reason_detail");
				
				strRet = deliveryCharge + "/" + imagename + "/" + price + "/" + productName + "/" + sellerFk + "/" + cancelReason + "/" + cancelReasonDetail;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 거래정보 가져오기 (판매자에게 거래요청) -- 미완성
	public String getDealingInfoToSeller(int productnumber_pk) {
		Connection conn = DBConnection.getConnection();
		//String sql = "SELECT seller_fk, consumer_fk, product_name, price, account_number, address, detailed_address FROM dealing WHERE productnumber=?";
		String sql = "SELECT d.seller_fk, d.consumer_fk, d.product_name, d.price, d.address, d.detailed_address, d.address_name, d.imagename, d.delivery_charge,"
				+ " p.nickname_pk, p.phone_number FROM dealing d, profile p WHERE d.consumer_fk = p.nickname_pk AND productnumber=? ORDER BY dno DESC";
		String strRet = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productnumber_pk);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String sellerFk = rs.getString("seller_fk");
				//String consumerFk = rs.getString("consumer_fk");
				String productName = rs.getString("product_name");
				int price = rs.getInt("price");
				String address = rs.getString("address");
				String detailedAddress = rs.getString("detailed_address");
				String addressName = rs.getString("address_name");
				String imagename = rs.getString("imagename");
				String deliveryCharge = rs.getString("delivery_charge");
				String phoneNumber = rs.getString("phone_number");
				strRet = sellerFk + "/" + productName + "/" + price + "/" + address + "/" + detailedAddress + "/" + addressName + "/" + imagename + "/" + deliveryCharge + "/" + phoneNumber;
				System.out.println("SellerToDealRequestDao실행");
				System.out.println("sellerFk = " + sellerFk);
				System.out.println("productName = " + productName);
				System.out.println("price = " + price);
				System.out.println("address = " + address);
				System.out.println("detailedAddress = " + detailedAddress);
				System.out.println("addressName = " + addressName);
				System.out.println("imagename = " + imagename);
				System.out.println("deliveryCharge = " + deliveryCharge);
				System.out.println("phoneNumber = " + phoneNumber);
				rs.close();
				pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	// 구매요청
	public void insertPurchaseRequest(String sellerFk, String consumerFk, int productnumber, String address, String detailedAddress, String addressName, int price) {
		Connection conn = DBConnection.getConnection();
		String sql="INSERT INTO purchase_request(bno, seller_fk, consumer_fk, purchase_date, productnumber, address, detailed_address, address_name, price) VALUES(purchase_request_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerFk);
			pstmt.setString(2, consumerFk);
			pstmt.setInt(3, productnumber);
			pstmt.setString(4, address);
			pstmt.setString(5, detailedAddress);
			pstmt.setString(6, addressName);
			pstmt.setInt(7, price);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 거래정보 가져오기(구매자에게 거래를 요청받았습니다)
	public String getDealingInfoFromConsumer(String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String strRet = "";
		String sql = "SELECT pc.seller_fk, pc.consumer_fk, pc.purchase_date, pc.productnumber, pc.address, pc.detailed_address, pc.address_name, pc.price,"
				+ " pd.productnumber_pk, pd.imagename, pd.nickname_fk"
				+ " FROM purchase_request pc, product pd WHERE pc.productnumber = pd.productnumber_pk AND pc.seller_fk = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next() ) {
				String sellerFk = rs.getString("pc.seller_fk");
				String consumerFk = rs.getString("pc.consumer_fk");
				String purchaseDate = rs.getString("pc.purchase_date");
				String productNumber = rs.getString("pc.productnumber");
				String address = rs.getString("pc.address");
				String detailedAddress = rs.getString("pc.detailedAddress");
				String addressName = rs.getString("pc.address_name");
				int price = rs.getInt("pc.price");
				String productnumberPk = rs.getString("pd.productnumber_pk");
				String imagename = rs.getString("pd.imagename");
				String nicknameFk = rs.getString("pd.nickname_fk");
				strRet = sellerFk + "/" + consumerFk + "/" + purchaseDate + "/" + productNumber + "/" + address + "/" + detailedAddress + "/" + addressName + "/" + price + "/" + productnumberPk + "/" + imagename + "/" + nicknameFk;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return strRet;
	}
	
	
	// 번개톡 아이콘으로 진입시 상대방 닉네임, 상품정보 가져오기
//	public String getOtherNicknameProductInfoSelect(int rnO) {
//		Connection conn = DBConnection.getConnection();
//		String strRet = "";
//		String sql = "SELECT cr.rno, cr.purchase_fk, cr.seller_fk, cr.dno, dl.dno, dl.product_name, dl.price, dl.imagename, dl.delivery_charge, dl.productnumber"
//				+ " FROM chat_room cr, dealing dl WHERE cr.rno = ? AND cr.dno = dl.dno";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, rnO);
//			ResultSet rs = pstmt.executeQuery();
//			if(rs.next()) {
//				int rno = rs.getInt("rno");
//				String purchaseFk = rs.getString("purchase_fk");
//				String sellerFk = rs.getString("seller_fk");
//				int crDno = rs.getInt("dno");
//				int dlDno = rs.getInt("dno");
//				String productName = rs.getString("product_name");
//				int price = rs.getInt("price");
//				String imagename = rs.getString("imagename");
//				String deliveryCharge = rs.getString("delivery_charge");
//				int productnumber = rs.getInt("productnumber");
//				strRet = rno + "/" + purchaseFk + "/" + sellerFk + "/" + crDno + "/" + dlDno + "/" + productName + "/" + price + "/" + imagename + "/" + deliveryCharge + "/" + productnumber + "/";
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + rno);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + purchaseFk);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + sellerFk);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + crDno);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + dlDno);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + productName);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + price);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + imagename);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + deliveryCharge);
//				System.out.println("번개톡 들어오면 상품정보 가져오기=" + productnumber);
//			}
//			rs.close();
//			pstmt.close();
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return strRet;
//	}
	
	// 판매내역 (횟수) 조회
	public int countDealDone(String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql="SELECT count(deal_date) FROM dealing WHERE seller_fk=?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(deal_date)");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 판매상품 (갯수) 조회
	public int countProducts(String nicknameFk) {
		Connection conn = DBConnection.getConnection();
		String sql="SELECT count(*) FROM product WHERE nickname_fk=?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknameFk);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 후기내역 (횟수) 조회
	public int countReview(String nicknamePk) {
		Connection conn = DBConnection.getConnection();
		String sql="SELECT count(*) FROM review WHERE nickname_fk=?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknamePk);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
