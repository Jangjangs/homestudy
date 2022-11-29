package com.google.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


/**
 * 로그인한 사용자에게 부여된 권한 AuthenticationSuccessHandler를 이용해
 * 사용자의 모든 권한을 문자열로 체크한다 
 */
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {

		
		/**
		 * 권한에 따른 페이지 이동
		 */
		
		//Authentication 객체는 인증된 대상의 정보를 담고있다.
		//그 객체에서 authority(권한)을 추출해 roleNames 리스트에 담는다.
		List<String> roleNames = new ArrayList<String>();
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		//ROLE_ADMIN 이 포함돼있으면 /sample/admin으로 리다이렉트
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("sample/admin");
			return;
		}
		
		//ROLE_MEMBER 이 포함돼있으면 /sample/member으로 리다이렉트
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("sample/member");
			return;
		}
		
		//둘다 없으면 메인 페이지로 리다이렉트
		response.sendRedirect("/admin");
	}
	

}
