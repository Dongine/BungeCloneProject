package servelt;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getRealPath("Images");
		System.out.println("real path : " + path);
		
		File filePath = new File(path);
		if(filePath.exists()==false) {
			filePath.mkdirs();
		}
		
		int sizeLimit = 100*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String fileObject1 = (String)(files.nextElement());
		String filename1 = multi.getFilesystemName(fileObject1);
		
		System.out.println("desc : " + multi.getParameter("desc"));
		
		request.setAttribute("imgSrc", filename1);
		request.getRequestDispatcher("ExUploadResult.jsp").forward(request, response);
		
	}
}
