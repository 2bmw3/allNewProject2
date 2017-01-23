<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="header.jsp"%>
<link href="/resources/admin/css/main.css" rel="stylesheet">
   <!-- view start -->
   <div id="page-wrapper">
      <div class="row" >
         <form>
            <div class="col-sm-12" style="margin-top: 5%">
               <section>
               <div class="container">
                  <div class="row">
                     <div>
                        <!--product-details-->
                        <div class="product-details">
                           <div class="col-sm-5">
                              <div class="view-product">
                                 <img class="timg" style='width:400px;height:400px;'
                                    src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${view[0].ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e">
                              </div>
                              <div id="similar-product" class="carousel slide"
                                 data-ride="carousel">

                                 <!-- Wrapper for slides -->
                                 <div class="carousel-inner">
                                    <div class="item active" style="margin-left: 28px;">
                                    <c:set var="viewtotal">${fn.length(view) }</c:set>

                                          <c:set var="count">5</c:set>
                                       <c:forEach items="${view}" var="vo" varStatus="status">
                                          <c:if test="${status.count==count}">
                                    </div>
                                    <div class="item" style="margin-left: 28px;">
                                       <c:set var="count">${count+4 }</c:set>
                                    </c:if>
                                    <a class="img" title="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" style='width:75px;height:75px;'>
                                    <img
                                       src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" style='width:75px;height:75px;'> </a>
                                    <c:if test="${status.count == viewtotal}">
                                 </c:if>
                                 </c:forEach>
                                 </div>
                              </div>
                              <!-- Controls -->
                              <a class="left item-control" href="#similar-product"
                                 data-slide="prev"> <i class="fa fa-angle-left"></i>
                              </a> <a class="right item-control" href="#similar-product"
                                 data-slide="next"> <i class="fa fa-angle-right"></i>
                              </a>

                           </div>

                        </div>

                     <div class="col-sm-4">
                        <div class="product-information">
                           <!--/product-information-->
                           <h2>${view[0].pname}</h2>
                           <p>${view[0].pgender}</p>
                           <span> <span>￦${view[0].price}</span>
                              <p>
                                 <b>종류:</b> ${view[0].pkind}
                              </p>
                              <p>
                                 <b>판매량:</b> ${view[0].sellcnt}
                              </p>
                        </div>
                        <div style="margin-top: 3%; margin-left: 30%">
						<input type="hidden" value="${view[0].pno}"> 
                        <a href="productsUpdate?pno=${view[0].pno}&pageNum=${pageNum}&jspName=${param.jspName}&sType=${param.sType}&keyword=${param.keyword}&ppkind=${param.ppkind}" class="btn btn-default add-to-cart"> <i
                           class="fa fa-pencil" id = 'updateBtn' value='${view[0].pno}'></i>수정
                        </a> <a href="#" class="btn btn-default add-to-cart deleteBtn" data-toggle="tab">
								<i class="fa fa-close"></i>삭제
							</a>
                        
                        </div>
                        <!--/product-information end-->
                     </div>
                     </div>

                     <!--/product-details end-->

                     <!--pcontent-tab-->
                     <div class="pcontent" style="margin-left: 4%; margin-top: 5%">
                        <div class="col-sm-12">${view[0].pcontent}</div>
                     </div>
                     <!--pcontent-tab end-->


                  </div>
               </div>
            </div>
            </section>

            <section>
            <div class="container" style="margin-top: 5%; margin-left: 5%">
               <div class="row">
                  <div>
                     <div class="info">
                        <c:forEach items="${info}" var="pinfo">
                           <div class="col-sm-10">
                              <h5>색상: ${pinfo.picolor} 사이즈: ${pinfo.pisize} 재고량:
                                 ${pinfo.pistock}</h5>
                           </div>
                        </c:forEach>

                     </div>

                  </div>
                  <!--  category end -->
               </div>
            </div>
            </section>

            <section>
            <div class="container" style="margin-top: 5%">
               <div class="row">
                  <div>

                     <!--category-tab-->
                     <div class="category-tab shop-details-tab">
                        <div class="col-sm-10">
                           <ul class="nav nav-tabs">
                              <li><a href="#" id='reviewTab' data-toggle="tab">Review
                                    (${fn:length(review)}) </a></li>
                              <li><a href="#" id='qnaTab' data-toggle="tab">QnA
                                    (${fn:length(qna)}) </a></li>
                           </ul>
                        </div>

                        <c:forEach items="${review}" var="rvo">
                           <!-- review display -->
                           <div class="col-sm-10 showReview">
                              <ul style="background-color: white;">
                                 <li><h3>${rvo.userid}(${rvo.rgrade}점)</h3></li>
                                 <li><h5>${rvo.rcontent}</h5>
                                    <h5>${rvo.rregdate}</h5></li>
                                 <br>
                              </ul>
                           </div>
                           <!-- review display end-->
                        </c:forEach>

                        <c:forEach items="${qna}" var="qvo">
                           <!-- QnA 1개 -->
                           <div class="col-sm-10 showQnA">
                              <ul style="background-color: white;">
                                 <li><h3>${qvo.qwriter}</h3>
                                    <h6>${qvo.qregdate}</h6></li>
                                 <li id='c${qvo.qno}'><h5>${qvo.qcontent}</h5></li>
                                 <c:forEach items="${answer}" var="avo">
                                    <c:if test="${qvo.qno == avo.qno }">
                                       <li><i class="material-icons">subdirectory_arrow_right</i>
                                          RE : ${avo.acontent}</li>
                                    </c:if>
                                 </c:forEach>
                                 <input type='text' id='${qvo.qno}' name='acontent'  placeholder='댓글을 입력하세요' class='col-sm-10'/>
                                 <a href='' class='review' value='${qvo.qno}'
                                    style='margin-left: 800px' data-toggle="tab">댓글쓰기</a>
                                 </li>
                                 <br>
                              </ul>
                           </div>
                        </c:forEach>
                        <!-- QnA 1개  끝-->

                     </div>
                     <!--  category end -->


                  </div>
               </div>
            </div>
            </section>
      </div>
      </form>
   </div>
   </div>

<script src="/resources/admin/js/admin/viewJs.js"></script>
<%@include file="footer.jsp"%>