package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/upload.do")
public class FileUploadAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("utf-8");
		
		//파일을 저장할 절대경로
		String web_path = "/img/";
		
		//현재 프로젝트를 관리하는 객체
		ServletContext application = request.getServletContext();
		
		//상대경로 -> 절대경로
		String path = application.getRealPath(web_path);
		System.out.println("절대경로 : " + path);
		
		//최대 업로드 용량 100mb (byte형식으로 작성)
		int max_size = 1024 * 1024 * 100;
		
		//파일을 포함하고 있는 파라미터 수신을 위한 객체
		MultipartRequest mr = 
				new MultipartRequest( 
						request,
						path,
						max_size,
						"utf-8",
						new DefaultFileRenamePolicy()); //동일파일명객체 : 이름이 똑같을 때 넘버링
		
		//업로드 된 파일 정보를 얻어오기
		String filename = "no_file";
		
			//파일은 파일객체로 받기. 넘어온 파라미터 이름과 동일하게
		File f = mr.getFile("photo"); 
		
		if( f != null ) {
			//파일 업로드 성공했다면
			filename = f.getName();//실제파일명
			System.out.println(filename);
		}
		
		//파일 이외의 파라미터 수신. mr에게 request를 위임했기 때문에 mr사용
		String title = mr.getParameter("title");
		
		//리퀘스트 영역에 바인딩
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		RequestDispatcher disp = request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
		
		
	}

}
