package com.himedia.board.controller.action.member;

import java.io.IOException;

import com.himedia.board.controller.action.Action;
import com.himedia.board.dao.MemberDao;
import com.himedia.board.dto.MemberDto;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDto mdto = new MemberDto(request.getParameter("userid"), request.getParameter("name"), request.getParameter("pwd"), request.getParameter("email"), request.getParameter("phone"));
		
		MemberDao mdao = MemberDao.getInstance();
		int result = mdao.insertMember(mdto);
		
		String message = "";
		if (result == 1) {
			message = "회원가입이 완료되었습니다. 로그인하세요.";
		}else {
			message = "회원가입이 실패하였습니다. 관리자에게 문의해주세요.";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("message", message);
		
		//레코드를 추가하는 기능에는 절대 forward XXXXXXX
		//forward를 사용할 경우 parameter가 그대로 url에 오기 때문에
		//직전에 추가된 record를 그대로 중복추가하게 됨
		// - > 기본키 오류가 발생한다
		//따라서 위와 같은 오류를 내지 않으려면 forward 대신 sendRedirect로 보내주고
		//forward와 다르게 parameter가 가지 않으므로 따로 지정해주자
		
		response.sendRedirect("board.do?command=loginForm");
		
	}

}
