<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/themes/thema2/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/themes/thema2/js/jquery-1.11.0.min.js"></script>
<!--theme-style-->
<link href="/resources/themes/thema2/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
    window.scrollTo(0, 1);
} </script>
 <!-- 새로 추가한 것들  -->
<link href="/resources/member/css/rate.css" rel="stylesheet" >
<!--fonts-->
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Alegreya+Sans+SC:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic'
      rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
      rel='stylesheet' type='text/css'>
<!--//fonts-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/resources/themes/thema2/js/move-top.js"></script>
<script type="text/javascript" src="/resources/themes/thema2/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
        });
    });
</script>
<!-- start menu -->
<script src="/resources/themes/thema2/js/simpleCart.min.js"></script>
<link href="/resources/themes/thema2/css/memenu.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/resources/themes/thema2/js/memenu.js"></script>
<script>
 /* $(document).ready(function () {  */
    $(".memenu").memenu();
/* }); */  
</script>
<!--top-header-->
<div class="top-header">
    <div class="container">
        <div class="top-header-main">
            <div class="col-md-4 top-header-middle">
                <a href="index?shopname=${param.shopname}"><img src="/resources/themes/thema2/images/logo-4.png" alt=""/></a>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--top-header-->
<!--bottom-header-->
<div class="header-bottom">
    <div class="container">
        <div class="top-nav">
            <ul class="memenu skyblue hHeader">
                <li class="active"><a href="/member/index">Main</a></li>
                <li class="grid"><a href="index?shopname=${param.shopname}">Home</a></li>
                <li class="grid"><a href="list?shopname=${param.shopname}&pkind=전체&pageNum=1">Products</a></li>
                <li class="grid"><a href="#" id='hOrder'>Order</a></li>
                <li class="grid"><a href="#" id='hCart'>Cart</a></li>
                   
                <li class="grid"><a href="/member/register">Join Us</a></li>
                <li id="hLogin" class="grid"><a href="/member/login">Login</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--bottom-header-->


<script>
	var url = document.location.href; 
	$("#hLogin").children().attr("href", "/member/login?url="+url);
	
	var userid = null;
	//시작 하자 마자 쿠키값을 확인
	(function exe() {
		userid = getCookie('userid');
		if(userid != ''){
			$("#hLogin").detach();
			$(".hHeader").append(" <li id='hLogout' class='grid'><a href='#'>Logout</a></li>");
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
				$(".hHeader").append(" <li id='#hLogin' class='grid'><a href='/member/login?url="+url+"'>Login</a></li>");
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
                timer: 700,
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
                timer: 700,
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