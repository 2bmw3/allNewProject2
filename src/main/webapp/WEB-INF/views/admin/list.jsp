<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>


	<!-- list start -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">ALL LIST</h1>
			</div>

			<div class="col-sm-12">
				<!--LATEST ARRIVALS -->
				<div class="features_items" style='margin-top: -73px;'>
					<div class="row" >
						<form method='get' action='listSearchAction' id='search'>
							<div class="col-md-1" style='float: right;'>
								<button id="sBtn"><i class="fa fa-search" style="width:15px; height:21px"></i></button>
							</div>
							<div class="col-md-2" style='float: right; margin-left: -1%'>
								<input type="text" name='keyword' id='keyword' placeholder="검색"
									value='${keyword}' style="height:27px">
							</div>
							<div class="col-md-0" style='float: right;'>
								<select name='sType' style="height: 27px;" id="select" >
									<option value='n' style="color: black;"></option>
									<option value='s' style="color: black;">사이즈</option>
									<option value='c' style="color: black;">색상</option>
									<option value='p' style="color: black;">상품명</option>
								</select>
							</div>

						</form>
					</div>
					<div class="col-sm-10"
						style="margin-left: 60%; margin-top: 1%; display: none;"
						id="color">
						<image src='/resources/admin/images/color_info/red.jpg'
							class='colorInfo' id='red' />
						<image src='/resources/admin/images/color_info/orange.jpg'
							class='colorInfo' id='orange' />
						<image src='/resources/admin/images/color_info/yellow.jpg'
							class='colorInfo' id='yellow' />
						<image src='/resources/admin/images/color_info/green.jpg'
							class='colorInfo' id='green' />
						<image src='/resources/admin/images/color_info/blue.jpg'
							class='colorInfo' id='blue' />
						<image src='/resources/admin/images/color_info/navy.jpg'
							class='colorInfo' id='navy' />
						<image src='/resources/admin/images/color_info/purple.jpg'
							class='colorInfo' id='purple' />
						<image src='/resources/admin/images/color_info/pink.jpg'
							class='colorInfo' id='pink' />
						<image src='/resources/admin/images/color_info/beige.jpg'
							class='colorInfo' id='beige' />
						<image src='/resources/admin/images/color_info/brown.jpg'
							class='colorInfo' id='brown' />
						<image src='/resources/admin/images/color_info/gray.jpg'
							class='colorInfo' id='gray' />
						<image src='/resources/admin/images/color_info/white.jpg'
							class='colorInfo' id='white' />
						<image src='/resources/admin/images/color_info/black.jpg'
							class='colorInfo' id='black' />
						<image src='/resources/admin/images/color_info/etc.jpg'
							class='colorInfo' id='etc' />
						<br>
					</div>
					<!-- 상품 1개 -->

					<br> <br>
					<div class="single-products" style="margin-top: 2%">
						<div class="productinfo text-center">
							<c:if test="${'[null]' ne list}">
								<c:forEach items="${list}" var="vo">

									<div class="col-md-4">
										<a
											href="view?pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}">
											<img style='width: 250px; height: 250px;'
											src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e">
										</a>
											<span><p>${vo.pname}</p></span>
										<div>
											<input type="hidden" value="${vo.pno}"> 
											<a href="productsUpdate?pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}" class="btn btn-default add-to-cart updateBtn"> 
												<i class="fa fa-pencil"></i>수정
											</a> 
											<a href="#" class="btn btn-default add-to-cart deleteBtn" data-toggle="tab">
												<i class="fa fa-close"></i>삭제
											</a>
										</div>
									</div>
								</c:forEach>
								<br>
							</c:if>
						</div>
					</div>
					<!-- 상품 1개 끝 -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- pageNum  Start -->
	<c:if test="${total>9}">
		<div class="pagination-area" style="margin-left: 55%; margin-top: -180px;">
			<form id='pageNumForm' method="get" action='${actionName}'>
				<input id='pageInput' type='hidden' name='pageNum'> 
				<input type='hidden' name='sType' value='${sType}'> 
				<input type='hidden' name='keyword' value='${keyword}'>
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


<script src="/resources/admin/js/admin/listJs.js"></script>
<%@include file="footer.jsp"%>