package com.himedia.board.controller.action.board;

import java.io.IOException;
import java.util.ArrayList;

import com.himedia.board.controller.action.Action;
import com.himedia.board.dao.BoardDao;
import com.himedia.board.dto.BoardDto;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판의 게시물을 모두 조회하여 request 에 담고 main.jsp로 forward
		
		BoardDao bdao = BoardDao.getInstance();
		
		ArrayList<BoardDto> list = bdao.getAllBoard();
		request.setAttribute("boardList", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
		rd.forward(request, response);
	}

}
