<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	response.sendRedirect("board.do?command=loginForm");

	/* 
		- servlet 으로 클라이언트와 서버가 request와 response 를 이용하여 연결하고 통신함
		- 이전 프로젝트들에서는 매 페이지마다 해당 서블릿을 만들고, 
			각 페이지를 보기 위해서는 담당 서블릿을 호출하는 형식이었다면 
			(서블릿의 URL Mappig은 노출되나 이외의 것을은 모두 감춰짐)
		- 이번 프로젝트에서는 서블릿을 하나로 줄이고, command라는 파라미터를 써서 각 페이지 호출을 구분할 예정
			: 단일서블릿 내에서 기능별로 구성된 클래스들을 이용하여 페이지 기능 구현
			(기능마다 서블릿이 있는 것보다 구조가 간편하고 서버의 부담을 줄이게 됨)
	*/
%>
</body>
</html>