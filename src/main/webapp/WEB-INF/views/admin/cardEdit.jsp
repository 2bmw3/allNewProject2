<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- card Edit style -->
<style>
.cardBackground {
	width: 400px;
	height: 350px;
	position: absolute;
}

.cardBackground .titleImg {
	position: absolute;
	left: 57%;
	top: 8%;
}

.cardBackground .logoImg {
	margin-top: -30%; margin-left : 10%;
	position: absolute;
	left: 22%;
	top: 40%;
	border-radius: 70px;
	margin-left: 10%;
}

.cardBackground .editText {
	margin-top: 8%;
	position: absolute;
	width: 130px;
	font-size: 12px;
}

.cardBackground .productInfo {
	margin-top: 0%; margin-left : -15%;
	position: absolute;
	width: 130px;
	margin-left: -15%;
}

.cardBackground .guide {
	margin-top: 0%; margin-left : -35%;
	position: absolute;
	width: 160px;
}
</style>


<%@include file="header.jsp"%>


<!-- list start -->
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Card Edit</h1>
		</div>

		<div class="col-sm-12">
			<!--LATEST ARRIVALS -->
			<div class="features_items" style='margin-top: -73px;'>			
				<!-- 상품 1개 -->
				<br> <br>
				<div class="single-products col-md-10"
					style="margin-top: 2%; margin-left: -5%;">
					<div class="productinfo text-center">
						<c:if test="${'[null]' ne list}">
							<c:forEach items="${list}" var="vo" varStatus="status">

								<div class="col-md-6 cardBackground">
									<img src='/resources/admin/images/card/card.png'
										style="width: 400px; height: 300px;">

									<div class='logoImg'
										style="font-size: 15px; margin-left: -11%;">
										<img style='width: 135px; height: 135px;'
											src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shoplogo%2F${shoplogo}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e' />
										<!-- 												src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/shoplogo%2Fc480f8e9-728a-dc66-249d-dde279ba807e_logo.gif?alt=media&token=303a7418-ab40-40df-947c-15f4d1a25591'> -->
										<div class="editText">
											<p>Tel . ${phonenumber}</p>
											<p>Address . ${shopaddress}</p>
										</div>
									</div>

									<div class='titleImg' style="margin-left: 5%;">
										<div class="guide">
											<p style="font-size: 8px; margin-top: -10%;">※카드를 가이드라인에 맞춰주세요!!</p>
										</div>
										<img style='width: 100px; height: 120px;'
											src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e">
										<div class="productInfo">
											<p style="font-size: 12px;">${vo.pname}</p>
											<p style="font-size: 12px;">￦ ${vo.price}</p>
											<p style="font-size: 12px;">${colorCnt[status.count - 1]}color/
												${sizeCnt[status.count - 1]} size</p>
											<p style="font-size: 16px;">#${vo.pno}&nbsp;&nbsp;${shopname}</p>
										</div>
									</div>
								</div>
							</c:forEach>
					</div>
					</c:if>
				</div>
			</div>
			<!-- 상품 1개 끝 -->
		</div>
	</div>
</div>
			<c:if test="${total>9}">
			<div class="pagination-area" style="margin-left: 55%; margin-top: -180px;">
			<form id='pageNumForm' method="get" action='${actionName}'>
 				<input id='pageInput' type='hidden' name='pageNum'> 
			</form>
 			<ul class="pagination">
 				<!-- 이전 페이지가 있을 경우 -->
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
<!-- 				<!— 다음 페이지가 있을 경우 —> -->
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


<!--  pageNum  End -->
<script src="/resources/admin/js/admin/listJs.js"></script>
<%@include file="footer.jsp"%>