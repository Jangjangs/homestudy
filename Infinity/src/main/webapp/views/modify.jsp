
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
    String user = "root";
    String password = "bigdata";
    
    StringBuffer qry = new StringBuffer();
    qry.append(" SELECT * FROM big_board WHERE bo_num = ?  ");
    String sql = qry.toString();
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    HashMap<String, String> view = new HashMap<>();
    
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url, user, password);
    	
    	stmt = conn.prepareStatement(sql);
    	stmt.setInt(1, Integer.parseInt(request.getParameter("bo_num")));
    	
    	rs = stmt.executeQuery();
    	
    	if(rs.next()){
    		view.put("bo_num", rs.getString("bo_num"));
    		view.put("bo_category", rs.getString("bo_category"));
    		view.put("bo_title", rs.getString("bo_title"));
    		view.put("bo_content", rs.getString("bo_content"));
    		view.put("bo_mb_id", rs.getString("bo_mb_id"));
    		view.put("bo_mb_name", rs.getString("bo_mb_name"));
    		view.put("bo_hit", rs.getString("bo_hit"));
    		view.put("bo_inputdate", rs.getString("bo_inputdate"));
    		view.put("bo_ip", rs.getString("bo_ip"));
    	}
    	
    }catch(Exception e){
    	
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
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">글수정</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							<!-- 설명 -->
							</small>
						</div>
						<form method= "post" class="form-horizontal" action="modifyAct.jsp">
						<!-- 없는 타입을 쓰면 텍스트로 출력됨  hiddena-->
						<input id="bo_num" type="hidden" name="bo_num" value="<%=view.get("bo_num") %>">
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">카테고리:</label>
								<div class="col-sm-9">
									<select id="bo_category" name="bo_category" class="form-control">
										<option value="html" <%="html".equals(view.get("bo_category"))?"selected":"" %>>HTML</option>
										<option value="css" <%="css".equals(view.get("bo_category"))?"selected":"" %> >CSS</option>
										<option value="js" <%="js".equals(view.get("bo_category"))?"selected":"" %>>JS</option>
								</select>
							</div>
							</div>
							<div class="form-group">
								<label for="exampleTextInput1" class="col-sm-3 control-label">제목:</label>
								<div class="col-sm-9">
									<input id="bo_title" type="text" name="bo_title" class="form-control" id="exampleTextInput1" value="<%=view.get("bo_title") %>" placeholder="제목을 입력하세요">
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">내용:</label>
								<div class="col-sm-9">
									<textarea id="bo_content" class="form-control" name="bo_content" id="textarea1" placeholder="내용을 입력하세요..."><%=view.get("bo_content") %></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-4 col-sm-offset-8">
									<button type="submit" class="btn btn-success">글수정</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

<script>
	$(document).ready(function(){
		$('button[type=submit]').on('click',function(e){
			e.preventDefault();
			
			let bo_num = $('#bo_num').val();
			let bo_category = $('#bo_category').val();
			let bo_title = $('#bo_title').val().trim();
			let bo_content = $('#bo_content').val().trim();
			
			if(bo_title == ''){
				alert("제목을 입력해주세요.");
				$('#bo_title').css("border","1px solid red");
				$('#bo_title').focus();
			} else if(bo_content == ''){
				console.log(bo_content);
				alert("내용을 입력해주세요.");
				$('#bo_content').css("border","1px solid red");
				$('#bo_content').focus();
			} else{
				$(this).hide();
				
				$.ajax({
		            type : "POST",            // HTTP method type(GET, POST) 형식이다.
		            url : "../ajax/ajax.modifyAct.jsp",      // 컨트롤러에서 대기중인 URL 주소이다.
		            data : {bo_category:bo_category,
		            	bo_title:bo_title,
		            	bo_content:bo_content,
		            	bo_num:bo_num},            // Json 형식의 데이터이다.
		    			
		            success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		                // 응답코드 > 0000
		                if(res == 'Success'){
		                	location.href="list.jsp"
		                } else{
		                	$(this).prop("disabled", false);
		                	alert("글 수정 실패");
		                }
		               //console.log("["+res+"]");
		            },
		            error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		                console.log("통신 실패.")
		            }
		        });
			}
			
		});
	});
</script>
    <%@ include file="includes/footer.jsp" %>