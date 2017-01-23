<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp"%>

<!--start-breadcrumbs-->
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li><a href="index?${param.shopname}">Home</a></li>
                <li class="active">New Products</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->

<!--start-product-->
<div class="product">
    <div class="container">
        <div class="product-main">

            <div class="col-md-12 p-left">
                <h3 class="b2">
                    <a href="list?shopname=${param.shopname}&pkind=전체&pageNum=1"><span class="label label-default">All</span></a>
                    <a href="categoryList?shopname=${param.shopname}&pkind=아우터&pageNum=1"><span class="label label-primary">Outer</span></a>
                    <a href="categoryList?shopname=${param.shopname}&pkind=상의&pageNum=1"><span class="label label-success">Top</span></a>
                    <a href="categoryList?shopname=${param.shopname}&pkind=하의&pageNum=1"><span class="label label-info">Bottom</span></a>
                    <a href="categoryList?shopname=${param.shopname}&pkind=신발 및 악세사리&pageNum=1"><span class="label label-warning">Shoes and Acc</span></a>
                    <a href="categoryList?shopname=${param.shopname}&pkind=기타&pageNum=1"><span class="label label-danger">Etc</span></a>
                    <a href="#"><span class="fa fa-search" style="float: right;"></span></a>
                </h3>

                <div class="product-one">
						<c:if test="${'[null]' ne list}">
							<c:forEach items="${list}" var="vo">
								<div class="col-md-4 product-left single-left">
									<div class="p-one simpleCart_shelfItem" >
										<a href="view?shopname=${param.shopname}&pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}"> 
										<img 
											src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt=""
											style="width: 100%; max-height: 255px;" />
											<div class="mask mask1">
												<span class="fa fa-search"> Quick view</span>
											</div>
										</a>
										<h5>${vo.pname}</h5>
										<p>
											<a class="item_add" href="#"> 
											<span class=" item_price">￦${vo.price}</span></a>
										</p>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<div class="clearfix"></div>
                </div>
				<!-- 상품 하나 끝 -->
            </div>
        </div>
    </div>
</div>
 <!-- pageNum  Start -->
<c:if test="${total>9}">
	<div class="pagination-area" style="margin-left: 45%; margin-top: 20px;">
		<form id='pageNumForm' method="get" action='${actionName}'>
			<input type='hidden' name='shopname' value='${param.shopname}'> 
			<input type='hidden' name='pkind' value='${param.pkind}'>
			<input id='pageInput' type='hidden' name='pageNum'> 
		</form>
		<ul class="pagination">
			<!--  이전 페이지가 있을 경우 -->
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
			<!--다음 페이지가 있을 경우-->
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
<!--pageNum  End-->
<%@include file="footer.jsp"%>
</body>
</html>