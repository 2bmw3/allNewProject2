<%@include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
ul {
	list-style: none;
	margin-bottom: 5%;
}
#li {
	display: inline-block;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 400px;
	height: 400px;
	margin: auto;
}


ul.uli {
	padding: 1em;
}

 ul.uli li { 
 	display: inline-block; 
  	width: 100%;  
/*  	padding-right: 5%;  */
/* 	text-align: center; */
 	margin-bottom: 1%;
}
</style>

<body>
	<div class="container">
		<div class="row animate-box">
			<div class="col-md-12 col-md-offset-0 text-center fh5co-heading">
				<h2>
					<span>View</span>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7  col-md-offset-1" style="margin: 0px">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<c:forEach items="${view}" var="vo" varStatus="status">
							<li id="li" data-target="#myCarousel" data-slide-to="${status}"></li>
						</c:forEach>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${view[0].ptitlephoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e">
						</div>

						  
							<c:forEach items="${view}" var="vo" varStatus="status">
								<div class="item">
									<img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e" />
								</div>
							</c:forEach>
						

						<div class="col-sm-offset-1" style="float: left">
							<a class="left" href="#myCarousel" role="button"
								data-slide="prev"> <span class="glyphicon">&#xe079;</span>
							</a>
						</div>
						<div class="col-sm-1" style="float: right; padding: 0px">
							<a class="right" href="#myCarousel" role="button"
								data-slide="next"> <span class="glyphicon">&#xe080;</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3" style="padding: 0px;">
				<div class="title title-pin text-center">
					<h2>${view[0].pname}</h2>
					<hr>
				</div>
				<section>
				<p>
					<b>Kind:</b> ${view[0].pkind}
				</p>
				<p>
					<b>Price:</b> &nbsp;${view[0].price }원
				</p>
				<p>
					<b>Color:</b> &nbsp;
					<c:forEach items="${infoColor}" var="vo" varStatus="status">
						<image style="border-width : 1px; margin-top:1%; border-style : solid; border-width : 1px;"
								src='/resources/admin/images/color_info/${vo.picolor}.jpg'
								class='colorInfo' name='${vo.picolor}' />
					</c:forEach>
				</p>
				<p>
					<b>Size:</b> &nbsp; 
					<select class="size">
						<option>색상을 선택해 주세요</option>
					</select>
				</p>
				<p>
					<b>Quantity:</b> &nbsp; 
					<input type="number" id="quantity" value='1' name="quantity" min="1" max="10" style="width: 47px; height: 23px;">
				</p>
				</section>

				<hr>
				<input type="submit" id="cart" class="btn btn-primary" value="Add Cart" style="width: 100%"> 
				<input type="submit" id="order"class="btn btn-primary" value="Order" style="width: 100%;">
			</div>
		</div>
		

		<div role="tabpanel">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#description"
					aria-controls="description" role="tab" data-toggle="tab">Description</a></li>
				<li role="presentation"><a href="#qna" aria-controls="qna"
					role="tab" data-toggle="tab">QnA</a></li>
				<li role="presentation"><a href="#review"
					aria-controls="review" role="tab" data-toggle="tab">Review</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="description">
					<div class="col-md-12 col-md-offset-2 ">${view[0].pcontent}</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="qna">
				<div class="col-md-12 ">					
				<!--  QnA start -->
				  <div class="panel-group" id="accordion" style="margin-top: 2%;">
				    		
				   <c:forEach items="${qna}" var="qvo">		    
				    <div class="panel panel-default">
				      <div class="panel-heading">
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
						<hr>
					</div>
					
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
				<div role="tabpanel" class="tab-pane" id="review">
					<div class="col-md-12">	
					  <div class="panel-group" id="reviewList" style="margin-top: 2%;" >				
					<c:forEach items="${review}" var="rvo">		    
				    <div class="panel panel-warning">
				      <div class="panel-heading">
				  		<a data-toggle="collapse" data-parent="#accordion" href="#collapse${rvo.rno}">
				  		<div class="row">
				  			<div class="col-md-9">				  			
				          	<b>${rvo.userid}</b>
				  			</div>
				  			<div class="col-md-1"><span>${rvo.rgrade}</span></div>
				  			<div class="col-md-2"><span>${rvo.rregdate}</span></div>
				  		</div>
				  		</a>    
				      </div>				      
				      <div id="collapse${rvo.rno}" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<ul class="uli">
				        	<li style="width:100%"><img class = 'reviewImg' 
										src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/review%2F${rvo.rphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e'
										 style = 'width:50%;'>	</li>
				        	<li><p>${rvo.rcontent}</p></li>
				        	<div class="clearfix"></div>
				        	</ul>	
				        </div>
						  <div class="panel-footer">In order to be irreplaceable, one must always be different</div>
						 </div>
				 	   </div>
					</c:forEach>						    
						  </div>
						<form>
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
							<input type='hidden' id='rePhoto' name = 'rphoto'> 
							<input type='file' id = 'photoFile'/>
 							<textarea class="form-control" rows="3" id="reContent"></textarea>
 
							<input type="submit" class="btn btn-primary" id = 'reviewBtn' value="Submit">
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
<%@include file="footer.jsp"%>
<script>
	$(document).ready(function() {
		var ccnt = null;
		var color = null;
		var pno = ${view[0].pno};
		var size = null;
		var adminid = "${view[0].adminid}";
		var emptyReview = $('#emptyReview');
		var userid = "test user";
		
			
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
		
		
		/* 리뷰 버튼 이벤트 시작  */ 
		$('#reviewBtn').on('click', function () {
			event.preventDefault();
			var rcontent = $('#reContent')[0].value;
			var rphoto = $('#rePhoto');
			var rgrade = $('[name="star-input"]:checked').val();
			var file= $("#photoFile")[0].files[0];
			var uuidFileName = guid() + "_" + file.name;
			
			rphoto.val(uuidFileName);
			
			console.log("클릭했당");
			//ss
			var upload = storage.ref().child("review/" +uuidFileName);
	        
			
			var formData = {"rcontent":rcontent, "pno":pno, "userid":userid,"rgrade":rgrade, "rphoto":rphoto.val()};
			
			 $.ajax({      
			    	url: "/review", 
			        data: formData, 
			        dataType: "text",
			        type:"post",
			        success:function(date){
			        	console.log(formData);
			        	console.log("성공했댕 확인해방");
			        	var uploadTask = upload.put(file);
			        	var splitResult = date.split("#");
			            uploadTask.on('state_changed', function(snapshot){
			            }, function(error) {
			            }, function() {
			                var downloadURL = uploadTask.snapshot.downloadURL;
			 				$('#reviewList').prepend("<div class='panel panel-warning'><div class='panel-heading'>"
			 					  	+"<a data-toggle='collapse' data-parent='#accordion' href='#collapse'"+splitResult[0]+">"
			 					  	+"<div class='row'><div class='col-md-9'><b>"+userid+"</b></div>"
			 					    +"<div class='col-md-1'><span>"+rgrade+"</span></div>"
			 					  	+"<div class='col-md-2'><span>"+splitResult[1]+"</span></div></div></a></div>"				      
			 					    +"<div id='collapse"+splitResult[0]+"class='panel-collapse collapse'><div class='panel-body'>"
			 					    +"<ul class='uli'><li style='width:100%'><img class = 'reviewImg'" 
			 						+"src="+downloadURL
			 						+"style = 'width:50%;'></li><li><p>"+rcontent+"</p></li><div class='clearfix'></div>"
			 					    +"</ul></div><div class='panel-footer'>In order to be irreplaceable, one must always be different</div>"
			 						+"</div></div>");
			            });
			            $('#reContent').val("");
			            $("#photoFile").val("");
		        		
			        }
			    }); 
			    //ajax end
		});
		/* 리뷰 버튼 이벤트 끝! */
		
		
		
		// 색상 클릭시 해당 색상의 사이즈 별로 출력
		$(".colorInfo").on("click",function(event){
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
		        	str += "<option>--</option>";
		            $.each(data, function(index) {
		                str += "<option>" + data[index].pisize + "</option>";
		            });
		            $(".size").append(str);
		        }
		    });  
		});//end
		
		
		$("#cart").on("click",function(){
			ccnt = $("#quantity").val();
			size = $(".size").val();
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
		});//end 
		$("#order").on("click",function(){
			ccnt = $("#quantity").val();
			var shopname = "${param.shopname}";
			size = $(".size").val();
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
		
		
		// Activate Carousel
		$("#myCarousel").carousel();

		// Enable Carousel Indicators
		$(".item1").click(function() {
			$("#myCarousel").carousel(0);
		});
		$(".item2").click(function() {
			$("#myCarousel").carousel(1);
		});
		$(".item3").click(function() {
			$("#myCarousel").carousel(2);
		});
		$(".item4").click(function() {
			$("#myCarousel").carousel(3);
		});

		// Enable Carousel Controls
		$(".left").click(function() {
			$("#myCarousel").carousel("prev");
		});
		$(".right").click(function() {
			$("#myCarousel").carousel("next");
		});
		
		
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
		
	});
</script>

</html>
