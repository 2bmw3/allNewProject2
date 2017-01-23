<!-- footer -->
<footer id="aa-footer">
	<!-- footer bottom -->
	<div class="aa-footer-top">
		<div class="container">
			<div class="aa-footer-top-area" >
				<div class="aa-footer-widget">
					<address>
						<p style='float:left; padding-right: 2em;'>Contact Us</p>
						<p style='float:left; padding-right: 2em;'>
							<span class="fa fa-phone"></span>010-1234-5678
						</p>
						<p style='float:left; padding-right: 2em;'>
							<span class="fa fa-envelope"></span>won-piece@gmail.com
						</p>
					</address>
					
				</div>
				<div class="aa-footer-widget"  style='float:right;'>
					<div class="aa-footer-social">
							<a href="#"><span class="fa fa-facebook"></span></a> 
							<a href="#"><span class="fa fa-twitter"></span></a> 
							<a href="#"><span class="fa fa-google-plus"></span>
							</a> <a href="#"><span class="fa fa-youtube"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- footer-bottom -->
	<div class="aa-footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="aa-footer-bottom-area">
						<p style='float:right;'>
							Copyright (C) MarkUps.io
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- / footer -->

<!-- Login Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4>Login or Register</h4>
				<form class="aa-login-form" action="">
					<label for="">Username or Email address<span>*</span></label> <input
						type="text" placeholder="Username or email"> <label for="">Password<span>*</span></label>
					<input type="password" placeholder="Password">
					<button class="aa-browse-btn" type="submit">Login</button>
					<label for="rememberme" class="rememberme"><input
						type="checkbox" id="rememberme"> Remember me </label>
					<p class="aa-lost-password">
						<a href="#">Lost your password?</a>
					</p>
					<div class="aa-register-now">
						Don't have an account?<a href="account.jsp">Register now!</a>
					</div>
				</form>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

 
<!-- 새로 추가한 것들 -->
<script src="/resources/member/js/rate.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>
<!-- 구                 분 -->
<!-- <!-- jQuery library --> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- <!-- Include all compiled plugins (below), or include individual files as needed --> -->
<!-- <script src="/resources/themes/thema1/js/bootstrap.js"></script> -->
<!-- SmartMenus jQuery plugin -->
<script type="text/javascript"
	src="/resources/themes/thema1/js/jquery.smartmenus.js"></script>
<!-- SmartMenus jQuery Bootstrap Addon -->
<script type="text/javascript"
	src="/resources/themes/thema1/js/jquery.smartmenus.bootstrap.js"></script>
<!-- Product view slider -->
<script type="text/javascript"
	src="/resources/themes/thema1/js/jquery.simpleGallery.js"></script>
<script type="text/javascript"
	src="/resources/themes/thema1/js/jquery.simpleLens.js"></script>
<!-- slick slider -->
<script type="text/javascript"
	src="/resources/themes/thema1/js/slick.js"></script>
<!-- Price picker slider -->
<script type="text/javascript"
	src="/resources/themes/thema1/js/nouislider.js"></script>
<!-- Custom js -->
<script src="/resources/themes/thema1/js/custom.js"></script>
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet" />
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>

<script>	
	$(".pagination").on("click", "li", function(event) {
	    event.preventDefault();
	    $("#pageInput").val($(this).val());
	    $("#pageNumForm").submit();
	 });


</script>

