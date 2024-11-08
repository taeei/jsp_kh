<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			//페이지 실행과 동시에 호출되는 영역
			window.onload = function(){
				let url = "movie_list_json.jsp";
				sendRequest( url, null, movieRes, "get" );
			}
			
			//콜백메서드
			function movieRes(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					//json형식의 영화정보를 받아온다
					let data = xhr.responseText;
					
					//가져온 데이터는 json구조이지만 String형태로
					//넘어온 문장데이터다.
					//이를 실제 json구조로 변경해야 한다
					let json = JSON.par e(data);
					
					//<select>태그에 option생성
					let movie_select = document.getElementById("movie_select");
					
					for( let i = 0; i < json.length; i++){
						let option = document.createElement("option");
						option.innerHTML = json[i].title;
						option.value = json[i].path;
						movie_select.appendChild( option );
					}//for
				}
			}
			
			function movie_play(){
				//현재 선택된 option으로부터 value값을 가져온다.
				let path = document.getElementById("movie_select").value;
				
				let my_video = document.getElementById("my_video");
				my_video.src = path;
				my_video.play();
				
			}
			
	
		</script>
	</head>
	
	
	<body>
		<select id="movie_select" onchange="movie_play();">
			<option value="">:::재생을 위한 영상을 선택하세요:::</option>
		</select>
		
		<br>
		
		<video id="my_video"
			   src=""
			   controls="controls"
			   width="320"
			   height="240"></video>
	</body>
</html>