<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="header.jsp"%>

<!-- product category -->
<section id="aa-product-details">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="aa-product-details-area">
				<div class="aa-product-details-content">
					<div class="row">
						<!-- Modal view slider -->
						<div class="col-md-5 col-sm-5 col-xs-12">
							<div class="aa-product-view-slider">
								<div id="demo-1" class="simpleLens-gallery-container">
									<div class="simpleLens-container">
										<div class="simpleLens-big-image-container">
											<a
												data-lens-image="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${view[0].ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"
												class="simpleLens-lens-image"> <img
												style="width: 600px; height: 400px"
												src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${view[0].ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"
												class="simpleLens-big-image">
											</a>
										</div>
									</div>
									<div class="simpleLens-thumbnails-container">
										<div class="item active" style="margin-left: 28px;">
											<c:set var="viewtotal">${fn.length(view) }</c:set>

											<c:set var="count">5</c:set>
											<c:forEach items="${view}" var="vo" varStatus="status">
												<c:if test="${status.count==count}">
										</div>
										<div class="item" style="margin-left: 28px;">
											<c:set var="count">${count+4 }</c:set>
											</c:if>
											<a
												data-big-image="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"
												data-lens-image="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"
												class="simpleLens-thumbnail-wrapper" href="#"> <img
												style='width: 75px; height: 75px;'
												src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e">
											</a>

											<c:if test="${status.count == viewtotal}">
											</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal view content -->
						<div class="col-md-7 col-sm-7 col-xs-12" >
							<div class="aa-product-view-content" style="margin-left:5%;">
								<div class="product-information" >

									<!--/product-information-->
										<h2>${view[0].pname}</h2>
										<p>
											<b>GENDER :</b> ${view[0].pgender}
										</p>
										<p>
											<b>KIND :</b> ${view[0].pkind}
										</p>
										<p>
											<b>SALES RATE :</b> ${view[0].sellcnt}
										</p>
										<p>
											<b>PRICE :</b> ${view[0].price}
										</p>
								</div>
								<h4>Color</h4>
								<c:forEach items="${infoColor}" var="vo" varStatus="status">
									<image style="border-width : 1px; margin-top:1%; border-style : solid;"
										src='/resources/admin/images/color_info/${vo.picolor}.jpg'
										class='colorInfo' name ='${vo.picolor}' />
								</c:forEach>
								<h4>Size</h4>
								<div class="aa-prod-view-size size">
									<h5>&nbsp;&nbsp;&nbsp;색상을 선택 해주세요</h5>
								</div>
								&nbsp;
								<div class="input-group col-md-3">
									<span class="input-group-btn">
										<button type="button" class="btn btn-danger btn-number minus"
											data-type="minus" data-field="quant[2]">
											<span class="glyphicon glyphicon-minus"></span>
										</button>
									</span> <input type="text" name="quant[2]" id="quantity"
										class="form-control input-number" value="1" min="1" max="10">
									<span class="input-group-btn">
										<button type="button" class="btn btn-success btn-number plus"
											data-type="plus" data-field="quant[2]">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
								<div class="aa-prod-view-bottom">
									<a class="aa-add-to-cart-btn" href="#" id='cart'>Add To
										Cart</a>
										<a class="aa-add-to-cart-btn" href="#" id='order'>Check Out</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="aa-product-details-bottom">
					<ul class="nav nav-tabs" id="myTab2">
						<li><a href="#detailView" data-toggle="tab">Detail View</a></li>
						<li><a href="#qna" data-toggle="tab">QnA</a></li>
						<li><a href="#review" data-toggle="tab">Reviews</a></li>
					</ul>


					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="detailView">
							<div class="pcontent" style="margin-left: 4%; margin-top: 5%">
								<div class="col-sm-12">${view[0].pcontent}</div>
							</div>
						</div>

			<div class="tab-pane fade" id="qna">
				<h2>QnA</h2>
							
				<!--  QnA start -->
				  <div class="panel-group" id="accordion" style="margin-top: 2%;">
				   <c:forEach items="${qna}" var="qvo">		    
				    <div class="panel panel-default">
				      <div class="panel-heading show">
				        <h4 class="panel-title">
				          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${qvo.qno}">
				          	<i class="fa fa-lock" >  비공개 글입니다</i></a>
				        </h4>
				      </div>
				      <div id="collapse${qvo.qno}" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<input type="text" id='questionPwcheck' maxlength="4" 
				        	placeholder='비밀번호를 입력해주세요' style="width: 70%;">
				        	<input id='questionPwcheckBtn' type="submit" class="btn btn-primary" value="확인" name="${qvo.qno}">
				        	<input type="hidden" value="${qvo.qcontent}">
				        	
					        </div>
					        <div class="panel-footer">${qvo.qwriter} / ${qvo.qregdate}</div>
					      </div>
					    </div>
					   </c:forEach>
					  </div>
					  <!-- QnA end --> 
					  <div class="row">
						<div class="col-sm-6">
						<input type="text" id='qwriter' name='qwriter' placeholder="Writer">
						</div>
						<div class="col-sm-3">
						<input type="password" id='qpw' name='qpw' placeholder="Password" maxlength="4">
						</div>
					</div>
					<textarea id='qcontent' name="qcontent" 
					style="height: 100px; width:100%;" placeholder='질문을 입력해주세요'></textarea>
					<input id='qsubmit' type="submit" class="btn btn-primary" value="Submit">
				</div>
					

				<!-- review start -->
				<div class="tab-pane fade " id="review">
					<div class="aa-product-review-area">
						<ul class="aa-review-nav">
							<li>
								<div class="media">
									<h4 id='emptyReview'>리뷰가 아직 없어요 ㅠㅠ 리뷰를 남겨주세요!</h4>
										<div class="col-md-12">
											<div class="tab-pane active in fade" id="review">
												<div class="panel-group addReview" id="accordion">
													<c:forEach items="${review}" var="rvo">
										
													<!-- review display -->
													<div class="panel panel-default">
														<div class="panel-heading showReview">
															<a data-toggle="collapse" data-parent="#accordion" href="#faq-sub${rvo.rno}">
																<h4 class="panel-title">
																${rvo.userid}님의 리뷰 &nbsp;&nbsp; (${rvo.rgrade})점
																	 <span class="pull-right">
																	${rvo.rregdate}
																	</span>
																</h4>
															</a>
														</div>
														<div id="faq-sub${rvo.rno}" class="panel-collapse collapse">
															<div class="panel-body">
															<h4>${rvo.rcontent}</h4>
																<img class = 'reviewImg' 
																src=
																'https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/review%2F
																${rvo.rphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e'
																 style = 'width:300px; height:300px;'>
																</div>
														</div>
													</div>
													<!-- review display end-->
												</c:forEach>
														
												</div>
											</div>
										</div>
								</div>
							</li>
						</ul>
						<!-- review form -->
						<form action="" class="aa-review-form">
							<div class="form-group">
								<span class="star-input" >
								  <span class="input">
								    <input type="radio" name="star-input" id="p2" value="1"><label for="p2">1</label>
								    <input type="radio" name="star-input" id="p4" value="2"><label for="p4">2</label>
								    <input type="radio" name="star-input" id="p6" value="3"><label for="p6">3</label>
								    <input type="radio" name="star-input" id="p8" value="4"><label for="p8">4</label>
								    <input type="radio" name="star-input" id="p10" value="5"><label for="p10">5</label>
								
								  </span>
								  <output for="star-input" ><b>0</b>점</output>
								</span>
								<textarea class="form-control" rows="3" id="reContent"></textarea>
								<input type='hidden' id='rePhoto' name = 'rphoto'> 
								<input type='file' id = 'photoFile'/>
							</div>
							<button class="btn btn-default aa-review-submit" id = 'reviewBtn'>Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>


				<!-- Related product -->
				<div class="aa-product-related-item">
					<h3>Related Products</h3>
					<ul class="aa-product-catg aa-related-item-slider">

						<!-- start single product item -->
						<li><figure> <a class="aa-product-img" href="#"><img
								src="/resources/themes/thema1/img/women/girl-7.png"
								alt="polo shirt img"></a> <a class="aa-add-card-btn" href="#"><span
								class="fa fa-shopping-cart"></span>Add To Cart</a> <figcaption>
							<h4 class="aa-product-title">
								<a href="#">This is Title</a>
							</h4>
							<span class="aa-product-price">$45.50</span> <span
								class="aa-product-price"><del>$65.50</del></span> </figcaption> </figure>
							<div class="aa-product-hvr-content">
								<a href="#" data-toggle="tooltip" data-placement="top"
									title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
								<a href="#" data-toggle="tooltip" data-placement="top"
									title="Compare"><span class="fa fa-exchange"></span></a> <a
									href="#" data-toggle2="tooltip" data-placement="top"
									title="Quick View" data-toggle="modal"
									data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
							</div> <!-- product badge --> <span class="aa-badge aa-sale" href="#">SALE!</span>
						</li>
					</ul>
					<!-- quick view modal -->
					<div class="modal fade" id="quick-view-modal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<div class="row">

										<!-- Modal view slider -->
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="aa-product-view-slider">
												<div class="simpleLens-gallery-container" id="demo-1">
													<div class="simpleLens-container">
														<div class="simpleLens-big-image-container">
															<a class="simpleLens-lens-image"
																data-lens-image="/resources/themes/thema1/img/view-slider/large/girl-1.png">
																<img
																src="/resources/themes/thema1/img/view-slider/medium/girl-1.png"
																class="simpleLens-big-image">
															</a>
														</div>
													</div>
													<div class="simpleLens-thumbnails-container">
														<a href="#" class="simpleLens-thumbnail-wrapper"
															data-lens-image="/resources/themes/thema1/img/view-slider/large/girl-1.png"
															data-big-image="/resources/themes/thema1/img/view-slider/medium/girl-1.png">
															<img
															src="/resources/themes/thema1/img/view-slider/thumbnail/girl-1.png">
														</a> <a href="#" class="simpleLens-thumbnail-wrapper"
															data-lens-image="/resources/themes/thema1/img/view-slider/large/girl-1.png"
															data-big-image="/resources/themes/thema1/img/view-slider/medium/girl-1.png">
															<img
															src="/resources/themes/thema1/img/view-slider/thumbnail/girl-1.png">
														</a>
													</div>
												</div>
											</div>
										</div>
										<!-- Modal view content -->
										<div class="col-md-6 col-sm-6 col-xs-12">
											<div class="aa-product-view-content">
												<h3>T-Shirt</h3>
												<div class="aa-price-block">
													<span class="aa-product-view-price">$34.99</span>
													<p class="aa-product-avilability">
														Avilability: <span>In stock</span>
													</p>
												</div>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Officiis animi, veritatis quae repudiandae quod nulla
													porro quidem, itaque quis quaerat!</p>
												<h4>Size</h4>
												<div class="aa-prod-view-size">
													<a href="#">S</a> <a href="#">M</a> <a href="#">L</a> <a
														href="#">XL</a>
												</div>
												<div class="aa-prod-quantity">
													<form action="">
														<select name="" id="">
															<option value="0" selected="1">1</option>
															<option value="1">2</option>
															<option value="2">3</option>
															<option value="3">4</option>
															<option value="4">5</option>
															<option value="5">6</option>
														</select>
													</form>
													<p class="aa-prod-category">
														Category: <a href="#">Polo T-Shirt</a>
													</p>
												</div>
												<div class="aa-prod-view-bottom">
													<a href="#" class="aa-add-to-cart-btn"><span
														class="fa fa-shopping-cart"></span>Add To Cart</a> <a href="#"
														class="aa-add-to-cart-btn">View Details</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!— /.modal-content —>
						</div>
						<!— /.modal-dialog —>
					</div>
					<!— / quick view modal —>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>
<!— / product category —>
	<script>
	
	var ccnt = null;
	var color = null;
	var pno = ${view[0].pno};
	var size = null;
	var adminid = "${view[0].adminid}";
	var emptyReview = $('#emptyReview');
	var userid = "testUser";
		
	console.log($('.showReview').length);
	if($('.showReview').length > 0){
		emptyReview.hide();
	};
	
	/* for firebase upload */
	var config = {
		apiKey : "AIzaSyCCPgBU1lxPq7PVclQyoN5lUX3nFgtXClQ",
		authDomain : "project-26bd6.firebaseapp.com",
		databaseURL : "https://project-26bd6.firebaseio.com",
		storageBucket : "project-26bd6.appspot.com",
		messagingSenderId : "544848311496"
	};

	firebase.initializeApp(config);
	var storage = firebase.storage();
	var storageRef = storage.ref();
	/* for firebase upload */
	
	//uuid create
	function guid() {
		function s4() { 
			return ((1 + Math.random()) * 0x10000 | 0).toString(16)
					.substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4()
				+ s4() + s4();
	}// end uuid create
	
	
	$('.panel-heading').on('click', function () {
		console.log("왜애");
	});
	
	/* 리뷰 버튼 이벤트 시작  */ 
	$('#reviewBtn').on('click', function () {
		event.preventDefault();
		var rcontent = $('#reContent')[0].value;
		var rphoto = $('#rePhoto');
		var rgrade = $('[name="star-input"]:checked').val();
		var file= $("#photoFile")[0].files[0];
		var uuidFileName = guid() + "_" + file.name;
		
		rphoto.val(uuidFileName);
		
		
		var upload = storage.ref().child("review/" +uuidFileName);
        
		
		var formData = {"rcontent":rcontent, "pno":pno, "userid":userid,"rgrade":rgrade, "rphoto":rphoto.val()};
		
		console.log(formData);
		
		 $.ajax({      
		    	url: "/review", 
		        data: formData, 
		        dataType: "text",
		        type:"post",
		        success:function(data){
		        	var uploadTask = upload.put(file);
					var rno = data.split("#")[0];
					var date = data.split("#")[1];
					
					
		        	uploadTask.on('state_changed', function(snapshot){
		            }, function(error) {
		            }, function() {
		                var downloadURL = uploadTask.snapshot.downloadURL;
			        	emptyReview.hide();
		 				
		 				var writeStr = "<div class='panel panel-default'><div class='panel-heading'>"
		 					+"<a data-toggle='collapse' data-parent='#accordion' href='#faq-sub"
				        	+rno+"'><h4 class='panel-title'> "
				        	+userid+"님의 리뷰&nbsp;&nbsp;("
				        	+rgrade+")점<span class='pull-right'>"+date+"</span></h4></a></div><div id='faq-sub"
				        	+rno+"' class='panel-collapse collapse'><div class='panel-body'><h4>"
				        	+rcontent+"</h4><img class='reviewImg' src='"
				        	+downloadURL+"'style='width: 300px; height: 300px' /></strong></div></div></div></div>";
        	
						$('.addReview').prepend(writeStr);
		            });
 				
		            $('#reContent').val("");
		            $("#photoFile").val("");
	        	}
		    }); 
		    //ajax end
	});
	/* 리뷰 버튼 이벤트 끝! */
	
	
	
	$("#cart").on("click",function(){
		ccnt = $("#quantity").val();
		var formData = {"ccnt":ccnt,"pno":pno,"picolor":color,"pisize":size,"adminid":adminid};
		
		if(ccnt==null || color==null || size==null){
 	     	swal({
	     			title: "상품 상세 정보를 선택해주세요.",
	     	 		text: "",
	     			type: "error",
	     			timer: 1500,
	     			showConfirmButton: false
	     		});
		}else{
			swal({
				  title: "카트에 추가 하시겠습니까?",
				  text: "",
				  type: "info",
				  showCancelButton: true,
				  closeOnConfirm: false,
				  showLoaderOnConfirm: true,
				},
				function(){
				  setTimeout(function(){
					    $.ajax({      
					    	url: "/member/cartAdd", 
					        data: formData, 
					        dataType: "json",
					        type:"post",
					        complete:function(){   
				     	     	swal({
				  	     			title: "해당 상품을 카트에 추가 하였습니다.",
				  	     	 		text: "",
				  	     			type: "success",
				  	     			timer: 1000,
				  	     			showConfirmButton: false
				  	     		});
					        }
					    }); 
					    //ajax end
				  }, 500);
				});

		}//End else
	});
	//order
		$("#order").on("click",function(){
			ccnt = $("#quantity").val();
			var shopname = "${param.shopname}";
			var formData = {"ocnt":ccnt,"pno":pno,"picolor":color,"pisize":size,"adminid":adminid,"shopname":shopname};
			console.log(formData);
			if(ccnt==null || color==null || size==null){
     	     	swal({
  	     			title: "상품 상세 정보를 선택해주세요.",
  	     	 		text: "",
  	     			type: "error",
  	     			timer: 1500,
  	     			showConfirmButton: false
  	     		});
			}else{
				swal({
					  title: "주문 하시겠습니까?",
					  text: "",
					  type: "info",
					  showCancelButton: true,
					  closeOnConfirm: false,
					  showLoaderOnConfirm: true,
					},
					function(){
					  setTimeout(function(){
						    $.ajax({      
						    	url: "/member/orderWrite", 
						        data: formData, 
						        dataType: "json",
						        type:"post",
						        complete:function(){   
					     	     	swal({
					  	     			title: "결제되었습니다",
					  	     	 		text: "",
					  	     			type: "success",
					  	     			timer: 1000,
					  	     			showConfirmButton: false
					  	     		});
					     	     location.href='order?shopname=${param.shopname}';
						        }
						    }); 
						    //ajax end
					  }, 500);
					});
 
			}//End else
		});
	
	
	
	//사이즈 체크시 값 담기
	$(document).on("click",".pisize",function(){
		var thisSize = $(this); 
		size = thisSize.attr('name');
		$(".pisize").css("background-color","");
		thisSize.css("background-color","#922C2C");
	});

	
	// 색상 클릭시 해당 색상의 사이즈 별로 출력
	$(".colorInfo").on("click",function(event){
		size = null;
		$(".colorInfo").css("border-width","1px");
		$(this).css("border-width","5px");
		
		color = $(this).attr("name");
		var formData = {"pno":pno, "picolor":color};
		var str="";
	    $.ajax({      
	    	url: "/member/infoSize", 
	        data: formData, 
	        dataType: "json",
	        type:"get",
	        success:function(data){   
	        	$(".size").empty() ;
	            $.each(data, function(index) {
	                str += "<button style='padding: 5px 10px;' class='pisize' name = '"+ data[index].pisize +"'>" + (data[index].pisize) + "</button>";
	            });
	            $(".size").append(str);
	        }
	    });  
	});
	
	
	
	// 수량 증가 감소
	$(".minus").on("click",function(){
		var qty = $("#quantity").val();
		if(qty>0){
			var cnt = parseInt(qty) - 1; 
			$("#quantity").val(cnt);
		}
	});
	$(".plus").on("click",function(){
		var qty = $("#quantity").val();
		if(qty<10){
			var cnt = parseInt(qty) + 1; 
			$("#quantity").val(cnt);	
		}
	});
	
	//질문 등록!
	$("#qsubmit").on("click",function(){
		
		var qwriter = $("#qwriter").val();
		var qpw = $("#qpw").val();
		var qcontent = $("#qcontent").val();
		var question = {"qwriter" : qwriter, "qpw" : qpw , "qcontent" : qcontent , "pno" : pno };
		
		$.ajax({
			url : "/questionWrite",
			data : question,
			dataType : 'text',
			type : "post",
			success : function(result) {
				var splitResult = result.split("#");
				swal("질문이 성공적으로 등록되었습니다!","","success");
				var str =  "<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'>"
							+"<a data-toggle='collapse' data-parent='#accordion' href='#collapse"
							+splitResult[1]+"'><i class='fa fa-lock' >  비공개 글입니다</i></a>"
							+"</h4></div><div id='collapse"
							+splitResult[1]+"' class='panel-collapse collapse'><div class='panel-body'><input type='text' id='questionPwcheck' maxlength='4' placeholder='비밀번호를 입력해주세요' style='width: 70%;'>"
							+"<input id='questionPwcheckBtn' type='submit' class='btn btn-primary' value='확인' name='"
							+splitResult[1]+"'><input type='hidden' value='"+qcontent+"'></div><div class='panel-footer'>"+qwriter+" / "+splitResult[0]+"</div></div></div>"
				$("#accordion").prepend(str);
			}// end success
		});// end ajax
	});// end question submit
	
	// 질문 비밀번호 체크
	$(document).on('click', "#questionPwcheckBtn" , function(event){
		var qpwCheckBtn = $(this)[0];
		var qno = qpwCheckBtn.name;
		var inputPw = qpwCheckBtn.previousElementSibling.value;
		var qcontent = qpwCheckBtn.nextElementSibling.value;
		var pwCheck = {"qpw":inputPw, "qno":qno};
		
		$.ajax({
			url : "/questionPwCheck",
			data : pwCheck,
			dataType : 'text',
			type : "post",
			success : function(result) {
				var splitResult = result.split("#");
				
				if(splitResult[0] == "F"){
					swal("비밀번호가 틀립니다!","","error");
					$("#questionPwcheck").val("");
				}else if (splitResult[1] == "null"){						
					var str = "<h3>"+qcontent+"</h3>";
					qpwCheckBtn.parentElement.innerHTML = str;						
				}else{
					var qcontentStr = "<h3>"+qcontent+"</h3>"
					var str = "";
					for(var i = 1; i<splitResult.length-1; i++){
						str += "<hr/><b>Re: "+splitResult[i]+"</b>";
					}
					qpwCheckBtn.parentElement.innerHTML = (qcontentStr + str);
				}
			}// end success
		});// end ajax
	});// end questionPw check;
	
</script>


<%@include file="footer.jsp"%>

</html>