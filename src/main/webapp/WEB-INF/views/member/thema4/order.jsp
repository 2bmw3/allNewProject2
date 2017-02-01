<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="header.jsp"%>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<body class="shopping_cart_page">

  <!-- Main Container -->
  <section class="main-container col1-layout wow bounceInUp animated">
    <div class="main container">
      <div class="col-main">
        <div class="cart">
          <div class="page-content page-order">
            <div class="order-detail-content">
              <div class="table-responsive">
                <table class="table table-bordered cart_summary">   
                 <thead>
                      <tr>
                        <th></th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Delivery</th>
                        <th></th>
                      </tr>
                    </thead>                           
                  <tbody>
                     <c:forEach items="${order}" var="vo">
                      <tr class="cartList" id="${vo.odno}">  		
                        <td><a href="#"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></a></td>
                        <td><a class="aa-cart-title">${vo.pname}</a>
                        	<a> / ${vo.picolor} / ${vo.pisize}</a></td>
                        <td>￦ ${vo.price}</td>
                        <td>${vo.ocnt}</td>
                        <td class="ccnt">￦  ${vo.price * vo.ocnt}</td>
                        <td><c:set var="name" value="${vo.ostatus}" />
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
                        </c:choose></td>
                        <td id="out" ><input type="hidden" value='${vo.odno}' id="odno"> <a
                         style="cursor: pointer">Arrival of goods</a>
                        </td>
                      </tr>
                      </c:forEach>
                      </tbody>    
                </table>
              </div>        
        </div>
      </div>
    </div>
  </section>
  <script>
  $(document).on("click",'#out', function() {
	    var odno = $(this)[0].childNodes[0].value; 
	    console.log(odno);
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
	       $.ajax({
	          url : "/member/memberOrderAction",
	          data :  {"odno":odno},
	          dataType : "JSON",
	          type : "post",
	          complete:  $("#" + odno).remove()
	       });//end  Ajax
	      

	    });
	 });
  </script>
  
<%@include file="footer.jsp"%>