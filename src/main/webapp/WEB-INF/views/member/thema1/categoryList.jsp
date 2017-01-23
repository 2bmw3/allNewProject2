<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="header.jsp"%>
  <!-- catg header banner section -->
  <section id="aa-catg-head-banner">
   <img src="/resources/themes/thema1/img/fashion/fashion-header-bg-8.jpg" alt="fashion img">

  </section>
  <!-- / catg header banner section -->

  <!-- product category -->
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
          <div class="aa-product-catg-content">
            <div class="aa-product-catg-head">
              <div class="aa-product-catg-head-left">
                <form action="" class="aa-sort-form">
                  <label for="">search by</label>
                  <select name="" class='search'>
                    <option value="1" selected="Default">Default</option>
                    <option value="2">Name</option>
                    <option value="3">Price</option>
                    <option value="4">Date</option>
                  </select>
                </form>
                <form action="" class="aa-show-form">
                  <input type='text' placeholder='search' class='search'/>
                  <button type="submit" class='aa-filter-btn search' style='width: 80px;'>submit </button>
                </form>
              </div>
              <div class="aa-product-catg-head-right search">
                <a id="grid-catg" href="#" ><span class="fa fa-th"></span></a>
                <a id="list-catg" href="#"><span class="fa fa-list"></span></a>
              </div>
            </div>
            <div class="aa-product-catg-body">
          <ul class="aa-product-catg">
                <!-- 상품 리스트 시작! -->
      		<c:if test="${'[null]' ne list}">
				<c:forEach items="${list}" var="vo">
	                <li>
	                  <figure>
	                    <a class="aa-product-img" href="view?shopname=${param.shopname}&pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}">
	                    	<img style = 'width:100%;height:300px;'src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="polo shirt img"></a>
	                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
	                    <figcaption>
	                      <h4 class="aa-product-title"><a>${vo.pname}</a></h4>
	                      <span class="aa-product-price">${vo.price}</span><span class="aa-product-price"><del>900000</del></span>
<!-- 	                      <p class="aa-product-descrip">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam accusamus facere iusto, autem soluta amet sapiente ratione inventore nesciunt a, maxime quasi consectetur, rerum illum.</p> -->
	                    </figcaption>
	                  </figure>                         
	                  <div class="aa-product-hvr-content">
	                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
	                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
	                  </div>
	                  <!-- product badge -->
	                  <span class="aa-badge aa-sale" href="#">SALE!</span>
	                </li>
                </c:forEach>
			</c:if>
                   
          </ul>

	           
              <!-- quick view modal -->                  
              <div class="modal fade" id="quick-view-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">                      
                    <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <div class="row">
                        <!-- Modal view slider -->
                        <div class="col-md-6 col-sm-6 col-xs-12">                              
                          <div class="aa-product-view-slider">                                
                            <div class="simpleLens-gallery-container" id="demo-1">
                              <div class="simpleLens-container">
                                  <div class="simpleLens-big-image-container">
                                      <a class="simpleLens-lens-image" data-lens-image="/resources/themes/thema1/img/view-slider/large/polo-shirt-1.png">
                                          <img src="/resources/themes/thema1/img/view-slider/medium/polo-shirt-1.png" class="simpleLens-big-image">
                                      </a>
                                  </div>
                              </div>
                              <div class="simpleLens-thumbnails-container">
                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="/resources/themes/thema1/img/view-slider/large/girl-1.png"
                                     data-big-image="/resources/themes/thema1/img/view-slider/medium/girl-1.png">
                                      <img src="/resources/themes/thema1/img/view-slider/thumbnail/girl-1.png">
                                  </a>                                    
                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="/resources/themes/thema1/img/view-slider/large/girl-1.png"
                                     data-big-image="/resources/themes/thema1/img/view-slider/medium/girl-1.png">
                                      <img src="/resources/themes/thema1/img/view-slider/thumbnail/girl-1.png">
                                  </a>

                                  <a href="#" class="simpleLens-thumbnail-wrapper"
                                     data-lens-image="/resources/themes/thema1/img/view-slider/large/girl-1.png"
                                     data-big-image="/resources/themes/thema1/img/view-slider/medium/girl-1.png">
                                      <img src="/resources/themes/thema1/img/view-slider/thumbnail/girl-1.png">
                                  </a>
                              </div>
                            </div>
                          </div>
                        </div>
                        
                        
                        
                        <!-- Modal view content -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="aa-product-view-content">
                            <h3>T-Shirt</h3>
                            <div class="aa-price-block">
                              <span class="aa-product-view-price">$34.99</span>
                              <p class="aa-product-avilability">Avilability: <span>In stock</span></p>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!</p>
                            <h4>Size</h4>
                            <div class="aa-prod-view-size">
                              <a href="#">S</a>
                              <a href="#">M</a>
                              <a href="#">L</a>
                              <a href="#">XL</a>
                            </div>
                            <div class="aa-prod-quantity">
                              <form action="">
                                <select name="" id="">
                                  <option value="0" selected="1">1</option>
                                  <option value="1">2</option>
                                  <option value="2">3</option>
                                  <option value="3">4</option>
                                  <option value="4">5</option>
                                  <option value="5">6</option>
                                </select>
                              </form>
                              <p class="aa-prod-category">
                                Category: <a href="#">Polo T-Shirt</a>
                              </p>
                            </div>
                            <div class="aa-prod-view-bottom">
                              <a href="#" class="aa-add-to-cart-btn"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                              <a href="#" class="aa-add-to-cart-btn">View Details</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>                        
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div>
              <!-- / quick view modal -->   
            </div>
            
            
          </div>
        </div>
        
            <!-- pageNum  Start -->
		<c:if test="${total>9}">
			<div class="pagination-area" style="margin-left: 300px; margin-top: 20px;">
				<form id='pageNumForm' method="get" action='${actionName}'>
					<input type='hidden' name='shopname' value='${param.shopname}'> 
					<input type='hidden' name='pkind' value='${param.pkind}'>
					<input id='pageInput' type='hidden' name='pageNum'> 
				</form>
				<ul class="pagination">
					<!— 이전 페이지가 있을 경우 —>
					<c:set var="currentPage">${page.currentPage}</c:set>
					<c:if test="${page.prevPage==1}">
						<li value='${page.minimumPage-1}'>
							<a href="" data-toggle="tab">
								<i class="fa fa-angle-double-left"></i>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${minimumPage}" end="${page.maxmumPage-1}" step="1" varStatus="status">
						<li value='${status.count}'>
						<a href="" <c:if test="${status.count == currentPage}">class="active"</c:if> data-toggle="tab">${status.count}</a></li>
					</c:forEach>
					<!— 다음 페이지가 있을 경우 —>
					<c:if test="${page.nextPage==1}">
						<li value='${page.maxmumPage+1}'>
							<a href="" data-toggle="tab">
								<i class="fa fa-angle-double-right"></i>
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</c:if>
		<!— pageNum  End—>
        <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
          <aside class="aa-sidebar">
           
           
           
            <!-- single sidebar -->
            <div class="aa-sidebar-widget">
              <h3>Shop By Color</h3>
              <div class="aa-color-tag">
                <a class="aa-color-red" href="#"></a>
                <a class="aa-color-orange" href="#"></a>
                <a class="aa-color-yellow" href="#"></a>
                <a class="aa-color-green" href="#"></a>
                <a class="aa-color-blue" href="#"></a>
                <a class="aa-color-pink" href="#"></a>
                <a class="aa-color-beige" href="#"></a>
                <a class="aa-color-brown" href="#"></a>
                <a class="aa-color-navy" href="#"></a>
                <a class="aa-color-gray" href="#"></a>
                <a class="aa-color-white" href="#"></a>
                <a class="aa-color-black" href="#"></a>
                <a class="aa-color-purple" href="#"></a>
                <br>
                <a class="aa-color-etc" href="#">
                	<img src='/resources/themes/thema1/img/etc.jpg'>
                </a>
              </div>                            
            </div>
          
          <!-- end filter -->  
          </aside>
        </div>
       
      </div>
    </div>
  </section>
  <!-- / product category -->



<%@include file="footer.jsp"%>
</html>