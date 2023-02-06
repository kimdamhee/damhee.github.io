<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="pf-container">
		<h4>Poll Insert</h4>
	
	
		<div class="mb-container idc-container">
			
			<form action="poll-insertPro.jsp" method="post">
				<table>
					<tr>
						<td>질문</td>
						<td><input type="text" name="question" required autofocus class="form-control"></td>
					</tr>
<%
					for(int i=1; i<=4; i++) {
						out.println("<tr><td>항목"+(i*2-1)+"</td><td><input type='text' name='item' class='form-control'></td></tr>");
						out.println("<tr><td>항목"+(i*2)+"</td><td><input type='text' name='item' class='form-control'></td></tr>");
					}
%>			
					</tr>
					<tr>
						<td>시작일</td>
						<td>
							<select name="sdateY" class="form-select">
								<option value="2022">2022 년
								<option value="2023">2023 년
							</select>
							<select name="sdateM" class="form-select">
<%
						for(int i=1; i<=12; i++) {
							out.println("<option value='"+i+"'>"+i+"월");
						}
%>
							</select>
							<select name="sdateD" class="form-select">
<%
						for(int i=1; i<=31; i++) {
							out.println("<option value='"+i+"'>"+i+"일");
						}
%>
							</select>
						</td>
					</tr>
					<tr>
						<td>종료일</td>
						<td>
							<select name="edateY" class="form-select">
								<option value="2022">2022 년
								<option value="2023">2023 년
							</select>
							<select name="edateM" class="form-select">
<%
						for(int i=1; i<=12; i++) {
							out.println("<option value='"+i+"'>"+i+"월");
						}
%>
							</select>
							<select name="edateD" class="form-select">
<%
						for(int i=1; i<=31; i++) {
							out.println("<option value='"+i+"'>"+i+"일");
						}
%>
							</select>
						</td>
					</tr>
					<tr>
						<td>이중 답변</td>
						<td>
							<input type="radio" name="type" value="1" checked> 예(yes) &nbsp;&nbsp;
							<input type="radio" name="type" value="0"> 아니요(no)
						</td>
					</tr>
				</table>
				
				<div class="flex">
					<input type="submit" value="작성하기" class="btn btn-pink">
					<input type="reset" value="다시쓰기" class="btn btn-blue">
					<a href="poll.jsp" class="btn btn-white">설문목록</a>
				</div>
			</form>
		</div>
	</div>

<jsp:include page="../include/footer.jsp" flush="false" />









