package com.himedia.board.controller.action.member;

import java.io.IOException;

import com.himedia.board.controller.action.Action;
import com.himedia.board.dao.MemberDao;
import com.himedia.board.dto.MemberDto;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDto mdto = new MemberDto(request.getParameter("userid"),request.getParameter("name"),request.getParameter("pwd"),request.getParameter("email"),request.getParameter("phone"));
		
		MemberDao mdao = MemberDao.getInstance();
		int result = mdao.updateMember(mdto);
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", mdto);
			//loginUser 속성을 update한 유저정보를 담은 mdto로 덮어씌움 		
		}
		RequestDispatcher rd = request.getRequestDispatcher("board.do?command=main");
		rd.forward(request, response);
		
	}

}
