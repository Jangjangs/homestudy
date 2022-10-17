<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
//회원가입후 로그인페이지로 이동.
//out.println(request.getParameter("mb_id"));
String mb_id=request.getParameter("mb_id"); //네임아이디값 불러오기
String mb_pw=request.getParameter("mb_pw");
String mb_name=request.getParameter("mb_name");
String mb_email=request.getParameter("mb_email");
String mb_zipcode=request.getParameter("mb_zipcode");
String mb_addr=request.getParameter("mb_addr");
String mb_detailAddr=request.getParameter("mb_detailAddr");
String mb_phone=request.getParameter("mb_phone");
String mb_birth=request.getParameter("mb_birth");
String mb_gender=request.getParameter("mb_gender");

//JDBC프로그래밍
String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user="root";
String password="bigdata";

StringBuffer qry = new StringBuffer(); //String 값 변경
qry.append(" INSERT INTO big_member (mb_id, mb_pw, mb_name, mb_email, ");
qry.append(" mb_zipcode, mb_addr, mb_detailAddr, mb_phone, mb_birth, mb_gender, mb_joindate) ");
qry.append(" VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,now()) "); //preparestatement


String sql=qry.toString();


int idx = 1;
Connection conn = null;
PreparedStatement stmt=null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	stmt = conn.prepareStatement(sql);
	//?에 값넣기
	//stmt.setString(1, mb_id); smtm에 id값 넣기
	stmt.setString(idx++, mb_id);
	stmt.setString(idx++, mb_pw);
	stmt.setString(idx++, mb_name);
	stmt.setString(idx++, mb_email);
	stmt.setString(idx++, mb_zipcode);
	stmt.setString(idx++, mb_addr);
	stmt.setString(idx++, mb_detailAddr);
	stmt.setString(idx++, mb_phone);
	stmt.setString(idx++, mb_birth);
	stmt.setString(idx++, mb_gender);
	//실행
	stmt.executeUpdate();
} catch (Exception e){
	e.getLocalizedMessage();
} finally {
	try {
		if(stmt != null) stmt.close(); //연결 해제
		if(conn != null) conn.close();
	} catch(Exception e){
		e.getLocalizedMessage();
	}
}

%>

<%
//로그인페이지로 이동.
response.sendRedirect("login.jsp");
%>