<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<body>
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
				<h2>
					<span>Products</span>
				</h2>
				<br>
				<div class="row">
					<div class="col-sm-4"
						style="background-color: lavender; cursor: pointer" id="high">High
						Price</div>
					<div class="col-sm-4"
						style="background-color: lavenderblush; cursor: pointer" id="low">Low
						Price</div>
					<div class="col-sm-4"
						style="background-color: lavender; cursor: pointer" id="color">Color</div>
				</div>
				<div class='row' style="display: none" id="colorbox">
					<br>
					<div class="col-sm-16">
						<image src='/resources/themes/thema3/images/color_info/red.jpg' class='colorInfo' id='red' />
						<image src='/resources/themes/thema3/images/color_info/orange.jpg' class='colorInfo'
							id='orange' />
						<image src='/resources/themes/thema3/images/color_info/yellow.jpg' class='colorInfo'
							id='yellow' />
						<image src='/resources/themes/thema3/images/color_info/green.jpg' class='colorInfo'
							id='green' />
						<image src='/resources/themes/thema3/images/color_info/blue.jpg' class='colorInfo'
							id='blue' />
						<image src='/resources/themes/thema3/images/color_info/navy.jpg' class='colorInfo'
							id='navy' />
						<image src='/resources/themes/thema3/images/color_info/purple.jpg' class='colorInfo'
							id='purple' />
						<image src='/resources/themes/thema3/images/color_info/pink.jpg' class='colorInfo'
							id='pink' />
						<image src='/resources/themes/thema3/images/color_info/beige.jpg' class='colorInfo'
							id='beige' />
						<image src='/resources/themes/thema3/images/color_info/brown.jpg' class='colorInfo'
							id='brown' />
						<image src='/resources/themes/thema3/images/color_info/gray.jpg' class='colorInfo'
							id='gray' />
						<image src='/resources/themes/thema3/images/color_info/white.jpg' class='colorInfo'
							id='white' />
						<image src='/resources/themes/thema3/images/color_info/black.jpg' class='colorInfo'
							id='black' />
						<image src='/resources/themes/thema3/images/color_info/etc.jpg' class='colorInfo' id='etc' />
					</div>
				</div>
			</div>

		</div>

		<div class="row">
		
		<c:if test="${'[null]' ne list}">
			<c:forEach items="${list}" var="vo">
					<!--상품 한개 시작-->
				<div class="col-md-4">
						<div class="fh5co-blog animate-box">
							<a href="view?shopname=${param.shopname}&pno=${vo.pno}&pageNum=${pageNum}&jspName=/${actionName}&sType=${sType}&keyword=${keyword}""><img class="img-responsive"
								src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt=""
								style="width: 400px; height: 400px;"></a>
							<div class="blog-text text-center">
								<ul class="fh5co-social-icons">
									<li>${vo.pname}</li>
									<li>￦${vo.price}</li>
								</ul>
								<ul class="fh5co-social-icons" style='margin-left: 25%;'>
									<li style='float:left;'><a href="#"><i class="icon-shopping-cart"></i></a></li>
									<li style='float:left;'><a href="view"><i class="glyphicon glyphicon-search"></i></a></li>
									<li style='float:left;'><a href="#"><i class="	material-icons">copyright</i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!--상품끝-->
				</c:forEach>
			</c:if>
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
<!--pageNum  End-->

</body>
<%@include file="footer.jsp"%>
<script>
	$("#color").click(function () {
		$("#colorbox").show();
	});
</script>

</html>