<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />
<%
	String id = request.getParameter("id");
	boolean result = dao.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;500&family=Orbitron:wght@400;600;900&display=swap');
	html, body {overflow:hidden;}
	body {font-family: 'Noto Sans KR', sans-serif;}
	.idc-container {text-align:center;}
	.h2 {text-align:center;}
	.btn {margin:0 5px; padding:0 20px; height:40px; line-height:40px; text-align:center; border-radius:20px; cursor:pointer; transition:all 0.4s ease;}
.btn-orange {border:1px solid rgb(252,160,73);}
.btn-orange:hover {color:#fff; background:rgba(252,160,73,0.7);}
</style>
</head>
<body>
	<div class="idc-container">
		<h2>아이디 중복 확인</h2>
		<p>입력한 아이디는 <strong><%=id %></strong>입니다.</p>
		<p>
<%
	if(result) out.println("아이디가 중복되어 입력한 아이디는 사용할 수 없습니다.");
	else out.println("입력한 아이디를 사용할 수 있습니다.");
%>
		</p>
		<button onClick="self.close()" class="btn btn-orange">닫기</button>
	</div>
</body>
</html>





