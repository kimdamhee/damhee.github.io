<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = request.getParameter("userid"); %>
<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />
<%
	boolean result = dao.deleteMember(id);
	
	if(result) { 
%>
	<script>
		alert("회원을 삭제하였습니다.");
		location.href="admin-memberList.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원 삭제에 실패했습니다.");
		history.back(); 
	</script>
<%
	}
%>






