<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="header.jsp"%>

<body class="shop_grid_page">

	<!-- Main Container -->
	<div class="main-container col2-right-layout">
		<div class="container">
			<div class="row">
				<div class="col-main col-sm-12">
					<div class="page-title">
						<h2>TOP</h2>
						<hr />
					</div>
					<div class="product-grid-area">
						<ul class="products-grid">
							<c:if test="${'[null]' ne list}">
								<c:forEach items="${list}" var="vo">
									<!-- 상품 한개 시작! -->
									<li
										class="item col-lg-4 col-md-4 col-sm-6 col-xs-6 wow fadeInUp">
										<div class="product-item">
											<div class="item-inner">
												<div class="product-thumbnail">
													<div class="icon-new-label new-right">New</div>
													<div class="pr-img-area">
														<figure> <a
															href='view?shopname=${param.shopname}&pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}'>
															<img style='min-height: 350px; max-height: 350px;'
															class="first-img"
															src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"
															alt="">
														</a> </figure>
														<button type="button" class="add-to-cart-mt">
															<i class="fa fa-shopping-cart"></i> <span> Add to
																Cart</span>
														</button>
													</div>
												</div>
												<div class="item-info">
													<div class="info-inner">
														<div class="item-title">
															<a title="Ipsums Dolors Untra"
																href="view?shopname=${param.shopname}&pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}">${vo.pname}
															</a>
														</div>
														<div class="item-content">
															<div class="rating">
																<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																	class="fa fa-star-o"></i>
															</div>
															<div class="item-price">
																<div class="price-box">
																	<span class="regular-price"> <span class="price">￦${vo.price}</span>
																	</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
					<!-- pageNum  Start -->
					<c:if test="${total>9}">
						<div class="pagination-area"
							style="margin-left: 300px; margin-top: 20px;">
							<form id='pageNumForm' method="get" action='${actionName}'>
								<input type='hidden' name='shopname' value='${param.shopname}'>
								<input type='hidden' name='pkind' value='${param.pkind}'>
								<input id='pageInput' type='hidden' name='pageNum'>
							</form>
							<ul class="pagination">
								<!— 이전 페이지가 있을 경우 —>
								<c:set var="currentPage">${page.currentPage}</c:set>
								<c:if test="${page.prevPage==1}">
									<li value='${page.minimumPage-1}'><a href=""
										data-toggle="tab"> <i class="fa fa-angle-double-left"></i>
									</a></li>
								</c:if>
								<c:forEach begin="${minimumPage}" end="${page.maxmumPage-1}"
									step="1" varStatus="status">
									<li value='${status.count}'><a href=""
										<c:if test="${status.count == currentPage}">class="active"</c:if>
										data-toggle="tab">${status.count}</a></li>
								</c:forEach>
								<!— 다음 페이지가 있을 경우 —>
								<c:if test="${page.nextPage==1}">
									<li value='${page.maxmumPage+1}'><a href=""
										data-toggle="tab"> <i class="fa fa-angle-double-right"></i>
									</a></li>
								</c:if>
							</ul>
						</div>
					</c:if>
					<!--pageNum  End-->
				</div>
			</div>
		</div>
	</div>
	<!-- Main Container End -->
	<%@include file="footer.jsp"%>