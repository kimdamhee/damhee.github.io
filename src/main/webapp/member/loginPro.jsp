<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean result = dao.loginCheck(id, pwd);
	
	if(result) {
		session.setAttribute("idKey", id);
%>
	<script>
		alert("Login Success!");
		location.href="member.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("Login fail..");
		location.href="login.jsp";
	</script>
<%
	}
%>









