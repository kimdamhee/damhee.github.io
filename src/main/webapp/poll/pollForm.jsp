<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.beaute.poll.*" %>

<jsp:useBean id="pdao" class="com.beaute.poll.PollDAO" />
<jsp:useBean id="pvo" class="com.beaute.poll.PollListVO" />
<jsp:useBean id="ivo" class="com.beaute.poll.PollItemVO" />
    
<%
	String id = (String) session.getAttribute("idKey");

	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	pvo = pdao.getPoll(num);
	Vector<String> vlist = pdao.getItem(num);
	
	String question = pvo.getQuestion();
	int type = pvo.getType();
	int active = pvo.getActive();
%>

<form action="pollFormPro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num %>">
	<table class="pf-insert">
		<tr>
			<td>Question</td>
			<td><%=question %></td>
		</tr>
		<tr>
			<td colspan="2" class="pf-item">
<%
	if(vlist.isEmpty()) {
%>
				아이템 항목이 없습니다.
<%		
	}else{
		for(int i=0; i<vlist.size(); i++) {
			String item = vlist.get(i);
			if(type == 1) {
				out.println("<input type='checkbox' name='itemnum' value='"+i+"'>");
			}else{
				out.println("<input type='radio' name='itemnum' value='"+i+"'>");
			}
			out.println("&nbsp;"+item+"&nbsp;&nbsp;");
		}
	}
%>		
			</td>
		</tr>
	</table>
	
	<div class="flex">
<%
	if(id != null) {
%>
		<input type="submit" value="투표제출" class="btn btn-pink">
		<button onClick="javascript:window.open('pollView.jsp?num=<%=num %>', 'PollView', 'width=450, height=420')" class="btn btn-orange">투표결과</button>
<%
	}
%>
	</div>
</form>







