<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String keyword = request.getParameter("keyword");

//회원목록 DB에서 불러오기

//JDBC프로그래밍					   
String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user="root";
String password="bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM big_member WHERE mb_out !='N' ");
if(!(keyword == null || "".equals(keyword))){
	qry.append(" AND ( mb_name LIKE ? OR mb_email LIKE ? OR mb_phone LIKE ? OR mb_birth LIKE ?) ");
}
qry.append(" ORDER BY mb_joindate DESC ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

List<HashMap<String, String>> list = new ArrayList<>();

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	
	stmt = conn.prepareStatement(sql);
	
	if(!(keyword == null || !"".equals(keyword))){ //
		stmt.setString(1, "%"+keyword+"%"); //
		stmt.setString(2, "%"+keyword+"%");
		stmt.setString(3, "%"+keyword+"%");
		stmt.setString(4, "%"+keyword+"%");
		
	}
	
	rs = stmt.executeQuery(); //쿼리문 실행
	
	while(rs.next()){
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("mb_id", rs.getString("mb_id"));
		hm.put("mb_name", rs.getString("mb_name"));
		hm.put("mb_email", rs.getString("mb_email"));
		hm.put("mb_phone", rs.getString("mb_phone"));
		hm.put("mb_birth", rs.getString("mb_birth"));
		hm.put("mb_gender", rs.getString("mb_gender"));
		hm.put("mb_joindate", rs.getString("mb_joindate"));
		
		list.add(hm);
	}
}catch(Exception e){
	
}finally{ //오류가 나도 반드시 실행
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
	<section class="app-content">
		<div class="row">
			<div class="col-md-12">
				<h4 class="m-b-lg">탈퇴회원관리</h4>
			</div><!-- END column -->

			<div class="col-md-12">
				<div class="widget p-lg">
					<h4 class="m-b-lg">탈퇴회원 목록</h4>
					<p class="m-b-lg docs">
						탈퇴된 회원목록입니다. 1년간 로그인이 없을 시 탈퇴회원 또는 휴면계정으로 변환하셔야합니다.
					</p>
					<form>
						<div style="text-align:right; margin-bottom:1rem;">
							<input type= "text" name="keyword"><button>검색</button>
						</div>
					</form>
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th>#순번</th>
								<th>아이디</th>
								<th>회원 이름</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>가입 일자</th>
							</tr>
<%
int num = 1;

	Iterator<HashMap<String, String>> it = list.iterator();
	while(it.hasNext()){
		HashMap<String, String> data = it.next();
	
%>
							<tr>
								<td><%=num++ %></td>
								<td><%=data.get("mb_id") %></td>
								<td><%=data.get("mb_name") %></td>
								<td><%=data.get("mb_email") %></td>
								<td><%=data.get("mb_phone") %></td>
								<td><%=data.get("mb_birth") %></td>
								<td><%=data.get("mb_gender") %></td>
								<td><%=data.get("mb_joindate") %></td>
							</tr>
<%
	}						
	
	if(num == 1){
		
	
%>
							<tr>
								<td colspan="8">탈퇴된 회원이 없습니다.</td>
							</tr>
		
<%
	}
%>					
						</table>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
 <%@ include file="includes/footer.jsp" %>