<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="vo" class="com.beaute.member.MemberVO" />
<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />

<% String id = (String) session.getAttribute("idKey"); %>
<% vo = dao.getMyInfo(id); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 inquiry</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/sub-style.css">
<script src="../js/jquery-2.1.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#contentText').keyup(function (e){
	    var content = $(this).val();       
	    $('#counter').val(200-content.length);

	    if(content.length > 200) {
	    $(this).val($(this).val().substring(0, 200));
	    }
	    });
})

</script>
</head>
<body>
	<div class="idc-container">
		<h5>문의 내용 입력</h5>
		<form name="contactFrm" action="contactGoPro.jsp" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" class="form-control" value="<%=id %>" readonly required></td>
				<tr>
					<td>성함</td>
					<td><input type="text" name="name" value="<%=vo.getName() %>" class="form-control" readonly required></td>
				</tr>
				<tr>
					<td>회신 이메일</td>
					<td><input type="email" name="email" value="<%=vo.getEmail() %>" class="form-control" required></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" placeholder="문의하실 내용의 제목을 적어주세요." autofocus required></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea id="contentText" rows="5" name="body" placeholder="문의하실 내용을 200자 이내로 적어주세요."></textarea>
					<br>
					<span class="txsub">남은글자수 : <input type="text" readonly value="200" name="counter" id="counter"></span></td>
				</tr>
			</table>
			<div class="flex">
				<button type="submit" class="btn btn-blue">문의하기</button>
				<input type="reset" value="다시쓰기" class="btn btn-orange">
			</div>
		</form>
	</div>
</body>
</html>





