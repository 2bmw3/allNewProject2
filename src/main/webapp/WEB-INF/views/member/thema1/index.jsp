<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp"%>
<html>
<!-- Start slider -->
<section id="aa-slider">
    <div class="aa-slider-area">
        <div id="sequence" class="seq">
            <ul class="seq-canvas">
<%-- 				<c:forEach items="${bannerImg}" var="vo" varStatus="status">  --%>
                <!-- single slide item -->
	                <li>
	                    <div class="seq-model"> 
	                    <!-- slider banner ::: 1920 x 700 -->
	                        <img style = 'width : 100%; height : 700px;' 
	                        	data-seq src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shopimg%2Fthema1_banner1.jpg?alt=media&token=8c30ca10-01e5-42b7-b3dc-5b2269408bee"/>
	                    </div>
	                </li>
                 <!-- single slide item end-->
<%--                </c:forEach> --%>
            </ul>
        </div>
    </div>
</section>
<!-- / slider!! -->


<!-- Start Promo section -->
<section id="aa-promo">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-promo-area">
                    <div class="row">
                    
                    
                        <!-- promo left -->
                        <!-- new product banner size ::: 450 x 450  -->
                        <div class="col-md-5 no-padding">
                            <div class="aa-promo-left">
                                <div class="aa-promo-banner">
                                    <img 
                                    src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shopimg%2Fthema1_subimg4.jpg?alt=media&token=60ecd854-2d9b-46a6-9eb6-1f37bfeac227" alt="img">
                                </div>
                            </div>
                        </div>
                        
                        <!-- promo right -->
                        <!-- hit product banner size ::: 300 x 220 -->
                        <div class="col-md-7 no-padding">
                            <div class="aa-promo-right">
                            
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner"> 
                                        <img 
                                        src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shopimg%2Fthema1_subimg1.jpg?alt=media&token=60ecd854-2d9b-46a6-9eb6-1f37bfeac227" alt="img">
                                        <div class="aa-prom-content">
                                            <h4 style='text-align: center;'><a href="categoryList?shopname=${param.shopname}&pkind=상의&pageNum=1">Top</a></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner"> 
                                        <img 
                                        src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shopimg%2Fthema1_subimg2.jpg?alt=media&token=60ecd854-2d9b-46a6-9eb6-1f37bfeac227" alt="img">
                                        <div class="aa-prom-content">
                                            <h4 style='text-align: center;'><a href="categoryList?shopname=${param.shopname}&pkind=하의&pageNum=1">bottom</a></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner"> 
                                        <img 
                                        src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shopimg%2Fthema1_subimg3.jpg?alt=media&token=60ecd854-2d9b-46a6-9eb6-1f37bfeac227" alt="img">
                                        <div class="aa-prom-content">
                                            <h4 style='text-align: center;'><a href="categoryList?shopname=${param.shopname}&pkind=신발%20및%20악세사리&pageNum=1">Acc</a></h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner"> 
                                        <img 
                                        src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shopimg%2Fthema1_subimg5.jpg?alt=media&token=60ecd854-2d9b-46a6-9eb6-1f37bfeac227" alt="img">
                                        <div class="aa-prom-content">
                                            <h4 style='text-align: center;'><a href="categoryList?shopname=${param.shopname}&pkind=아우터&pageNum=1">Outer</a></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <!-- promo right -->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Promo section -->




<!-- quick view modal -->
<c:forEach items="${viewList}" var="vo">
<div class="modal fade" id="quick-view-modal${vo.pno}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="aa-product-view-slider">
                            <div class="simpleLens-gallery-container" id="demo-1">
                            
                                <div class="simpleLens-container">
                                    <div class="simpleLens-big-image-container">
                                      <img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164"
                                           class="simpleLens-big-image" style="width: 70%;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-sm-6 col-xs-12">
                    
                        <div class="aa-product-view-content" style="margin-top: 50%; text-align: center;">
                            <h3>${vo.pname}</h3>
                            <h4>${vo.price}원</h4>
                            <div class="aa-prod-quantity">
                                <p class="aa-prod-category">
                                    <b>Category:</b> ${vo.pkind}
                                </p>
                            </div>
                            <div class="aa-prod-view-bottom">
                                <a href="/member/thema1/view?shopname=${param.shopname}&pno=${vo.pno}" class="aa-add-to-cart-btn">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</c:forEach>
<!-- / quick view modal -->





</div>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- / Products section -->


<!-- popular section -->
<section id="aa-popular-category">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-popular-category-area">
                        <!-- start prduct navigation -->
                        <ul class="nav nav-tabs aa-products-tab">
                            <li class="`"><a href="#popular" data-toggle="tab">Popular</a></li>
                            <li><a href="#latest" data-toggle="tab">Latest</a></li>
                        </ul>
                        
                        
                        <!-- Tab panes -->
                        <!-- list products size ::: 250 x 300 -->
                        <div class="tab-content">
                            <!-- Start men popular category -->
                            <div class="tab-pane fade in active" id="popular">
                                <ul class="aa-product-catg aa-popular-slider">
                                
								<!--인기상품 시작 -->
                                	<c:forEach items="${hitItem}" var="vo">
                                    <li>
                                        <figure>
                                            <a class="aa-product-img" 
                                            	href="/member/thema1/view?shopname=${param.shopname}&pno=${vo.pno}">
                                           	 <img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164"
                                           	  style="height:20em; display: block; margin-left: auto; margin-right: auto; ">
                                            </a>
                                            <a class="aa-add-card-btn" href="#">
                                            <span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                            <figcaption>
                                                <h4 class="aa-product-title">
                                                <a href="/member/thema1/view?shopname=${param.shopname}&pno=${vo.pno}">${vo.pname}</a></h4>
                                                <span class="aa-product-price">${vo.price}원</span>
                                            </figcaption>
                                        </figure>
                                        <div class="aa-product-hvr-content">
                                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" 
                                            	data-toggle="modal" data-target="#quick-view-modal${vo.pno}">
                                           	<span class="fa fa-search"></span></a>
                                        </div>
                                    </li>
                                   </c:forEach>
                              	<!--인기상품 끝 -->
                                   
                                </ul>
                                <a class="aa-browse-btn" href="products">Browse all Product 
                                <span class="fa fa-long-arrow-right"></span></a>
                            </div>
                            <!-- / popular product category -->
                          
                            <!-- start latest product category -->
                            <div class="tab-pane fade" id="latest">
                                <ul class="aa-product-catg aa-latest-slider">
                                    <!-- start single product item -->
                                    
                                    <!--최근상품 시작 -->
                                	<c:forEach items="${newItem}" var="vo">
                                    <li>
                                        <figure>
                                            <a class="aa-product-img" 
                                            	href="/member/thema1/view?shopname=${param.shopname}&pno=${vo.pno}">
                                           	 <img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164"
                                           	  style="height:20em; display: block; margin-left: auto; margin-right: auto; ">
                                            </a>
                                            <a class="aa-add-card-btn" href="#">
                                            <span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                            <figcaption>
                                                <h4 class="aa-product-title">
                                                <a href="/member/thema1/view?shopname=${param.shopname}&pno=${vo.pno}">${vo.pname}</a></h4>
                                                <span class="aa-product-price">${vo.price}원</span>
                                            </figcaption>
                                        </figure>
                                        <div class="aa-product-hvr-content">
                                            <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" 
                                            	data-toggle="modal" data-target="#quick-view-modal${vo.pno}">
                                           	<span class="fa fa-search"></span></a>
                                        </div>
 										<span class="aa-badge aa-hot" href="#">NEW</span>
                                    </li>
                                   </c:forEach>
                              	<!--최근상품 끝임-->

                                </ul>
                                <a class="aa-browse-btn" href="#">Browse all Product <span
                                        class="fa fa-long-arrow-right"></span></a>
                            </div>
                            <!-- / latest product category -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="footer.jsp"%>
</html>
