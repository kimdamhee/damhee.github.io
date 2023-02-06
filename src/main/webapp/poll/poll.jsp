<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.beaute.poll.PollListVO" %>

<jsp:useBean id="pdao" class="com.beaute.poll.PollDAO" />

<%
	String id = (String) session.getAttribute("idKey");
	Vector<PollListVO> plist = pdao.getPollList();
%>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="pf-container">
		<h4>Poll Board</h4>
	
	
		<div class="poll-container pl-container">
			<h5>Poll</h5>
			<jsp:include page="pollForm.jsp" flush="false" />
		
			<h5 class="pl-list">Poll List</h5>
			<table class="pl-quest">
				<tr>
					<th>Question</th>
					<th>start ~ end<th>
				</tr>
<%
	if(plist.isEmpty()) {
%>
			<tr><td align="center" colspan="2">등록된 투표 목록이 없습니다.</td></tr>
<%
	}else{
		for(int i=0; i<plist.size(); i++) {
			PollListVO pvo = plist.get(i);
			int num = pvo.getNum();
			String question = pvo.getQuestion();
			String sdate = pvo.getSdate();
			String edate = pvo.getEdate();
			int active = pvo.getActive();
			
			if(active == 1) {
				out.println("<tr><td><a href='poll.jsp?num="+num+"'>"+question+"</a></td>");
				out.println("<td>"+sdate+" ~ "+edate+"</td></tr>");
			}
		}
	}
%>
			</table>

			<div class="flex">
<%
		if(id != null) {
			if(id.equals("admin")) {
%>
			<a href="poll-insert.jsp" class="btn btn-blue">투표작성</a>
<%
			}
		}
%>
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp" flush="false" />