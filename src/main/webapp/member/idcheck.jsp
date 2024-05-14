<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<style type="text/css">
	body{
		display: flex;
		height: 100vh;
		padding: 0px;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		overflow: hidden;
		margin: 0;
	}
	body * {
		margin: 3px 0;
	}
</style>
<script type="text/javascript">

	function idok(id){
		opener.document.join.userid.value = id;
		opener.document.join.reid.value = id;
		
		self.close();
	}
	
</script>
</head>
<body>
<!-- 재검색창 -->
<form action="board.do" style="margin: 0px 0;">
	<input type="hidden" name="command" value="idcheck">
	아이디 : <input type="text" name="userid" value="${userid}"> <!-- value에 확인된 아이디 표시 -->
	<input type="submit" value="중복체크">
</form>

<div>
	<!-- 사용 가능/불가능 -->
	<c:choose>
		<c:when test="${result == 1}">
			${userid} 는 이미 사용중인 아이디입니다.
			<script type="text/javascript">
				opener.document.join.userid.value = "";
				opener.document.join.reid.value = "";
			</script>
		</c:when>
		<c:otherwise> 
			${userid} 는 사용 가능한 아이디입니다.
			<input type="button" value="사용하기" onclick="idok('${userid}')">
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>