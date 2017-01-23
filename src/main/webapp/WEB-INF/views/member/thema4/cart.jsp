<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@include file="header.jsp"%>

<body class="shopping_cart_page">

  <!-- Main Container -->
  <section class="main-container col1-layout wow bounceInUp animated">
    <div class="main container">
      <div class="col-main">
        <div class="cart">
          <div class="page-content page-order">
            <div class="order-detail-content">
            <form action="/member/orderWrite" method="post" id="cartOrder">  
              <div class="table-responsive">
                <table class="table table-bordered cart_summary">                              
                  <tbody>
					<c:forEach items="${cart}" var="vo" varStatus="i">
                    <tr class="cartList">
                      <td class="cart_product"><a href="#"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></a></td>
                      <td class="cart_description"><p class="product-name"><a href="#">${vo.pname}</a></p>
                        <small><a href="#">Color :  ${vo.picolor}</a></small><br>
                        <small><a href="#">Size :${vo.pisize}</a></small></td>
                      <td class="availability in-stock"><span class="label">In stock</span></td>
                      <td class="price"><span>￦  ${vo.price}</span></td>
                      <td class="qty"><input class="form-control input-sm" type="text" name="list[${i.index}].ocnt"value="${vo.ccnt}"><input type="hidden"  value='${vo.price}'></td>
                      <td class="price"><span>￦  ${vo.price * vo.ccnt}</span></td>
                      <td class="action"><a class="remove"href="#"><i class="icon-close"></i><input type="hidden" name="list[${i.index}].cno" value = '${vo.cno}'  id="cno"></a></td>
                    </tr>
                 <input type="hidden" name="list[${i.index}].pno" value="${vo.pno}">
               	<input type="hidden" name="list[${i.index}].picolor" value="${vo.picolor}">   
               	<input type="hidden" name="list[${i.index}].pisize" value="${vo.pisize}" >
               	<input type="hidden" name="list[${i.index}].adminid" value="${vo.adminid}">               	
               </c:forEach>
               <input type="hidden" name="shopname" value="${cart[0].shopname}">
               <input type="hidden" name="pno" value="${cart[0].pno}">
                  </tbody>             
                  <tfoot>
                  <c:set var = "sum" value = "0" />
		            <c:forEach items="${cart}" var="vo">
		            <c:set var= "sum" value="${sum +vo.price * vo.ccnt}"/> 
		          </c:forEach>
                    <tr>
                      <td colspan="5"><strong>Total</strong></td>
                      <td colspan="2" class="total"><strong>￦ <c:out value="${sum}"/></strong></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
                 </form>
              <div class="cart_navigation"> <a class="continue-btn" href="#"><i class="fa fa-arrow-left"> </i>&nbsp; Continue shopping</a> <a class="checkout-btn" id="order" ><i class="fa fa-check" id="order"></i> Proceed to checkout</a> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
   <script>
   //cart 삭제
   $(".remove").on('click', function(){
  	var cno = $(this)[0].childNodes[1].value;
  	$.ajax({
          url : "/member/cartDelete",
          data : {"cno":cno},
          dataType : "JSON",
          type : "post"
  	});		
          $(this)[0].parentNode.parentNode.remove();
       	var totalP = 0;
       	for(var i =0; i<$(".cartList").length; i++){
       		var priceTotal = parseInt($(".cartList")[i].childNodes[9].childNodes[1].value);
       		var countTotal = parseInt($(".cartList")[i].childNodes[9].childNodes[0].value);
       		totalP += priceTotal*countTotal;	
       	}
       	
       	$(".total")[0].innerHTML= "<strong>￦ " + totalP+"</strong>";
   });
   //수량 계산
   $(".cartList").on("click",function(){
  	var count = $(this)[0].childNodes[9].childNodes[0].value;
  	var price =  $(this)[0].childNodes[9].childNodes[1].value;
  	var total = count*price;
   	$(this)[0].childNodes[11].innerHTML = "<span>￦ "+ total+"</span>";
   	console.log($(".cartList"));
   	var totalP = 0;
   	for(var i =0; i<$(".cartList").length; i++){
   		var priceTotal = parseInt($(".cartList")[i].childNodes[9].childNodes[1].value);
   		var countTotal = parseInt($(".cartList")[i].childNodes[9].childNodes[0].value);
   		totalP += priceTotal*countTotal;	
   	}
   	
   	$(".total")[0].innerHTML= "<strong>￦ " + totalP+"</strong>";
   });
   $("#order").on("click",function(){
		$("#cartOrder").submit();
	});
 
 </script>

<%@include file="footer.jsp"%>