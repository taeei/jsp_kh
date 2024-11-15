package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;
import vo.ProductVO;


@WebServlet("/insert.do")
public class ProductInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String web_path = "/images/";
		
		ServletContext application = request.getServletContext();
		
		String path = application.getRealPath(web_path);
		
		int max_size = 1024 * 1024* 100;
		
		MultipartRequest mr = 
				new MultipartRequest(
						request,
						path,
						max_size,
						"utf-8",
						new DefaultFileRenamePolicy());
		
		String s_img_name ="no-file";
		String l_img_name ="no-file";
		
		File fs = mr.getFile("p_image_s");
		File fl = mr.getFile("p_image_l");

		if( fs != null ) {
			s_img_name = fs.getName();
		}
		if( fl != null ) {
			l_img_name = fl.getName();
		}
		
		String category = mr.getParameter("category");
		String p_num = mr.getParameter("p_num");
		String p_name = mr.getParameter("p_name");
		String p_company = mr.getParameter("p_company");
		int p_price = Integer.parseInt(mr.getParameter("p_price"));
		int p_saleprice = Integer.parseInt(mr.getParameter("p_saleprice"));
		String p_content = mr.getParameter("p_content");
		
		ProductVO vo = new ProductVO();
		vo.setCategory(category);
		vo.setP_num(p_num);
		vo.setP_name(p_name);
		vo.setP_company(p_company);
		vo.setP_price(p_price);
		vo.setP_saleprice(p_saleprice);
		vo.setP_content(p_content);
		vo.setP_image_s(s_img_name);
		vo.setP_image_L(l_img_name);
		
		int res = ProductDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do?category="+category);
		
	}

}
