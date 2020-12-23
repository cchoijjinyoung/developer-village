<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>로그인</title>
  <jsp:include page="../header.jsp"></jsp:include>

</head>
<body>
<div id="login">
	<form action='login' method='post'>
  <div style="text-align: center">
	 <img id="logo-nav" src="/developer-village/upload/devil.png" style="width: 120px;"/>
		<p style="margin-top: 30px; margin-bottom: 1rem; font-size: 28px; font-weight: bold;">
		로그인을 해주세요!</p>
		<p><span class="main-color">데빌</span>은 국내최대 개발자 커뮤니티입니다.</p>
		</div>
		  <div class="form-floating mb-3">
          <input type="email" class="form-control" id="floatingInput" name='email' placeholder="name@example.com">${user.email}
          <label for="floatingInput">Email address</label>
      </div>
      
    <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" name='password' placeholder="Password">${user.password}
        <label for="floatingPassword">Password</label>
    </div>
    <div class="form-check" style="margin-top: 30px;">
      <input class="form-check-input" type="checkbox" name='saveEmail' id="defaultCheck1">
      <label class="form-check-label" for="defaultCheck1" style="text-align: left;">
      이메일 저장
      </label>
		</div>
		<div class="d-grid gap-2">
     <button class="btn btn-primary" type="button">로그인</button>
    </div>
	</form>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
