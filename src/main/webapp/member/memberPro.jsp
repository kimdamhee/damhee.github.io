<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="vo" class="com.beaute.member.MemberVO" />
<jsp:setProperty name="vo" property="*" />
<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />

<%
	boolean result = dao.insertMember(vo);
	
	if(result) {
%>
	<script>
		alert("Join Success!");
		location.href="login.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("Join Fail..");
		history.back();
	</script>
<%
	}
%>















