<%@page import="com.devil.domain.Badge"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뱃지 조회</title>
<link rel="stylesheet" type="text/css" href='../style.css'>
</head>
<body>
<h1>뱃지 조회</h1>

<%Badge badge = (Badge) request.getAttribute("badge");
if (badge == null) {
  response.setHeader("Refresh", "2;url=list");%>
  <p>해당 번호의 뱃지가 없습니다.</p>
<% 
} else {
%>

<form action='updatePhoto' method='post' enctype='multipart/form-data'>
<input type='text' name='no' value='<%=badge.getNo()%>' readonly style='display:hidden;'><br>
<img src='../upload/badge/<%=badge.getPhoto()%>' alt='[<%=badge.getPhoto()%>]'>
<input type='file' name='photo'><br>
<button>이미지 변경</button>
</form>
<form action='update' method='post'>
<p>이름 : <%=badge.getName()%></p>
<textarea name='content'><%=badge.getContent()%></textarea><br>
<button>뱃지 수정</button>
</form>
<p><a href='list' style='color:white;'>뱃지 목록으로</a></p>
<button type='button'onclick="location.href='delete?no=<%=badge.getNo()%>'">뱃지 삭제</button>
<%}%>
</body>
</html>