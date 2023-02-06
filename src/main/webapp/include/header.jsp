<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<% String id = (String) session.getAttribute("idKey"); %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Beaute</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/sub-style.css">
  <link rel="stylesheet" href="../css/main.css">
  <link rel="stylesheet" href="../css/manpf.css">
  <link rel="stylesheet" href="../css/womanpf.css">
  <link rel="stylesheet" href="../css/contact.css">
  <script src="../js/jquery-2.1.1.min.js"></script>
  <script src="../js/mb-script.js"></script>
  <script src="../js/custom.js"></script> 
  <script src="../js/sub-custom.js"></script>
  <script src="../js/ma-con-box.js"></script>
  <script src="../js/wo-con-box.js"></script>
</head>
<body>
  <header>
    <nav>
      <h1>
        <a href="../view/index.jsp">Beaute</a>
      </h1>

      <a href="#" id="trigger">
        <span></span>
        <span></span>
        <span></span>
      </a>

      <ul id="main-menu">
      	<div class="mn-line"></div>
        <div class="top-menu mb">
<%
		if(id != null) {
%>
            		<p><strong><%=id %></strong>��</p>
                <a href="../member/logout.jsp">�α׾ƿ�</a>
                <a href="../member/mypage.jsp">����������</a>
<%
			if(id.equals("admin")) {
%>
				<a href="../member/admin-memberList.jsp">ȸ�����</a>
<%
			}
		}else{
%>
                <a href="../member/login.jsp">�α���</a>
                <a href="../member/memberForm.jsp">ȸ������</a>
<%
		}
%>
        </div>
        <li>
          <p class="mn-title">woman</p>
          <ul class="sub-menu">
              <li><a href="../view/womanpf.jsp">perfume</a></li>
              <li><a href="../view/womanco.jsp">cosmetic</a></li>
          </ul>
        </li>
        <li>
          <p class="mn-title">man</p>
          <ul class="sub-menu">
              <li><a href="../view/manpf.jsp">perfume</a></li>
              <li><a href="../view/manco.jsp">cosmetic</a></li>
          </ul>
        </li>
        <li>
        	<a href="../view/contact.jsp">contact</a></li>
        <li>
          <p class="mn-title">community</p>
          <ul class="sub-menu">
            <li>
                <li><a href="../poll/poll.jsp">��ǥ</a></li>
                
<% if (id != null) {
%>
                <li><button onClick="contactGo()">1:1 ����</button></li>
                
<%  if (id.equals("admin")) {%>
                <li><a href="../view/contactView.jsp">1:1 ���ǳ���</a></li>
<% 	} %>
<% } %>
        </ul>
      </ul>
      <ul class="top-menu dt">
<%
		if(id != null) {
%>
            		<li><strong><%=id %></strong>��</li>
                <li><a href="../member/logout.jsp">�α׾ƿ�</a></li>
                <li><a href="../member/mypage.jsp">����������</a></li>
<%
			if(id.equals("admin")) {
%>
				<li><a href="../member/admin-memberList.jsp">ȸ�����</a></li>
<%
			}
		}else{
%>
                <li><a href="../member/login.jsp">�α���</a></li>
                <li><a href="../member/memberForm.jsp">ȸ������</a></li>
<%
		}
%>
      </ul>
    </nav>
  </header>