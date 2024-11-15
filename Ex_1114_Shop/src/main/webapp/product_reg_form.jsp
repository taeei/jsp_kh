<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function checkData(f){
				
				let category = f.category.value;
				let p_price = f.p_price.value;
				let p_saleprice = f.p_saleprice.value;
				let p_image_s = f.p_image_s.value;
				let p_image_l = f.p_image_l.value;
				
				if( category === '' ){
					alert("상품 카테고리를 선택하세요");
					return;
				}
				
				let num_pattern = /^[0-9]*$/;
				
				if( !num_pattern.test( p_price ) || p_price ==='' ){
					alert("가격은 정수로 입력하세요");
					return;
				}
				if( !num_pattern.test( p_saleprice ) || p_saleprice ==='' ){
					alert("가격은 정수로 입력하세요");
					return;
				}
				
				if( p_image_s === '' || p_image_l === '' ){
					alert("상품 이미지를 등록하세요");
					return;
				}
				
				f.action = "insert.do";
				f.submit();
				
			}
		</script>
	</head>
	
	
	<body>
		<form method="post"
			  enctype="multipart/form-data"
			  action="insert.do">
			  
			<table border="1" width="600" align="center"
				   style="border-collapse:collapse;">
				
				<caption>상품 등록하기</caption>
				
				<tr>
					<td>제품 카테고리</td>
					<td>
						<select name="category">
							<option value="">카테고리를 선택하세요</option>
							<option value="com001">컴퓨터</option>
							<option value="ele002">가전제품</option>
							<option value="sp003">스포츠</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>모델명</td>
					<td><input name="p_num"></td>
				</tr>
			
				<tr>
					<td>제품이름</td>
					<td><input name="p_name"></td>
				</tr>
				
				<tr>
					<td>제조사</td>
					<td><input name="p_company"></td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td><input name="p_price"></td>
				</tr>
				
				<tr>
					<td>할인가</td>
					<td><input name="p_saleprice"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">제품설명</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<textarea name="p_content"
								  rows="5" cols="50"
								  style="resize:none"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>작은사진</td>
					<td><input type="file" name="p_image_s"></td>
				</tr>
				
				<tr>
					<td>큰사진</td>
					<td><input type="file" name="p_image_l"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록"
							   onclick="checkData(this.form);">
						<input type="button" value="취소"
							   onclick="history.back()">
					</td>
				</tr>
			
			</table>
		</form>
	</body>
</html>