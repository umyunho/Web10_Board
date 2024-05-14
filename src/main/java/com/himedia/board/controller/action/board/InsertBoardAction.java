package com.himedia.board.controller.action.board;

import java.io.IOException;

import com.himedia.board.controller.action.Action;
import com.himedia.board.dao.BoardDao;
import com.himedia.board.dto.BoardDto;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertBoardAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDao bdao = BoardDao.getInstance();
		BoardDto bdto = new BoardDto();
		
		bdto.setUserid(request.getParameter("userid"));
		bdto.setPass(request.getParameter("pass"));
		bdto.setEmail(request.getParameter("email"));
		bdto.setTitle(request.getParameter("title"));
		bdto.setContent(request.getParameter("content"));

		bdao.insertBoard(bdto);
		
		response.sendRedirect("board.do?command=main");
		
	}

}
