<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>

   <form name="update" class="login-form" action="board.do" method="post">
		<input type="hidden" name="command" value="updateMember" />
		<h2>Update Member</h2>
		<div class="field">
			<label>User ID</label>
			<input type="text" name="userid" value="${loginUser.userid}" readonly="readonly">
		</div>
		<div class="field">
			<label>Password</label>
			<input type="password" name="pwd">
		</div>
		<div class="field">
			<label>Pw Confirm</label>
			<input type="password" name="pwd_check">
		</div>
		<div class="field">
			<label>Name</label>
			<input type="text" name="name" value="${loginUser.name}">
		</div>
		<div class="field">
			<label>Email</label>
			<input type="text" name="email" value="${loginUser.email}">
		</div>
		<div class="field" style="margin-bottom:">
			<label>Phone</label>
			<input type="text" name="phone" value="${loginUser.phone}">
		</div>

		<div class="login-button" style="margin-bottom: 20px; margin-top: 0px;">
			<input type="submit" class="btn-login" value="Update"
				onclick="return updatecheck()" /> 
			<input type="button" class="btn-login" value="Back"
				onclick="location.href='board.do?command=main'" />
		</div>

	</form>
</body>
</html>