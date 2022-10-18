<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<%

//JDBC프로그래밍					   포트번호 DB이름
String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user="root";
String password="bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" UPDATE big_member SET mb_out = 'Y' WHERE mb_id = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
int res = 0;



try{
	Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버 로드
	conn = DriverManager.getConnection(url, user, password);
	
	stmt = conn.prepareStatement(sql);  //preparedstatement sql문은 여기드감

	stmt.setString(1, request.getParameter("mb_id"));
	
	res = stmt.executeUpdate();

} catch(Exception e) {
	
} finally{
	try{
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		
	}
}

if(res == 0){
	out.print("Fail");
} else{
	out.print("Success");
}

%>


