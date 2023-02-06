<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="pdao" class="com.beaute.poll.PollDAO" />

<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String[] itemnum = request.getParameterValues("itemnum");
	String msg = null;
	
	boolean flag = pdao.updatePoll(num, itemnum);
	if(flag) msg = "투표가 정상적으로 등록되었습니다.";
	else msg = "투표 등록에 실패했습니다.";
%>
<script>
	alert("<%=msg %>");
	location.href="poll.jsp?num=<%=num%>";
</script>








