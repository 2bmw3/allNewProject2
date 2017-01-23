<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member all shopping mall list</title>

<!-- Behavioral Meta Data -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="icon" type="image/png"
	href="/resources/member/allList/img/small-logo-01.png">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,900,900italic,700italic,700,500italic,400italic,500,300italic,300'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pacifico'
	rel='stylesheet' type='text/css'>
<link href='/resources/member/css/liststyle.css' rel='stylesheet'
	type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">



</head>

<body>

	<a name="ancre"></a>

	<!-- CACHE -->
	<div class="cache"></div>

	<!-- HEADER -->

	<div id="wrapper-header">
		<div id="main-header" class="object">
			<div class="logo">
				<h3 style='color: white;'>Shopping Mall</h3>
			</div>
			<div id="main_tip_search">
				<form>
					<a href="#" style='color: white;'
						class='glyphicon glyphicon-search'></a>
				</form>
			</div>
			<div id="stripes"></div>
		</div>
	</div>

	<!-- NAVBAR -->

	<div id="wrapper-navbar">
		<div class="navbar object">
			<div id="wrapper-sorting">
				<div id="wrapper-title-0">
					<a href="index"><div class="top-rated object"><i class="material-icons" style="font-size:36px">home</i></div></a>
				</div>
				<div id="wrapper-title-1">
					<a href="list"><div class="top-rated object">ALL</div></a>
					<div id="fleche-nav-1"></div>
				</div>

				<div id="wrapper-title-2">
					<a href="genderList?pgender=남성"><div class="recent object">Male</div></a>
					<div id="fleche-nav-2"></div>
				</div>

				<div id="wrapper-title-3">
					<a href="genderList?pgender=여성"><div class="oldies object">Female</div></a>
					<div id="fleche-nav-3"></div>
				</div>
				<div id="wrapper-title-4">
					<a href="categoryList?pkind=상의"><div class="oldies object">Top</div></a>
					<div id="fleche-nav-4"></div>
				</div>
				<div id="wrapper-title-5">
					<a href="categoryList?pkind=하의"><div class="oldies object">Bottom</div></a>
					<div id="fleche-nav-5"></div>
				</div>
				<div id="wrapper-title-6">
					<a href="categoryList?pkind=아우터"><div class="oldies object">Outer</div></a>
					<div id="fleche-nav-6"></div>
				</div>
				<div id="wrapper-title-7">
					<a href="categoryList?pkind=신발 및 악세사리"><div class="oldies object">Foot & Acc</div></a>
					<div id="fleche-nav-7"></div>
				</div>
				<div id="wrapper-title-8">
					<a href="categoryList?pkind=기타"><div class="oldies object">Etc</div></a>
					<div id="fleche-nav-8"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- PORTFOLIO -->

	<div id="wrapper-container">

		<div class="container object">

			<div id="main-container-image">
				<section class="work"> 

				<!-- 하나 시작 --> 
				<c:if test="${'[null]' ne list}">
					<c:forEach items="${list}" var="vo">
						<figure class="white" style='min-height: 430px; max-height: 430px;'> 
						<a href="thema${vo.thema}/view?shopname=${vo.shopname}&pno=${vo.pno}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}" onclick="window.open(this.href); self.location.href='genderList?pgender=${param.pgender}';"> 
						<img style='max-width: 300px;min-height:300px;max-height: 300px;'
							src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="" />
							<dl>
								<dt>${vo.pname}</dt>
								<dd>들어가기</dd>
							</dl>
						</a>
						<div id="wrapper-part-info">
							<div id="part-info">￦${vo.price}</div>
							<div id="part-info"><a style='font-size: small;'>${vo.pname}</a></div>
						</div>
						</figure>

						<!-- 하나 끝 -->
					</c:forEach>
				</c:if> 
				</section>

			</div>

		</div>
		

		<div id="wrapper-oldnew">
			<div class="oldnew">
				<div class="wrapper-oldnew-prev">
					<div id="oldnew-prev"></div>
				</div>
				<div class="wrapper-oldnew-next">
					<div id="oldnew-next"></div>
				</div>
			</div>
		</div>

		<div id="wrapper-thank">
			<div class="thank">
				<div class="thank-text">
					pl<span style="letter-spacing: -5px;">a</span>tz
				</div>
			</div>
		</div>

		<div id="main-container-footer">
			<div class="container-footer">

				<div id="row-1f">
					<div class="text-row-1f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">What
							is Platz</span><br>Platz is a blog showcasing hand-picked free
						themes, design stuff, free fonts and other resources for web
						designers.
					</div>
				</div>

				<div id="row-2f">
					<div class="text-row-2f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">How
							does it work</span><br>Platz offers you all the latest freebies
						found all over the fourth corners without to pay.
					</div>
				</div>

				<div id="row-3f">
					<div class="text-row-3f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">Get
							in touch!</span><br>Subscribe our RSS or follow us on Facebook,
						Google+, Pinterest or Dribbble to keep updated.
					</div>
				</div>

				<div id="row-4f">
					<div class="text-row-4f">
						<span
							style="font-weight: 600; font-size: 15px; color: #666; line-height: 250%; text-transform: uppercase; letter-spacing: 1.5px;">Newsletter</span><br>You
						will be informed monthly about the latest content avalaible.
					</div>

					<div id="main_tip_newsletter">
						<form>
							<input type="text" name="newsletter" id="tip_newsletter_input"
								list="newsletter" autocomplete=off required>
						</form>
					</div>
				</div>

			</div>
		</div>


		<div id="wrapper-copyright">
			<div class="copyright">
				<div class="copy-text object">
					Copyright © 2016. Template by <a style="color: #D0D1D4;"
						href="https://dcrazed.com/">Dcrazed</a>
				</div>

				<div class="wrapper-navbouton">
					<div class="google object">g</div>
					<div class="facebook object">f</div>
					<div class="linkin object">i</div>
					<div class="dribbble object">d</div>
				</div>
			</div>
		</div>

	</div>



	<!-- SCRIPT -->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/jquery.scrollTo.min.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/jquery.localScroll.min.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/jquery-animate-css-rotate-scale.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/fastclick.min.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/jquery.animate-colors-min.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/jquery.animate-shadow-min.js"></script>
	<script type="text/javascript"
		src="/resources/member/allList/js/alllistmain.js"></script>
	<script>
	
		/* PRELOADER */

		function preloader() {
			if (document.images) {
				var img1 = new Image();
				var img2 = new Image();
				var img3 = new Image();
				var img4 = new Image();
				var img5 = new Image();
				var img6 = new Image();
				var img7 = new Image();
				var img8 = new Image();
				var img9 = new Image();
				var img10 = new Image();
				var img11 = new Image();
				var img12 = new Image();
				var img13 = new Image();
				var img14 = new Image();
				var img15 = new Image();
				var img16 = new Image();
				var img17 = new Image();
				var img18 = new Image();
				var img19 = new Image();
				var img20 = new Image();

				img1.src = "/resources/member/allList/img/psd-4.jpg";
				img2.src = "/resources/member/allList/img/font-1.jpg";
				img3.src = "/resources/member/allList/img/psd-1.jpg";
				img4.src = "/resources/member/allList/img/psd-2.jpg";
				img5.src = "/resources/member/allList/img/ai-1.jpg";
				img6.src = "/resources/member/allList/img/theme-2.jpg";
				img7.src = "/resources/member/allList/img/psd-3.jpg";
				img8.src = "/resources/member/allList/img/font-2.jpg";
				img9.src = "/resources/member/allList/img/font-3.jpg";
				img10.src = "/resources/member/allList/img/ai-2.jpg";
				img11.src = "/resources/member/allList/img/icons-1.jpg";
				img12.src = "/resources/member/allList/img/ui-1.jpg";
				img13.src = "/resources/member/allList/img/font-5.jpg";
				img14.src = "/resources/member/allList/img/theme-2.jpg";
				img15.src = "/resources/member/allList/img/psd-5.jpg";
				img16.src = "/resources/member/allList/img/icons-3.jpg";
				img17.src = "/resources/member/allList/img/font-4.jpg";
				img18.src = "/resources/member/allList/img/theme-3.jpg";
				img19.src = "/resources/member/allList/img/font-6.jpg";
				img20.src = "/resources/member/allList/img/theme-4.jpg";
			}
		}
		function addLoadEvent(func) {
			var oldonload = window.onload;
			if (typeof window.onload != 'function') {
				window.onload = func;
			} else {
				window.onload = function() {
					if (oldonload) {
						oldonload();
					}
					func();
				}
			}
		}
		addLoadEvent(preloader);

	</script>


</body>


</html>
