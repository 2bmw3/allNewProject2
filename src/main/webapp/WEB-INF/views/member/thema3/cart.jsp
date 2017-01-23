<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
    ul.unit {
        background:lavender;
        padding:1em;

    }
   ul.uli {
       padding:1em;
   }

    ul.unit li {
        display:inline-block;
        width:10%;

        text-align:center;
    }

    ul.uli li {
        display:inline-block;
        width:10%;

        text-align:center;
    }
</style>
<body>
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
				<h2>
					<span>Cart</span>
				</h2>
			</div>
		</div>
		<ul class="unit">
			<li class="li" style="margin-right: 24%;"><b>Product</b></li>
			<li class="li" style="margin-right: 10%"><b>Price</b></li>
			<li class="li" style="margin-right: 10%"><b>Quantity</b></li>
			<li class="li"><b>Total</b></li>
			<div class="clearfix"></div>
		</ul>
		   <form action="/member/orderWrite" method="post" id="cartOrder">
		 <c:forEach items="${cart}" var="vo" varStatus="i">
		<ul class="uli">
			<li><img
				style='width: 100px; height: 100px; margin-right: 10%'
				src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></li>
			<li  style="width:20%; margin-right: 4%;"><p>${vo.pname}</p>
				<h5>${vo.pisize} / ${vo.picolor}</h5></li>
			<li  style="margin-right: 10%"><p>￦  ${vo.price}</p></li>
			<li  style="margin-right: 10%"><input type="number" name="list[${i.index}].ocnt"
				name="quantity" min="1" max="10" style="width: 100%" value="${vo.ccnt}"><input type="hidden"  value='${vo.price}'></li>
			<li ><p>￦  ${vo.price * vo.ccnt}</p></li>
			<li ><a class="remove"href="#"><i class="fa fa-remove" style="color: red"></i><input type="hidden" name="list[${i.index}].cno"  value = '${vo.cno}'  id="cno"></a></li>
			<div class="clearfix"></div>
		</ul>
		
		<hr>
		        <input type="hidden" name="list[${i.index}].pno" value="${vo.pno}">
               	<input type="hidden" name="list[${i.index}].picolor" value="${vo.picolor}">   
               	<input type="hidden" name="list[${i.index}].pisize" value="${vo.pisize}" >
               	<input type="hidden" name="list[${i.index}].adminid" value="${vo.adminid}">               	
               </c:forEach>
               <input type="hidden" name="shopname" value="${cart[0].shopname}">
               <input type="hidden" name="pno" value="${cart[0].pno}">
		</form>
		<ul class="unit">
			<li style="margin-right: 24%;"></li>
			<li style="margin-right: 10%"></li>
			<li style="margin-right: 10%"><b>Total</b></li>
			<c:set var = "sum" value = "0" />
            <c:forEach items="${cart}" var="vo">
            <c:set var= "sum" value="${sum +vo.price * vo.ccnt}"/> 
            </c:forEach>
			<li class="total"><b>￦ <c:out value="${sum}"/></b></li>
			<div class="clearfix"></div>
		</ul>
		<input type="submit" class="btn btn-primary" value="Order"
			style="float: right"  id="order"> <input type="submit"
			class="btn btn-primary" value="Continue Shopping"
			style="float: right">
</body>
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
     	 for(var i =0; i<$(".uli").length; i++){
      		var priceTotal = parseInt($(".uli")[i].childNodes[7].childNodes[1].value);
      		var countTotal = parseInt($(".uli")[i].childNodes[7].childNodes[0].value);
      		totalP += priceTotal*countTotal;	
      		} 
      	$(".total")[0].innerHTML= "<b>￦ " + totalP+"</b>"; 
 });
 //수량 계산
 $(".uli").on("click",function(){
 	var price =  $(this)[0].childNodes[7].childNodes[1].value;
	var count = $(this)[0].childNodes[7].childNodes[0].value;
	var total = count*price;
 	$(this)[0].childNodes[9].innerHTML = "<p>￦ "+ total+"</p>";
 	var totalP = 0;  
 	 for(var i =0; i<$(".uli").length; i++){
 		var priceTotal = parseInt($(".uli")[i].childNodes[7].childNodes[1].value);
 		var countTotal = parseInt($(".uli")[i].childNodes[7].childNodes[0].value);
 		totalP += priceTotal*countTotal;	
 		} 
 	$(".total")[0].innerHTML= "<b>￦ " + totalP+"</b>"; 
 });
 $("#order").on("click",function(){
		$("#cartOrder").submit();
	});
 
 
 </script>
<%@include file="footer.jsp"%>

</html>