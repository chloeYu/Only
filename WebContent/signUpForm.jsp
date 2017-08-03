<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/signUp.css">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="js/signUp.js"></script>
<script type="text/javascript">
	function chk() {
		inputLogin = eval("document.loginForm");
		if(!inputLogin.member_id.value){
			alert("아이디를 입력하세요");
			inputLogin.member_id.focus();
			return false;
		}
		if(!inputLogin.password.value){
			alert("비밀번호를 입력하세요");
			inputLogin.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="signUpContain">
		<!-- 로그인 폼 시작 -->
		<div class="login-signup l-attop" id="login">
			<div class="login-signup-title">LOG IN</div>
			<div class="login-signup-content">
				<div class="input-name">
					<h2>ID</h2>
				</div>
				<form action="login.jsp" name="loginForm" method="post"
					onsubmit="return chk()">
					<input type="text" name="member_id" value="" class="field-input" />
					<div class="input-name input-margin">
						<h2>Password</h2>
					</div>
					<input type="password" name="password" value="" class="field-input" />
					<div class="input-r">
						<div class="check-input">
							<input type="checkbox" id="remember-me-2" name="rememberme"
								value="" class="checkme"> <label class="remmeberme-blue"
								for="remember-me-2"></label>
						</div>
						<div class="rememberme">
							<label for="remember-me-2">Remember Me</label>
						</div>
					</div>
					<button class="submit-btn">Enter</button>
				</form>
				<button type="submit" class="submit-btn" id="signup-btn">SignUp</button>
				<div class="forgot-pass">
					<a href="#">Forgot Password?</a>
				</div>
			</div>
		</div>
		<!-- 로그인 폼 끝 -->
		<!-- 회원가입 폼 시작 -->
		<div class="login-signup s-atbottom" id="signup">
			<div class="login-signup-title">SIGN UP</div>
			<div class="login-signup-content">
				<form action="signUp.jsp" method="post">
					<div class="input-name">
						<h2>ID</h2>
					</div>
					<input type="text" name="member_id" value="" class="field-input" />
					<div class="input-name input-margin">
						<h2>Password</h2>
					</div>
					<input type="password" name="password" value="" class="field-input" />
					<div class="input-name input-margin">
						<h2>Nickname</h2>
					</div>
					<input type="text" name="nickname" value="" class="field-input" />
					<div class="input-name input-margin">
						<h2>E-Mail</h2>
					</div>
					<input type="email" name="email" value="" class="field-input" />
					<button class="submit-btn">Enter</button>
				</form>
				<button class="submit-btn" id="login-btn">Login</button>
			</div>
		</div>
		<!-- 회원가입 폼 끝 -->
	</div>
</body>
</html>