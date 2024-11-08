<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send( f ){
				let title = f.title.value;
				let photo = f.photo.value;
				
				if( title === '' ){
					alert("제목은 필수");
					return;
				}
				
				if( photo === '' ){
					alert("사진 필수");
					return;
				}
				
				f.action = "upload.do";
				f.submit();
			}
		</script>
	</head>
	<body>
		<!-- 파일 업로드 시 form에 필수로 작성해야 하는 코드  -->
		<form method="post"
			  enctype="multipart/form-data">
			  
			제목<input name="title"><br>
			첨부<input type="file" name="photo"><br>
			<input type="button" value="업로드" onclick="send(this.form);"> 
		</form>
	</body>
</html>