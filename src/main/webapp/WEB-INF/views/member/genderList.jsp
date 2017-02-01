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
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
</head>
<style>
@media screen and (max-width: 860px){
    #wrapper-navbar{
    	min-height: 150px;
    }
}
</style>
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
				<input type="text" id="tip_search_input" placeholder='Search'>
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
						<a class='targetImg' href="#"> 
							<input type="hidden" value="thema${vo.thema}/view?shopname=${vo.shopname}&pno=${vo.pno}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}">
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
		


		<div id="wrapper-copyright">
			<div class="copyright">
				<div class="copy-text object">
					Copyright © 2016. Template by <a style="color: #D0D1D4;"
						href="https://dcrazed.com/">Won-piece</a>
				</div>
			</div>
		</div>

	</div>



<!-- SCRIPT -->
<script	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/jquery.scrollTo.min.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/jquery.localScroll.min.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/jquery-animate-css-rotate-scale.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/fastclick.min.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/jquery.animate-colors-min.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/jquery.animate-shadow-min.js"></script>
<script type="text/javascript"	src="/resources/member/allList/js/alllistmain.js"></script>
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$("#tip_search_input").on("keydown",function(key){
		if( key.keyCode == 13){
			var searchValue = this.value;
			
			var data = { "pno" : searchValue };
			
			$.ajax({
				url : "/pnoSearch",
				data : data,
				dataType : 'text',
				type : "post",
				success : function(result) {
					var splitResult = result.split("#");
					if(splitResult[0] == "T"){
						 swal({
		                        title: "해당 상품으로 이동합니다.",
		                        text:  "",
		                        type: "success",
		                        timer: 2000,
		                        showConfirmButton: false
		                    });
		                    setTimeout(() => {
		                    	window.open("thema"+splitResult[2]+"/view?shopname="+splitResult[1]+"&pno="+searchValue, "_blank");
		                }, 1500);
					}else{
						swal("해당 상품이 없습니다!","","error");
					}
				}// end success
			});// end ajax
			
		}
	});
	$(".targetImg").on("click",function(event){
		event.preventDefault();
		var href =  $(this)[0].firstElementChild.defaultValue;
		window.open(href, "_blank");
	});
</script>
</body>
</html>
