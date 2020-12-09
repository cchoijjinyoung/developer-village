<%@page import="com.devil.domain.Tag"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글작성</title>

<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href='../style.css'>

  <style>
    .container {
      margin: 70px 0px 20px 240px;
      width: 800px;
    }
  </style>

</head>

<body>


	<jsp:include page="/header.jsp"></jsp:include>

	<h1>게시글 작성</h1>
	
<div class="container">
	<form action='add' method='post'>
		카테고리: <select class="form-select" aria-label="Default select example"
			name='categoryNo'>
			<option selected>카테고리 선택</option>
			<option value='1'>커뮤니티</option>
			<option value='2'>QnA</option>
			<option value='3'>채용공고</option>
			<option value='4'>스터디</option>
		</select>

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목 </label>
			<input type="email" class="form-control"
				id="exampleFormControlInput1" placeholder="name@example.com"
				name='title'>
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label"
				name='content'>내용 </label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="20"></textarea>
		</div>

		<p>
			태그: <br>

			<c:forEach items="${tags}" var="tag">
					<input class="form-check-input" type="checkbox" value="" ${tag.no}
						id="flexCheckDefault" name="tags"> <label
						class="form-check-label" for="flexCheckDefault">
						${tag.name} </label>
				<c:if test="${tag.no % 9== 0 }">
					<br>
				</c:if>
			</c:forEach>
		</p>

		<button class="btn btn-primary">게시글 작성</button>
		<button type='button' class='btn btn-danger'
			onclick="location.href='list'">취소</button>

	</form>
	
</div>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>