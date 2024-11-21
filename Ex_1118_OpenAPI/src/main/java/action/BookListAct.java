package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import vo.BookVO;


@WebServlet("/list.do")
public class BookListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//검색할 단어
		String search_txt = request.getParameter("search_txt");
		
		//검색어를 utf-8로 인코딩 (검색어. UTF-8로 인코딩되어야 합니다.)
		String search = URLEncoder.encode(search_txt, "UTF8");
		
		//display : 한 번에 표시할 검색 결과 개수. //start : 시작 수
		String urlStr = 
				"https://openapi.naver.com/v1/search/book.json?query="+search+"&display=20&start=1";
	
		//위의 url로 접근할 객체
		URL url = new URL(urlStr);
		
		//접속
		HttpURLConnection connection = 
				(HttpURLConnection)url.openConnection();
		
		//API를 요청할 때 HTTP 요청 헤더에 클라이언트 아이디와 클라이언트 시크릿을 추가해야 합니다.
		//발급받은 ID 
		connection.setRequestProperty(
				"X-Naver-Client-Id", "2YAgh8EmfEgPDfI9uNow");
		
		//발급받은 시크릿
		connection.setRequestProperty("X-Naver-Client-Secret", "6EEoCiB4m3");
		
		BufferedReader br = 
				new BufferedReader( 
						new InputStreamReader( connection.getInputStream() ) );
		
		//검색을 통해 조회된 결과를 읽어온다
		String line = "";
		String resultJson = "";
		
		while( (line = br.readLine()) != null ) {
			//br.line이 한 줄씩 가져와 line에 넣어준다
			//API를 통해 읽어온 json형식의 결과를  resultJson변수에 저장
			resultJson += line;
		}
		
		System.out.println(resultJson);
		
		br.close();
		connection.disconnect();
		
		//서버에서 가져온 JSON타입의 결과를 VO에 저장하고 List에 담아둔다.
		//String resultJson = 
		/*"items":[
		         {
		            "title":"제목1", 
		            "image":"이미지1", 
		            "author":"저자1", 
		            "discount":"가격1"
		         }, 
		         {
		            "title":"제목2", 
		            "image":"이미지2", 
		            "author":"저자2", 
		            "discount":"가격2"
		         }, ...
		      ]
		 */
		JSONArray json_res = null; //JSON배열 형태를 가져오는 객체
		JSONObject jsonObj = null; //일반 JSON형태를 가져오는 객체
		
		try {
			
			JSONParser jsonParser = new JSONParser();
			jsonObj = (JSONObject)jsonParser.parse( resultJson );
			
			//jsonObj에서 items라는 이름의 배열만 꺼내온다.
			json_res = (JSONArray)jsonObj.get("items");
			
		} catch (Exception e) {
			
			System.out.println(
					"err : " + e.getMessage());
			
		}//catch
		
		List<BookVO> list = new ArrayList<BookVO>();
		
		for( int i = 0; i < json_res.size(); i++ ) {
			BookVO vo = new BookVO();
			jsonObj = (JSONObject)json_res.get(i);
			
			String title = (String)jsonObj.get("title");
			String image = (String)jsonObj.get("image");
			String author = (String)jsonObj.get("author");
			String discount = (String)jsonObj.get("discount");
			
			vo.setTitle(title);
			vo.setImage(image);
			vo.setAuthor(author);
			vo.setDiscount(discount);
			
			list.add(vo);
			
		}//for
		
		request.setAttribute("list", list);
		request.setAttribute("search_txt", search_txt);
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("book_search.jsp");
		disp.forward(request, response);
		
	}

}
