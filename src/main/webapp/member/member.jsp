<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="pf-container">
		<h4>Welcome to Beaute</h4>
	
	
<%
	if(id != null) {
%>
		<div class="mb-container login-container">
			<p class="mbtxt"><strong><%=id %></strong>님 환영합니다.</p>
			<div class="flex">
				<a href="logout.jsp" class="btn btn-orange">로그아웃</a>
				<a href="mypage.jsp" class="btn btn-blue">나의 정보</a>
<%
		if(id.equals("admin")) {
%>
				<a href="admin-memberList.jsp" class="btn btn-white">회원 목록</a>
<%
		}
%>
			</div>
		</div>
<%
	}else{
%>
	<script>
		alert("로그인에 실패했습니다.");
		location.href="login.jsp";
	</script>
<%
	}
%>

	</div>

<jsp:include page="../include/footer.jsp" flush="false" />



