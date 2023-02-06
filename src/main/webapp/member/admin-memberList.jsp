<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.beaute.member.MemberVO" %>

<jsp:useBean id="dao" class="com.beaute.member.MemberDAO" />
<% Vector<MemberVO> mlist = dao.getMemberList(); %>

<jsp:include page="../include/header.jsp" flush="false" />
<script>
	$(document).ready(function(){
		$('button#userid').on('click', function(){
			var id = $(this).val();
			alert(id+'님을 선택했습니다.');
			var url = 'admin-update.jsp?userid='+id;
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
	<div class="sub-container">
		<h4>Beaute Member List</h4>
	
	
	<div class="src-container">
	
		<input type="text" placeholder="검색어 입력" id="search" class="form-control search-box">
		
		<div class="mbl-container">
<%
	if(mlist.isEmpty()) {
%>
			<ul><li>회원 목록이 없습니다.</li></ul>
<%
	}else{
		for(int i=0; i<mlist.size(); i++) {
			MemberVO mvo = mlist.get(i);
			String id = mvo.getId();
			String name = mvo.getName();
			String birth = mvo.getBirth();
			String email = mvo.getEmail();
			String zipcode = mvo.getZipcode();
			String addr = mvo.getAddr();
			String job = mvo.getJob();
%>

			
			<ul class="search-row">
				<h6>[ <%=name %> ] 회원</h6>
				<li><span class="mbtt">아이디</span><span class="mbif"><button type="button" id="userid" value="<%=id %>" class="btn btn-pink" ><%=id %></button></span></li>
				
<%
	String gender = null;
	if(mvo.getGender().equals("1")) {
		gender = "남자";
	}else{
		gender = "여자";
	}
%>
				<li><span class="mbtt">성별</span><span class="mbif"><%=gender %></span></li>
				<li><span class="mbtt">생일</span><span class="mbif"><%=birth %></span></li>
				<li><span class="mbtt">이메일</span><span class="mbif"><%=email %></span></li>
				<li><span class="mbtt">우편번호</span><span class="mbif"><%=zipcode %></span></li>
				<li><span class="mbtt">주소</span><span class="mbif"><%=addr %></span></li>
				<li><span class="mbtt">취미</span><span class="mbif">
<%
	String[] hb = mvo.getHobby();
	String[] lists = {"인터넷","여행","게임","영화","운동"};

	for(int j=0; j<hb.length; j++) {
		if(hb[j].equals("1")) {
			String hobby = lists[j];
%>
					<%=hobby %>
<%
		}
	}
%>
					</span>
				</li>
				<li><span class="mbtt">직업</span><span class="mbif"><%=job %></span></li>
			</ul>
<%
		} //for-end
	} //else-end
%>	
		</div>
	</div>
	</div>

<jsp:include page="../include/footer.jsp" flush="false" />









