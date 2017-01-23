<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daily Shop | Home</title>

    <!-- 새로 추가한 것들  -->
	<link href="/resources/member/css/rate.css" rel="stylesheet" >
    <!-- 구                 분  -->
    
    <!-- Font awesome -->
    <link href="/resources/themes/thema1/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="/resources/themes/thema1/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="/resources/themes/thema1/css/jquery.simpleLens.css">
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="/resources/themes/thema1/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="/resources/themes/thema1/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="/resources/themes/thema1/css/theme-color/dark-red-theme.css" rel="stylesheet">

    <!-- Main style sheet -->
    <link href="/resources/themes/thema1/css/style.css" rel="stylesheet">

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
	<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
	
	<!-- 밑에있으면 안됨 -->
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/themes/thema1/js/bootstrap.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- wpf loader Two -->
<div id="wpf-loader-two">
    <div class="wpf-loader-two-inner">
        <span>Loading</span>
    </div>
</div>
<!-- / wpf loader Two -->
<!-- SCROLL TOP BUTTON -->
<a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
<!-- END SCROLL TOP BUTTON -->


<!-- Start header section -->
<header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                  <div class="aa-header-top-area">
                     <div class="aa-header-top-right">
                        <ul class="aa-head-top-nav-right hHeader">
                           <li><a href="faq?shopname=${param.shopname}">F.A.Q</a></li>
                           <li><a href="#" id='hCart'>My Cart</a></li>
                           <li><a href="#" id="hOrder">Order</a></li>
                           <li><a href="/member/register">Join Us</a></li>
                           <li id='hLogin'><a href="/member/login" >Login</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
              </div>
         </div>
      </div>
      <!-- / header top  -->

      <!-- start header bottom  -->
      <div class="aa-header-bottom">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="aa-header-bottom-area">
                     <!-- logo  -->
                     <div class="aa-logo">
                        <!-- Text based logo -->
                        <a href="/member/thema1/index?shopname=${param.shopname}"> <span
                           class="fa fa-shopping-cart"></span>
                           <p>
                              sm<strong>Shop</strong> <span>Your Shopping Partner</span>
                           </p>
                        </a>
                     </div>
                     <!-- / logo  -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / header bottom  -->
</header>
<!-- / header section -->

	<!-- menu -->
	<section id="menu">
		<div class="container">
			<div class="menu-area">
				<!-- Navbar -->
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="navbar-collapse collapse">
						<!-- Left nav -->
						<ul class="nav navbar-nav">
							<li><a href="/member/index">Main</a></li>
							<li><a href="index?shopname=${param.shopname}">Home</a></li>
							<li><a href="categoryList?shopname=${param.shopname}&pkind=상의&pageNum=1">TOP</a></li>
							<li><a href="categoryList?shopname=${param.shopname}&pkind=하의&pageNum=1">BOTTOM</a></li>
							<li><a href="categoryList?shopname=${param.shopname}&pkind=아우터&pageNum=1">OUTER</a></li>
							<li><a href="categoryList?shopname=${param.shopname}&pkind=신발 및 악세사리&pageNum=1">FOOTWEARE & ACC</a></li>
							<li><a href="categoryList?shopname=${param.shopname}&pkind=기타&pageNum=1">ETC</a></li>
							<li><a href="#">SEARCH <span class="caret"></span></a>
								<ul class="dropdown-menu" >
									<li style='float: left;'>
										<a href="#" class='glyphicon glyphicon-search'></a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
	</section>
	
	<script>
	
	var url = document.location.href; 
	$("#hLogin").children().attr("href", "/member/login?url="+url);
	
	var userid = null;
	//시작 하자 마자 쿠키값을 확인
	(function exe() {
		userid = getCookie('userid');
		if(userid != ''){
			$("#hLogin").detach();
			$(".hHeader").append("<li id='hLogout'><a href='#' >Logout</a></li>");
		}else{}
	}());

	
	$("#hLogout").on("click", function(){
		swal({
			  title: "로그아웃 하시겠습니까?",
			  text: "",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Yes",
			},
			function(){
				setCookie("userid", '', -1);
				$("#hLogout").detach();
				$(".hHeader").append("<li id='hLogin'><a href='/member/login?url="+url+"'>Login</a></li>");
			});
	});
	
	$("#hCart").on("click",function(){
		if(userid != ''){
			location.href="cart?shopname=${param.shopname}";
		}else{
            swal({
                title: "로그인을 해주세요.",
                text: "",
                type: "error",
                timer: 1000,
                showConfirmButton: false
            });    
		}
	});
	
	$("#hOrder").on("click",function(){
		if(userid != ''){
			location.href="order?shopname=${param.shopname}";
		}else{
            swal({
                title: "로그인을 해주세요.",
                text: "",
                type: "error",
                timer: 1000,
                showConfirmButton: false
            });    
		}
	});
	
	
	// 쿠키값가져오기
	function getCookie(name){
		name = new RegExp(name + '=([^;]*)');
		return name.test(document.cookie) ? unescape(RegExp.$1) : '';
	};
	
	// 쿠키 설정 (쿠키값 삭세 할 떄 사용)
    function setCookie(cName, cValue, cDay){
	        var expire = new Date();
	        expire.setDate(expire.getDate() + cDay);
			// 한글 깨짐을 막기위해 escape(cValue)를 
	        cookies = cName + '=' + escape(cValue) + '; path=/ '; 
	        if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	        document.cookie = cookies;
	    }
	</script>