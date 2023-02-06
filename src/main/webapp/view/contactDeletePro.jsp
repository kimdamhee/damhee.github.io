<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String num = request.getParameter("num"); %>
<jsp:useBean id="dao" class="com.beaute.Qna.QnaDAO" />
<%
	boolean result = dao.deleteQna(num);
	
	if(result) {
%>
	<script>
		alert("문의를 삭제하였습니다.");
		location.href="contactView.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("문의 삭제에 실패했습니다.");
		history.back();
	</script>
<%
	}
%>






