<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="com.beaute.Qna.QnaVO" />
<jsp:setProperty name="vo" property="*" />
<jsp:useBean id="dao" class="com.beaute.Qna.QnaDAO" />

<%
	boolean result = dao.insertQna(vo);
	
	if(result) {
%>
	<script>
		alert("문의 접수 완료!");
		history.back();
	</script>
<%
	}else{
%>
	<script>
		alert("문의 접수 실패..");
		history.back();
	</script>
<%
	}
%>















