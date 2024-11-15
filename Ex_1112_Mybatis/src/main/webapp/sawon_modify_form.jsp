<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function modify(f){
				
				let url = "sawon_update.do";
				let param = "sabun=" + f.sabun.value +
							"&saname=" + f.saname.value + 
							"&sagen=" + f.sagen.value +
							"&deptno=" + f.deptno.value +
							"&sajob=" + f.sajob.value +
							"&sahire=" + f.sahire.value +
							"&samgr=" + f.samgr.value +
							"&sapay=" + f.sapay.value;
				
				sendRequest( url, param, modifyFn, "post" );	
			}
			
			//콜백
			function modifyFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					let data = xhr.responseText;
					
					let json = ( new Function('return '+data) )();
					
					if( json[0].param = "succ" ){
						alert("수정 성공");
						location.href="sawonlist.do";
					}else{
						alert("수정 실패");
						return;
					}
				}
			}
			
		</script>
	</head>
	
	
	<body>
		<form>
			<input type="hidden" name="sabun" value="${ vo.sabun }">
			<table border="1">
				<caption>사원 정보 수정</caption>
				
				<tr>
					<th>이름</th>
					<td><input name="saname" value="${ vo.saname }"></td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td><input name="sagen" value="${ vo.sagen }"></td>
				</tr>
				
				<tr>
					<th>부서번호</th>
					<td><input name="deptno" value="${ vo.deptno }"></td>
				</tr>
				
				<tr>
					<th>직책</th>
					<td><input name="sajob" value="${ vo.sajob }"></td>
				</tr>
				
				<tr>
					<th>입사일</th>
					<td><input name="sahire" value="${ fn:split(vo.sahire, ' ')[0] }"></td>
				</tr>
				
				<tr>
					<th>상사번호</th>
					<td><input name="samgr" value="${ vo.samgr }"></td>
				</tr>
				
				<tr>
					<th>연봉</th>
					<td><input name="sapay" value="${ vo.sapay }"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정"
							   onclick="modify(this.form);">
						<input type="button" value="취소"
							   onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>