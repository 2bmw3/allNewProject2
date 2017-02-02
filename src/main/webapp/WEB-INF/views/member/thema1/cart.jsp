<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>  

 <!-- Cart view section -->
 <section id="cart-view">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table">
            <form action="/member/orderWrite" method="post" id="cartOrder">
               <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th></th>
                        <th></th>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                      </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${cart}" var="vo" varStatus="i">
                      <tr class="cartList">  		
                        <td><a class="remove"href="#"><fa class="fa fa-close"></fa><input type="hidden"  name="list[${i.index}].cno"  value = '${vo.cno}'  id="cno"></a></td>
                        
                        <td><a href="#"><img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" alt="img"></a></td>
                        <td>
                        	<a class="aa-cart-title">${vo.pname}</a>
                        	<a> / ${vo.picolor} / ${vo.pisize}</a>
                        </td>
                        <td>￦ ${vo.price}</td>
                        <td class="ccnt"><input id="count" class="aa-cart-quantity"  name="list[${i.index}].ocnt" type="number" value='${vo.ccnt}' min='0'><input type="hidden"  value='${vo.price}'></td>
                        <td >￦  ${vo.price * vo.ccnt}</td>
                      </tr>                       	  
		               	<input type="hidden" name="list[${i.index}].pno" value="${vo.pno}">
		               	<input type="hidden" name="list[${i.index}].picolor" value="${vo.picolor}">   
		               	<input type="hidden" name="list[${i.index}].pisize" value="${vo.pisize}" >	       
		               	<input type="hidden" name="list[${i.index}].adminid" value="${vo.adminid}">              	
               </c:forEach>
               			<tr>
		               <input type="hidden" name="shopname" value="${cart[0].shopname}">
		               <input type="hidden" name="pno" value="${cart[0].pno}">
                      </tr>
                      </tbody>
                  </table>
                </div>
             </form>
             <!-- Cart Total view -->
             <div class="cart-view-total">
               <h4>Cart Totals</h4>
               <table class="aa-totals-table" style='max-width: 100%;'>
                 <tbody>
                   <tr>
                   <c:set var = "sum" value = "0" />
                    <c:forEach items="${cart}" var="vo">
                  <c:set var= "sum" value="${sum +vo.price * vo.ccnt}"/> 
                    </c:forEach>
                     <th>Total</th>
                     <td class="total">￦ <c:out value="${sum}"/></td>
                   </tr>
                 </tbody>
               </table>
             <div class="single-but item_add">
				<button type="submit" class="aa-filter-btn search" id="order" style="width: 200px;">Check Now </button>							
			</div>
             </div>
           </div>
         </div>
       </div>
     </div>
   </div>
 </section>
 <!-- / Cart view section -->
 <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.1.js"></script>



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
     	
     	$(".total")[0].innerHTML= "￦ " + totalP;
 });
 //수량 계산
 $(".cartList").on("click",function(){
	var count = $(this)[0].childNodes[9].childNodes[0].value;
	var price =  $(this)[0].childNodes[9].childNodes[1].value;
	var total = count*price;
 	$(this)[0].childNodes[11].innerHTML = "￦ "+ total;
 	var totalP = 0;
 	for(var i =0; i<$(".cartList").length; i++){
 		var priceTotal = parseInt($(".cartList")[i].childNodes[9].childNodes[1].value);
 		var countTotal = parseInt($(".cartList")[i].childNodes[9].childNodes[0].value);
 		totalP += priceTotal*countTotal;	
 	}
 	
 	$(".total")[0].innerHTML= "￦ " + totalP;
 });
 $("#order").on("click",function(){
	 
	 var totalCnt = "${sum}";
	 var uname = "${memberInfo[0].uname}";
	 var uemail = "${memberInfo[0].uemail}";
	 var uphonenumber = "${memberInfo[0].uphonenumber}";
	 var uaddress = "${memberInfo[0].uaddress}";
	 var shopname = "${param.shopname}"	 
	 var IMP = window.IMP;
		IMP.init('imp67983119');
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : shopname,
		    amount : totalCnt,
		    buyer_email : uemail,
		    buyer_name : uname,
		    buyer_tel : uphonenumber,
		    buyer_addr : uaddress,
		    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				$("#cartOrder").submit();
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		});	
	 
	});
 
 
 </script>

<%@include file="footer.jsp"%>

</html>

