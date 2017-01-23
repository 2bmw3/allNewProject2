<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Log-in</title>

<link rel='stylesheet' href='http://codepen.io/assets/libs/fullpage/jquery-ui.css'>

<link rel="stylesheet" href="/resources/admin/login/css/style.css"
	media="screen" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>

	<div class="login-card">
		<h1>Log-in</h1>
		<br>

		<form action="login" method="post">
			<input type="text" name="username" placeholder="ID"> 
			<input type="password" name="password" placeholder="Password">
			<div class="checks">
				<input type="checkbox" id="ex_chk" name="remember-me"> <label
					for="ex_chk">Remember Me</label>
			</div>
			<br> <input type="submit" name="login"
				class="login login-submit" value="login">
		</form>
		<div class="login-help">
			<b>Not a member?</b> Sign up now <a href="register"><i
				class="fa fa-arrow-right"></i></a>
		</div>
	</div>

	<!-- <div id="error"><img src="https://dl.dropboxusercontent.com/u/23299152/Delete-icon.png" /> Your caps-lock is on.</div> -->

	<script
		src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>

</body>

</html>