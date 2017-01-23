<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
ul.unit {
	background: lavender;
	padding: 1em;
}

ul.uli {
	padding: 1em;
}

ul.unit li {
	display: inline-block;
	width: 13%;
	text-align: center;
}

ul.uli li {
	display: inline-block;
	width: 13%;
	text-align: center;
}
</style>
<body>
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
				<h2>
					<span>Order</span>
				</h2>
			</div>
		</div>
		<ul class="unit">
			<li><b>Item</b></li>
						<li><b>Product Name</b></li>
						<li><b>Unit Price</b></li>
						<li><b>Quantity</b></li>
						<li><b>Total</b></li>
						<li><b>Delivery</b></li>
						<div class="clearfix"></div>
		</ul>
		<c:forEach items="${order}" var="vo">
               	<ul class="uli" id="${vo.odno}">
                  <li class="ring-in"><a href="#"><img style='width: 100px; height: 100px; margin-right: 10%' src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></a></li>
                  <li><span>${vo.pname} / ${vo.picolor} / ${vo.pisize}</span></li>
                  <li><span>￦ ${vo.price}</span></li>
                  <li><span>${vo.ocnt}</span></li>
                   <li><span>￦ ${vo.ocnt * vo.price}</span></li>
                  <li><span><c:set var="name" value="${vo.ostatus}" />
                        <c:choose>
                           <c:when test="${name eq 0}">
                              <i class="material-icons">local_atm</i>
                           </c:when>
                           <c:when test="${name eq 1}">
                              <i class="material-icons">local_atm</i>
                           </c:when>
                           <c:when test="${name eq 2}">
                              <i class="material-icons">local_shipping</i>
                           </c:when>
                           <c:when test="${name eq 3}">
                              <i class="material-icons">home</i>
                           </c:when>
                        </c:choose></span></li>
                         <li><span><input type="hidden" value='${vo.odno}' id="odno"> <a
                         id="out" style="cursor: pointer">Arrival of goods</a></span></li>
                         
                  <div class="clearfix"></div>
               </ul>             
			<hr>
               </c:forEach>
               <ul class="unit">
               <li><b></b></li>
               </ul>
	</div>
</body>
<script>
$(document).on("click",'#out', function() {
    swal({
       title : "잘받으셨나요?",
       text : "기다리기 힘드셨죠",
       type : "warning",
       showCancelButton : true,
       confirmButtonColor : "#8CD4F5",
       confirmButtonText : "만족",
       cancelButtonText : "취소",
       closeOnConfirm : false
    }, function() {
       swal("감사합니다", "자주 만나요", "success");
       var odno = $("#odno").val();

       $.ajax({
          url : "/member/memberOrderAction",
          data : "odno=" + odno,
          dataType : "JSON",
          type : "post",
          complete : $("#" + odno).detach()

       });//end  Ajax
    });
 });
</script>
<%@include file="footer.jsp"%>
</html>