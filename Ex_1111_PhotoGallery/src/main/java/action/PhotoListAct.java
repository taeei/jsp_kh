package action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;


@WebServlet("/list.do")
public class PhotoListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//DAO에서 전체 목록 가져오기
		List<PhotoVO> list = PhotoDAO.getInstance().selectList();
		
		//바인딩 (가지고 온 리스트(데이터)를 다른 jsp에서 사용가능 하게)
		request.setAttribute("list", list);
		
		//포워딩 (데이터를 어디서 사용하고 싶은지)
		RequestDispatcher disp = request.getRequestDispatcher("photo_list.jsp");
		disp.forward(request, response);
		
		
		
	}

}
