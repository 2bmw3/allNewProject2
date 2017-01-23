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

<div class="ckeckout">
   <div class="container">
      <div class="ckeckout-top">
         <div class=" cart-items heading">
            <h3>Cart</h3>
            <div class="in-check">
               <ul class="unit">                  
                  <li ><span>Item</span></li>
                  <li><span>Product Name</span></li>
                  <li><span>Unit Price</span></li>
                  <li><span>Quantity</span></li>
                  <div class="clearfix"></div>
               </ul>
               <form action="/member/orderWrite" method="post" id="cartOrder">
                 <c:forEach items="${cart}" var="vo" varStatus="i">
               <ul class="cart-header">
                  <li class="ring-in"><a href="#"><img style="width:50%;" src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></a></li>
                  <li><span>${vo.pname} / ${vo.picolor} / ${vo.pisize}</span></li>
                  <li><span>￦ ${vo.price}<input type="hidden" value="${vo.price}"></span></li>
                  <li><span id="ccnt">${vo.ccnt}</span></li>
                  <li  class="ring-in"><a class="remove"href="#"><img src="/resources/themes/thema2/images/close-1.png" style="margin:13%;"><input type="hidden" name="list[${i.index}].cno"  value = '${vo.cno}'  id="cno"></a></li>
                  <div class="clearfix"></div>
               </ul>
               
               	<input type="hidden" name="list[${i.index}].pno" value="${vo.pno}">
               	<input type="hidden" name="list[${i.index}].picolor" value="${vo.picolor}">   
               	<input type="hidden" name="list[${i.index}].pisize" value="${vo.pisize}" >
               	<input type="hidden" name="list[${i.index}].ocnt" value="${vo.ccnt}">
               	<input type="hidden" name="list[${i.index}].adminid" value="${vo.adminid}">
               	
               </c:forEach>
               <input type="hidden" name="shopname" value="${cart[0].shopname}">
               <input type="hidden" name="pno" value="${cart[0].pno}">
               </form>
                <div>
               <h3>Cart Totals</h3>
               <table style='max-width: 100%;'>
                 <tbody>
                   <tr>
                   <c:set var = "sum" value = "0" />
                    <c:forEach items="${cart}" var="vo">
                  		<c:set var= "sum" value="${sum +vo.price * vo.ccnt}"/> 
                    </c:forEach>
                     <th><h4>Total</h4></th>
                     <td class="total"><h4>￦ <c:out value="${sum}"/></h4></td>
                   </tr>
                 </tbody>
               </table>
             </div>
            </div>
            <hr>
            <div class="single-but item_add">
				<input type="submit" id="order" value="Order now">									
			</div>
         </div>
      </div>
   </div>
</div>

<%@include file="footer.jsp"%>
</body>
<script>
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
 	for(var i =0; i<$(".cart-header").length; i++){
 		var priceTotal = parseInt($(".cart-header")[i].childNodes[7].childNodes[0].childNodes[1].value);
 		var countTotal = parseInt($(".cart-header")[i].childNodes[9].childNodes[0].childNodes[0].nodeValue);
 		totalP += priceTotal*countTotal;
 	}
 	
 	$(".total")[0].innerHTML= "<h4>￦ " + totalP+"</h4>";
 });
$("#order").on("click",function(){
	$("#cartOrder").submit();
});
</script>
</html>