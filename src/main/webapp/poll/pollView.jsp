<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.beaute.poll.PollItemVO" %>
<%@ page import="com.beaute.poll.PollListVO" %>
    
<jsp:useBean id="pdao" class="com.beaute.poll.PollDAO" />

<%
	request.setCharacterEncoding("utf-8");
	int number = 0;
	if(request.getParameter("num") != null) number = Integer.parseInt(request.getParameter("num"));
	
	int total = pdao.getPollCount(number);
	Vector<PollItemVO> itemList = pdao.getViewList(number);
	PollListVO pvo = pdao.getPoll(number);
	String question = pvo.getQuestion();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub-style.css">
<style>
	td {color:#f2f2f2;}
</style>
</head>
<body>
	<table class="pv-question">
		<tr>
			<td>총투표수</td>
			<td><%=total %></td>
		</tr>
		<tr>
			<td>투표질문</td>
			<td><%=question %></td>
		</tr>
	</table>
	<table class="pv-item">
		<tr>
			<td>번호</td>
			<td>투표 항목</td>
			<td></td>
			<td>투표수</td>
		</tr>
<%
	for(int i=0; i<itemList.size(); i++){
		PollItemVO ivo = itemList.get(i);
		String[] item = ivo.getItem(); //items 문자열 배열은 item을 여러 개 저장한다.
		int count = ivo.getCount();
		int ratio = new Double(Math.ceil((double) count / total * 100)).intValue();
%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=item[0] %></td>
			<td>
				<table width="<%=ratio %>%">
					<tr><td class="ratio"><%=ratio %>%</td></tr>
				</table>
			</td>
			<td><%=count %></td>
		</tr>
<%
	}
%>
	</table>
	<div class="flex"><a href="javascript:window.close()" class="btn btn-white">닫기</a></div>
</body>
</html>









