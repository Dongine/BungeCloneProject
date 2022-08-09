package action;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bunge.dao.ProductRegistDao;
import com.bunge.dao.SaleDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductRegistAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRealPath("images");
		System.out.println(path);
		
		File filePath = new File(path); 
	 	if(filePath.exists()==false){
	 		filePath.mkdirs(); 
	 	}
		
		MultipartRequest mr = new MultipartRequest(request, path, 640*640*640,"UTF-8",
													new DefaultFileRenamePolicy() );
		
		SaleDao sDao = new SaleDao();
		String category1 = mr.getParameter("category1");
		String category2 = mr.getParameter("category2");
		String category3 = mr.getParameter("category3");
		String category1Code = "";
		String category2Code = "";
		String category3Code = "";
		try {
			category1Code = sDao.getSaleCategory1(category1);
			category2Code = sDao.getSaleCategory2(category1Code, category2);
			category3Code = sDao.getSaleCategory3(category2Code, category3);
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		Enumeration files = mr.getFileNames();
		String fileObject1 = (String)(files.nextElement());
		String nicknamefk = mr.getParameter("nickname");;
		String imagename = mr.getFilesystemName(fileObject1);//
		//String imagename = mr.getParameter("imagename");
		String productname = mr.getParameter("productname");
		int price = Integer.parseInt(mr.getParameter("price"));
		String productstate = mr.getParameter("productstate");
		String exchange = mr.getParameter("exchange");
		String deliverycharge = mr.getParameter("deliverycharge");
		String tradingarea = mr.getParameter("tradingarea");
		String productinformation = mr.getParameter("productinformation");
		int quantity = Integer.parseInt(mr.getParameter("quantity"));
		String tag = mr.getParameter("tag");
		String category = category3Code;
		String safety_payment = mr.getParameter("safety_payment");
		ProductRegistDao rdao = new ProductRegistDao();
		try {
			rdao.registProduct(nicknamefk, imagename, productname, price, productstate, exchange, deliverycharge, tradingarea, productinformation, quantity, tag, category, safety_payment);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("sale.jsp").forward(request, response);
	}

}
