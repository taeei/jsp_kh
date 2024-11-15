<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/photo.css">
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function del(f){
				
				let pwd = f.pwd.value;
				let pwd2 = f.pwd2.value;
				
				if( pwd != pwd2 ){
					alert("비밀번호 불일치");
					return;
				}
				
				if( !confirm("정말 삭제하시겠습니까?") ){
					return;
				}
				
				let url = "delete.do";
				let param = "idx=" + f.idx.value;
				
				sendRequest(url, param, delFn, "get");
			}
			
			function delFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					
					let json = ( new Function('return '+data) )();
					
					if( json[0].param === 'yes' ){
						alert("삭제 성공");
					}else{
						alert("삭제 실패");
					}
					
					//전체목록 갱신
					location.href="list.do";
				}
			}
			
			//이미지 클릭을 감지하는 변수
			let click = false;
			
			function imgclick( path ){
				
				click = !click;
				
				let img = document.getElementById("showImg");
				let showdiv = document.getElementById("showdiv");
				
				if( click ){
					img.src = path;
					showdiv.style.display = 'block';
				}else{
					img.src = "";
					showdiv.style.display = 'none';
				}
			}
			
			// 파일 다운로드
			function download( filename ){
				
				location.href = "download.do?dir=/upload/&filename=" +
						encodeURIComponent( filename );
				
			}
			
		</script>
		
	</head>
	
	
	<body>
		<div id="main_box">
			<h1>::: Photo Gallery :::</h1>
			
			<div align="center">
				<input type="button" value="사진등록"
				       onclick="location.href='photo_insert_form.jsp'">
			</div>
			
			<div id="photo_box"> 
				
				<c:if test="${ empty list }">
					<div>등록된 사진이 없습니다</div>
				</c:if>
			
				<c:forEach var="vo" items="${ list }">
					<div class="photo_type">
						<img src="upload/${ vo.filename }"
							 onclick="imgclick(this.src);">
						
						<div class="title">${ vo.title }</div>
						
						<form>
							<input type="hidden" name="idx" value="${ vo.idx }">
							<input type="hidden" name="pwd" value="${ vo.pwd }">
							
							<div align="center">
								<input type="password" name="pwd2" size="5">
								<input type="button" value="삭제"
									   onclick="del(this.form)">
									   
								<input type="button" value="down"
									   onclick="download('${ vo.filename }');">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div id="showdiv" style="diplay:none">
			<img src="" id="showImg" onclick="imgclick(this.src);">
		</div>
		
	</body>
</html>