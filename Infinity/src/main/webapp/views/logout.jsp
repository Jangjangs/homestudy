<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//세션 삭제 후 login.jsp로 이동
	session.invalidate(); //
	
	response.sendRedirect("login.jsp");
%>