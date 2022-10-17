<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String sess_id= (String) session.getAttribute("sess_id");
//if(sess_id == null || sess_id.equals(""))x
//로그인 했을 때 dashboard.jsp로 이동
if(!(sess_id == null || "".equals(sess_id))){
	response.sendRedirect("dashboard.jsp");
}
%>

<%@ include file="includes/loginHeader.jsp" %>

		<div class="simple-page-form animated flipInY" id="login-form">
	<h4 class="form-title m-b-xl text-center">Sign In With Your Infinity Account</h4>
	<form method="post" action="loginAct.jsp">
		<div class="form-group">
			<input id="sign-in-id" type="text" name="mb_id" class="form-control" placeholder="아이디">
		</div>

		<div class="form-group">
			<input id="sign-in-password" type="password" name="mb_pw" class="form-control" placeholder="비밀번호">
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input type="checkbox" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">Keep me signed in</label>
			</div>
		</div>
		<input type="submit" class="btn btn-primary" value="SING IN">
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p><a href="password-forget.jsp">FORGOT YOUR PASSWORD ?</a></p>
	<p>
		<small>Don't have an account ?</small>
		<a href="signup.jsp">CREATE AN ACCOUNT</a>
	</p>
</div><!-- .simple-page-footer -->

<%@ include file="includes/loginFooter.jsp" %>