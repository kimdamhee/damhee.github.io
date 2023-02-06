<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.beaute.Qna.QnaVO" %>

<jsp:useBean id="dao" class="com.beaute.Qna.QnaDAO" />
<% Vector<QnaVO> qlist = dao.getQnaList(); %>

<jsp:include page="../include/header.jsp" flush="false" />
<script>
	$(document).ready(function(){		
		$('button#cdelete').on('click', function(){
			var num = $(this).val();
			alert('선택한 문의를 삭제합니다.');
			var url = 'contactDeletePro.jsp?num='+num;
			$(location).attr('href', url);
		});
		

		$('#search').keyup(function() {
			var value = $(this).val().toLowerCase();
			$('.search-row').filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
	});
</script>
	<div class="pf-container">
		<h4>Beaute Inquiry List</h4>
	
	
	<div class="src-container qtv-container">
	
		<input type="text" placeholder="검색어 입력" id="search" class="form-control search-box">
		
		<table class="table table-hover">
			<tr class="table-primary">
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th></th>
			</tr>
<%
	if(qlist.isEmpty()) {
%>
			<tr><td>문의 내역이 없습니다.</td></tr>
<%
	}else{
		for(int i=0; i<qlist.size(); i++) {
			QnaVO qvo = qlist.get(i);
			String num = qvo.getNum();
			String id = qvo.getId();
			String name = qvo.getName();
			String email = qvo.getEmail();
			String title = qvo.getTitle();
			String body = qvo.getBody();
			String wdate = qvo.getWdate();
%>

			<tr class="contact-row">
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=email %></td>
				<td><%=title %></td>
				<td class="cr-body"><%=body %></td>
				<td><%=wdate %></td>
				<td><button type="button" id="cdelete" class="btn btn-pink" value="<%=num %>">삭제</button></td>
			</tr>
<%
		} //for-end
	} //else-end
%>	
		</table>
	</div>
	</div>

<jsp:include page="../include/footer.jsp" flush="false" />









