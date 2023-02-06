<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="pf-container">
		<h4>Beaute Login</h4>
	

		<div class="mb-container login-container">
			<form name="loginFrm" action="loginPro.jsp" method="post">
				<ul>
					<li><input type="text" name="id" placeholder="아이디 입력" autofocus required class="form-control"></li>
					<li><input type="password" name="pwd" placeholder="비밀번호 입력" required class="form-control"></li>
				</ul>
				<div class="flex">
					<input type="submit" value="로그인" class="btn btn-pink">
					<input type="reset" onClick="swal('내용이 초기화됩니다.')" value="다시쓰기" class="btn btn-blue">
					<a href="memberForm.jsp" class="btn btn-orange">회원가입</a>
				</div>
			</form>
		</div>
	</div>

<jsp:include page="../include/footer.jsp" flush="false" />








