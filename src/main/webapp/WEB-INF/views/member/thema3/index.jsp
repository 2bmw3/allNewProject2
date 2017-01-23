<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>
<aside id="fh5co-hero">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="flexslider animate-box">
					<ul class="slides">
						<li
							style="background-image: url(/resources/themes/thema3/images/img_bg_1.jpg);">
							<div class="overlay-gradient"></div>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-10 col-md-offset-1 slider-text">
										<div class="slider-text-inner">
											<h1>Best Item</h1>
											<h2>Fashion is not frivolous. It is a part of being
												alive today</h2>
											<p class="ct">
												<a href="#">Buy Now <i class="icon-arrow-right"></i></a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li
							style="background-image: url(/resources/themes/thema3/images/img_bg_2.jpg);">
							<div class="overlay-gradient"></div>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-10 col-md-offset-1 slider-text">
										<div class="slider-text-inner">
											<h1>Best Item</h1>
											<h2>Fashion is not frivolous. It is a part of being
												alive today</h2>
											<p class="ct">
												<a href="#">Buy Now <i class="icon-arrow-right"></i></a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li
							style="background-image: url(/resources/themes/thema3/images/img_bg_3.jpg);">
							<div class="overlay-gradient"></div>
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-10 col-md-offset-1 slider-text">
										<div class="slider-text-inner">
											<h1>Best Item</h1>
											<h2>Fashion is not frivolous. It is a part of being
												alive today</h2>
											<p class="ct">
												<a href="#">Buy Now <i class="icon-arrow-right"></i></a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<a href="#" class="featured text-center animate-box"
					style="background-image: url(/resources/themes/thema3/images/img_bg_4.jpg);">
					<div class="desc">
						<span class="date">Dec 25, 2016</span>
						<h3>Every Start has an End</h3>
						<span class="category">Inspirational</span>
					</div>
				</a> <a href="#" class="featured text-center animate-box"
					style="background-image: url(/resources/themes/thema3/images/img_bg_5.jpg);">
					<div class="desc">
						<span class="date">Dec 25, 2016</span>
						<h3>Most Beautiful Website in 2016</h3>
						<span class="category">Inspirational</span>
					</div>
				</a>
			</div>
		</div>
	</div>
</aside>

<div class="row animate-box fadeInUp animated-fast" style="margin-top: 10%;">
	<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
		<h2><span>Hit Item</span></h2>
	</div>
</div>

<div class="container">
<div class="row">
<c:forEach items="${hitItem}" var="vo">

<div class="col-md-4">
	<div class="fh5co-blog animate-box fadeInUp animated-fast">
		<a href="view?shopname=${param.shopname}&pno=${vo.pno}">
			<img class="img-responsive" 
			src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&amp;token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" 
			alt="" style="width: 100%; height: 300px;"></a>
		<div class="blog-text text-center">
			<ul class="fh5co-social-icons">
				<li>${vo.pname}</li>
				<li>￦${vo.price}</li>
			</ul>
			<ul class="fh5co-social-icons" style="margin-left: 25%;">
				<li style="float:left;"><a href="#"><i class="icon-shopping-cart"></i></a></li>
				<li style="float:left;"><a href="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&amp;token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"><i class="glyphicon glyphicon-search"></i></a></li>
				<li style="float:left;"><a href="#"><i class="	material-icons">copyright</i></a></li>
			</ul>
		</div>
	</div>
</div>
	
</c:forEach>
</div>
</div>


</body>
<%@include file="footer.jsp"%>
</html>