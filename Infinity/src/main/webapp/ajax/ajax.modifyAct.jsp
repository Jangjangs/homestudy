<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");



 String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
 String user="root";
 String password="bigdata";

 StringBuffer qry = new StringBuffer();
 qry.append(" UPDATE big_board SET bo_category = ?, bo_title = ?, bo_content = ? ");
 qry.append(" WHERE bo_num = ? ");
 String sql = qry.toString();

 Connection conn = null;
 PreparedStatement stmt = null;
 
 String ajaxMessage = null;
 
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 conn = DriverManager.getConnection(url, user, password);
	 
	 stmt = conn.prepareStatement(sql);
	 stmt.setString(1, request.getParameter("bo_category"));
	 stmt.setString(2, request.getParameter("bo_title"));
	 stmt.setString(3, request.getParameter("bo_content"));
	 stmt.setInt(4, Integer.parseInt(request.getParameter("bo_num")));

	 int res = stmt.executeUpdate();
	 
	 if(res != 0){
		 ajaxMessage="Success";
	 }
 } catch(Exception e){
	 
 } finally{
	 try{
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			
		}
 }
 
 out.print(ajaxMessage);
%>

