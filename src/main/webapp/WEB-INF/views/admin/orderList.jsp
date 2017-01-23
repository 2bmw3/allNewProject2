<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<body>
	<div id="page-wrapper">
      <div>
         <div class="col-sm-10 col-sm-offset-1" style="margin-left: -1%;">
            <div class="row" style="margin-top: 5%;">
               <div class="col-md-1">번호</div>
               <div class="col-md-4">상품</div>
               <div class="col-md-1"></div>
               <div class="col-md-1">주문자</div>
               <div class="col-md-1">수량</div>
               <div class="col-md-2">주소</div>
               <div class="col-md-1">가격</div>
               <div class="col-md-1">출하</div>
            </div>
            <hr />
            <div id="form" style="padding: 0%; margin: 0%">
               <c:forEach items="${adminOrder}" var="vo">
                  <div class="row" id="${vo.odno}" >
                     <div class="col-md-1" style="padding-right: 0px;">${vo.ono}</div>
                     <div class="col-md-1" style=" padding-left: 0;">
                        <img style='width: 75px; height: 75px;'
                           src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e">
                     </div>
                   <div class="col-md-4" >${vo.pname} / ${vo.pisize}/${vo.picolor} </div>
                  <div class="col-md-1" >${vo.uname}</div>
                  <div class="col-md-1">${vo.ocnt}</div>
                  <div class="col-md-2">${vo.oaddress}</div>
                  <div class="col-md-1">￦${vo.price * vo.ocnt}</div>
                     <div class="col-md-1">
                        <c:set var="name" value="${vo.ostatus}" />
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
                        </c:choose>
                     </div>
                  </div>
                  <hr />
               </c:forEach>
            </div>
            <div div class="col-md-8 col-md-offset-2">
               <button type="button" class="btn btn-primary" id="mBtn"
                  style="width: 100%; background-color: #007FBE;">더 보 기</button>
            </div>
         </div>
         <!-- order end -->
      </div>
   </div>

<script src="/resources/admin/js/admin/orderListJs.js"></script>
<%@include file="footer.jsp"%>
</body>
</html>