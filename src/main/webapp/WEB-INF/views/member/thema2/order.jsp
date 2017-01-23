<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>
<%@include file="header.jsp"%>
<style>
ul.unit li {
    display: inline-block;
    width: 15%;
    float: left;
}
ul.cart-header li{
    display: inline-block;
    width: 14%;
    float: left;
}

</style>
<div class="ckeckout">
	<div class="container">
		<div class="ckeckout-top">
			<div class=" cart-items heading">
				<h3>Order</h3>
				<div class="in-check">
					<ul class="unit">
						<li><span>Item</span></li>
						<li><span>Product Name</span></li>
						<li><span>Unit Price</span></li>
						<li><span>Quantity</span></li>
						<li><span>Total</span></li>
						<li><span>Delivery</span></li>
						<div class="clearfix"></div>
					</ul>
				<c:forEach items="${order}" var="vo">
               	<ul class="cart-header" id="${vo.odno}">
                  <li class="ring-in"><a href="#"><img style="width:50%;" src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></a></li>
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
               </c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- <div class="container">
	<div class="contact-bottom">
		<div class="col-md-6 contact-left">
			<form>
				<input type="text" placeholder="Name" required=""> 
				<input type="text" placeholder="Address" required=""> 
				<input type="text" placeholder="Phone" required="">
			</form>
		</div>
		<div class="col-md-6 contact-left">
			<form>
				<textarea placeholder="Message"></textarea>
				<input type="submit" value="SEND">
			</form>
		</div>
		<div class="clearfix"></div>
	</div>
</div> -->
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
</body>
</html>