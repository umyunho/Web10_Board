<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.himedia.board.dao.BoardDao" %>
<%@ page import="com.himedia.board.dto.BoardDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView.jsp</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script src="script/board.js"></script>
</head>
<body>
<script>
setTimeout(function(){
   if(! location.href.includes("boardViewWithoutCnt"))location.href="board.do?command=boardViewWithoutCnt&num="+${board.num};
},50);
</script>
   <div id="main_container">
      <h2>게시글 상세보기</h2>
      <div class="board">
         <div class="field">
            <div class="label">작성자</div>
            <div class="text">${board.userid}</div>
         </div>
         <div class="field">
            <div class="label">이메일</div>
            <div class="text">${board.email}</div>
         </div>
         <div class="field">
            <div class="label">조회수</div>
            <div class="text">${board.readcount}</div>
         </div>
         <div class="field">
            <div class="label">작성일</div>
            <div class="text"><fmt:formatDate value="${board.writedate}"/></div>
         </div>
         <div class="field">
            <div class="label">제목</div>
            <div class="text">${board.title}</div>
         </div>
         <div class="field content">
            <div class="label">내용</div>
            <div class="text"><pre>${board.content}</pre></div>
         </div>
      </div>
      <div class="log-button">
         <input type="submit" class="btn-login" value="수정" onclick="location.href = 'board.do?command=updateBoardForm&num=${board.num}'"/>
         <input type="button" class="btn-login" value="삭제" onclick="deleteBoard('${board.pass}','${board.num}')" />
         <input type="button" class="btn-login" value="목록" 
            onclick ="location.href='board.do?command=main'"
         />
      </div>
      <div class="reply">
         <div class="reply_row">
            <div class="reply_col reply_title">작성자</div>
            <div class="reply_col reply_title">작성 일시</div>
            <div class="reply_col reply_title">댓글</div>
            <div class="reply_col reply_title">작성/삭제</div>
         </div>
         <form action="board.do" name="reply">
            <input type="hidden" name="command" value="insertReply" />
            <input type="hidden" name="userid" value="${loginUser.userid}" />
            <input type="hidden" name="boardnum" value="${board.num}" />
             <div class="reply_row">
               <div class="reply_col">${loginUser.userid}</div>
               <div class="reply_col">
               <c:set var ="now" value="<%=new java.util.Date() %>" />
               <fmt:formatDate value="${now}" pattern ="MM/dd hh:mm" />
               </div>
               <div class="reply_col"><input type="text" name="content" size ="70"></div>
               <div class="reply_col"><input type="submit" value="답글 작성" onclick = "return reply_check();"/></div>
            </div>
         </form>
         <c:forEach items = "${replyList}" var="reply">
            <div class="reply_row">
               <div class="reply_col">${reply.userid}</div>
               <div class="reply_col">
              	 <fmt:formatDate value="${reply.writedate}" />
               </div>
               <div class="reply_col">${reply.content}</div>
               <div class="reply_col">
               	 <c:if test="${reply.userid==loginUser.userid }">
            	  	 <input type="button" value="삭제" 
            	  	 onClick="location.href='board.do?command=deleteReply&replynum=${reply.replynum}&boardnum=${reply.boardnum}'"/>
              	 </c:if>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>
</body>
</html>












