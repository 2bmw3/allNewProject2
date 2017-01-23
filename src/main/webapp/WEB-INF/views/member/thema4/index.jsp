<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="header.jsp"%>
<!--  -->
<body class="cms-index-index cms-home-page home-7">
  <!-- Home Slider -->
		
		<section id="home-slider">
            <div id="slider" class="sl-slider-wrapper">

				<div class="sl-slider">
					<div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
						<div class="bg-img bg-img-1"></div>
						<div class="slide-caption">
                            <div class="caption-content">
                                <h2 class="animated fadeInDown">FASHION & DESIGN  Women's</h2>
                                <span class="animated fadeInDown hidden-xs"> Lorem Ipsum is that it has a more-or-less normal.</span>
                                <a href="#" class="btn btn-blue btn-effect">View Collection</a>
                            </div>
                        </div>
						
					</div>
				</div><!-- /sl-slider -->

                

				<div id="nav-dots" class="nav-dots visible-xs visible-sm hidden-md hidden-lg">
					<span class="nav-dot-current"></span>
					<span></span>
					<span></span>
				</div>

			</div><!-- /slider-wrapper -->
		</section>
		
    <!-- End Home SliderEnd -->  
        
	<!-- Product Box Area -->
		
        
        <div class="product-box-area">
	
				<!-- Product Box -->
				<div class="product-box">
					<!-- Single Product Box -->
					<div class="single-product-box">
						<div class="product-box-img">
							<a href="view?shopname=${param.shopname}&pno=${newItem[0].pno}">
							<img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${newItem[0].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164"
							 alt="product" style=" max-width: 640px; max-width: 640px; width: 100%; height: 30em;"></a>							
						</div>
						<div class="product-box-content">				
							<h2>${newItem[0].pname}</h2>
							<p>￦${newItem[0].price}</p>
							<a href="view?shopname=${param.shopname}&pno=${newItem[0].pno}">Quick view!</a>
						</div>
					</div>
					
					<!-- Single Product Box -->
					<div class="single-product-box single-product-box-two">
						<div class="product-box-content">				
							<h2>${newItem[1].pname}</h2>
							<p>￦${newItem[1].price}</p>
							<a href="view?shopname=${param.shopname}&pno=${newItem[1].pno}">Quick view!</a>
						</div>
						<div class="product-box-img">
							<a href="view?shopname=${param.shopname}&pno=${newItem[1].pno}"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${newItem[1].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
							alt="product" style=" max-width: 640px; max-width: 640px; width: 100%; height: 30em;"></a>							
						</div>
					</div>
					<!-- Single Product Box -->
					<div class="single-product-box single-product-box-three">
						<div class="product-box-img">
							<a href="view?shopname=${param.shopname}&pno=${newItem[2].pno}"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${newItem[2].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
							alt="product" style=" max-width: 640px; max-width: 640px; width: 100%; height: 30em;"></a>							
						</div>
						<div class="product-box-content">				
							<h2>${newItem[2].pname}</h2>
							<p>￦${newItem[2].price}</p>
							<a href="view?shopname=${param.shopname}&pno=${newItem[2].pno}">Quick view!</a>
						</div>
					</div>
				</div><!-- End Product Box -->
		</div>
 	 <div class="product-box-area">
				<!-- Product Box -->
				<div class="product-box">
					<!-- Single Product Box -->
					<div class="single-product-box">
						<div class="product-box-img">
							<a href="view?shopname=${param.shopname}&pno=${newItem[3].pno}"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${newItem[3].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
							alt="product" style=" max-width: 640px; max-width: 640px; width: 100%; height: 30em;"></a>							
						</div>
						<div class="product-box-content">				
							<h2>${newItem[3].pname}</h2>
							<p>￦${newItem[3].price}</p>
							<a href="view?shopname=${param.shopname}&pno=${newItem[3].pno}">Quick view!</a>
						</div>
					</div>
					<!-- Single Product Box -->
					<div class="single-product-box single-product-box-two">
						<div class="product-box-content">				
							<h2>${newItem[4].pname}</h2>
							<p>￦${newItem[4].price}</p>
							<a href="view?shopname=${param.shopname}&pno=${newItem[4].pno}">Quick view!</a>
						</div>
						<div class="product-box-img">
							<a href="view?shopname=${param.shopname}&pno=${newItem[4].pno}"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${newItem[4].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
							alt="product" style=" max-width: 640px; max-width: 640px; width: 100%; height: 30em;"></a>							
						</div>
					</div>
					<!-- Single Product Box -->
					<div class="single-product-box single-product-box-three">
						<div class="product-box-img">
							<a href="view?shopname=${param.shopname}&pno=${newItem[5].pno}"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${newItem[5].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
							alt="product" style=" max-width: 640px; max-width: 640px; width: 100%; height: 30em;"></a>							
						</div>
						<div class="product-box-content">				
							<h2>${newItem[5].pname}</h2>
							<p>￦${newItem[5].price}</p>
							<a href="view?shopname=${param.shopname}&pno=${newItem[5].pno}">Quick view!</a>
						</div>
					</div>
				</div><!-- End Product Box! -->
		</div>
        <!-- End Product Box Area -->
<%@include file="footer.jsp"%>