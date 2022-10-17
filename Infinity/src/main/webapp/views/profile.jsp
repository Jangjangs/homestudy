<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%=session.getAttribute("sess_id") %> --%>
<%
//프로파일에 아이디에 맞는 이름 출력
String mb_name = "";
//JDBC프로그래밍
String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user="root";
String password="bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM big_member WHERE mb_id = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, (String)session.getAttribute("sess_id"));
	rs = stmt.executeQuery(); //ResultSet 값 리턴 
	
	if(rs.next()){
		mb_name = rs.getString("mb_name");
		
	} else{
		response.sendRedirect("login.jsp");
	}
} catch (Exception e){
	
}finally{
	try{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}catch(Exception e){
		
	}
}

%>
<%@ include file="includes/header.jsp" %>

<div class="wrap">
  <div class="profile-header">
	<div class="profile-cover">
		<div class="cover-user m-b-lg">
			<div>
				<span class="cover-icon"><i class="fa fa-heart-o"></i></span>
			</div>
			<div>
				<div class="avatar avatar-xl avatar-circle">
					<a href="javascript:void(0)">
						<img class="img-responsive" src="../assets/images/221.jpg" alt="avatar"/>
					</a>
				</div><!-- .avatar -->
			</div>
			<div>
				<span class="cover-icon"><i class="fa fa-envelope-o"></i></span>
			</div>
		</div>
		<div class="text-center">
			<h4 class="profile-info-name m-b-lg"><a href="javascript:void(0)" class="title-color"><%=mb_name %></a></h4>
			<div>
				<a href="javascript:void(0)" class="m-r-xl theme-color"><i class="fa fa-bolt m-r-xs"></i> Web Developer</a>
				<a href="javascript:void(0)" class="theme-color"><i class="fa fa-map-marker m-r-xs"></i>Cairo, Egypt</a>
			</div>
		</div>
	</div><!-- .profile-cover -->

	<div class="promo-footer">
		<div class="row no-gutter">
			<div class="col-sm-2 col-sm-offset-3 col-xs-6 promo-tab">
				<div class="text-center">
					<small>Experience</small>
					<h4 class="m-0 m-t-xs">+2 years</h4>
				</div>
			</div>
			<div class="col-sm-2 col-xs-6 promo-tab">
				<div class="text-center">
					<small>Hourly Rate</small>
					<h4 class="m-0 m-t-xs">12$ - 25$</h4>
				</div>
			</div>
			<div class="col-sm-2 col-xs-12 promo-tab">
				<div class="text-center">
					<small>Reviews</small>
					<div class="m-t-xs">
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star"></i>
						<i class="text-primary fa fa-star-o"></i>
					</div>
				</div>
			</div>
		</div>
	</div><!-- .promo-footer -->
</div><!-- .profile-header -->

</div>



<%@ include file="includes/footer.jsp" %>