<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="com.beaute.member.MemberVO" />
<jsp:setProperty name="vo" property="*" />
<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />

<%
	boolean result = dao.updateMember(vo);
	
	if(result) {
%>
	<script>
		alert("회원 정보 수정 완료!");
		location.href="mypage.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원 정보 수정 실패..");
		history.back();
	</script>
<%
	}
%>





