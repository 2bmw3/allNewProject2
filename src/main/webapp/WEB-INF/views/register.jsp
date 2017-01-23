<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register page</title>
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/admin/css/register.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/admin/css/magnific-popup.css"> 
</head>
<body>

<form id="msform" method="post" action="/registerAction" >

	<ul id="progressbar">
		<li class="active">Default information</li>
		<li>Detail information</li>
		<li>Themes select</li>
	</ul>
	<!-- fieldsets -->
	<fieldset>
		<h2 class="fs-title">Welcome to join us!</h2>
		<h3 class="fs-subtitle">Please insert you're ID & PW</h3>
		<input type="text" id="inputId" name="adminid" placeholder="Id" style="width: 85%; float: left;"/>
		<i id="idCheck" class="fa fa-check-square-o"></i>
		<input type="password" id="adminpw" name="adminpw" placeholder="Password" /> 
		<input type="password" id="adminpwCheck" placeholder="Confirm password" /> 
		<input type="button" id="firstNextBtn" name="next" class="action-button" value="Next" />
	</fieldset>

	<fieldset>
		<h2 class="fs-title">Detail information</h2>
		<h3 class="fs-subtitle">Please insert you're detail information</h3>
		<input type="text" name="aname" placeholder="Name" /> 
		<input type="text" name="aemail" placeholder="E-mail" /> 
		<input type="text" name="aphonenumber" placeholder="Phone number" /> 
		<input type="text" name="shopname" placeholder="Shop name" /> 
		<input type="text" name="aaddress" placeholder="Shop address" /> 
		<input type="text" name="businessnum" placeholder="Business number" />
		<h5>Shop logo</h5>
		<input type="file" id="logoImg" /> 
		<input type="hidden" id="logoImgName" name="shoplogo">
		<input type="button" name="previous" class="previous action-button" value="Previous" /> 
		<input type="button" id='secondNextBtn' name="next" class="next action-button" value="Next" />
	</fieldset>

	<fieldset>
		<h2 class="fs-title">Choose your favorite themes</h2>
		<h3 id="themaText" class="fs-subtitle">You choose Thema : </h3>
		<div class="popup-gallery">
			<a href="/resources/indexImg/index1.png" title="Thema1">
			<img src="/resources/indexImg/index1.png" class="thmeaImg" name="1"></a>
			<a href="/resources/indexImg/index2.png" title="Thema2">
			<img src="/resources/indexImg/index2.png" class="thmeaImg" name="2"></a>
			<a href="/resources/indexImg/index3.png" title="Thema3">
			<img src="/resources/indexImg/index3.png" class="thmeaImg" name="3"></a>
			<a href="/resources/indexImg/index4.png" title="Thema4">
			<img src="/resources/indexImg/index4.png" class="thmeaImg" name="4"></a>
		</div>

		<input type="hidden" id='thema' name="thema">
		<input type="hidden" id='titleimg' name='titleimg'>
		<input type="button" name="previous" class="previous action-button"	value="Previous" /> 
		<button id='formSubmit' class="action-button">Join us</button>
	</fieldset>
</form>

</body>
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/admin/js/register.js"></script>
<script src="/resources/admin/js/jquery.magnific-popup.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>

<script>

	// id 중복체크 여부 확인
	var idCheckResult = "F";

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
	
	
	// start prevent Enter key
	$(function() {
		$("input:text").keydown(function(evt) {
			if (evt.keyCode == 13)
				return false;
		});
	});// end prevent Enter key
	

	// 2번째 페이지 작성 완료하면 shoplogo firebase upload
	$("#secondNextBtn").on("click", function() {
		var file= $("#logoImg")[0].files[0];
		var uuidFileName = guid() + "_" + file.name;
		$("#logoImgName").val(uuidFileName);
		
		var upload = storage.ref().child("shoplogo/" +uuidFileName);
        var uploadTask = upload.put(file);

        uploadTask.on('state_changed', function(snapshot){
        }, function(error) {
        }, function() {
            var downloadURL = uploadTask.snapshot.downloadURL;
        });
	});// end shoplogo firebase upload
	
	
	//start choice themaEvent
	$(".thmeaImg").on("click", function(){
		var images = $("img");
		var themaNumber = $(this)[0].name;
		$('.popup-gallery').magnificPopup({
			delegate: 'a',
			type: 'image',
			tLoading: 'Loading image #%curr%...',
			mainClass: 'mfp-img-mobile',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1] 
			},
			image: {
				tError: '<a href="%url%">The image #%curr%</a> could not be loaded.'
			}
		});
		$("#thema").val(themaNumber);
		var titleImgURL = "https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/titleimg%2Findex"
							+ themaNumber + ".png?alt=media&token=0fed3241-3d4b-496d-9cf9-75ef18af1beb";
		$("#titleimg").val(titleImgURL);
		for(var i = 0 ; i < images.length; i ++ ){
			images[i].className = "thmeaImg";			
		}
		$(this)[0].className="thmeaImgChoose";
		$("#themaText")[0].innerHTML = "You choose Thema : <b>Thema " + themaNumber + "<b>";
	});// end choice themaEvent
	
	
	// 아이디 중복체크
	$("#idCheck").on("click", function() {

		var inputId = $("#inputId").val();
		var sendData = "adminid="+inputId;

		$.ajax({
			url : "/idCheck",
			data : sendData,
			dataType : 'text',
			type : "get",
			contentType : false,
			processData : false,
			success : function(result) {

				if (result != "") {
					swal("중복된 아이디 입니다 !", "", "error");
					$("#inputId").val("");
				} else if (inputId == "") {
					swal("아이디를 입력해주세요 !");
				} else {
					swal("사용 가능합니다 !", "", "success");
					idCheckResult = "T";
				}
			}// end success
		});// end ajax
	});// end idCeheck function
	
	
	
	//start pwCheck event
	$("#firstNextBtn").on("click", function(){
		animating = false;
		var adminpw = $("#adminpw");
		var adminpwCheck = $("#adminpwCheck");
		
		if(idCheckResult == "F" ){
			swal("아이디 중복체크를 해주세요!","", "error");
		} else if(adminpw.val() == "" || adminpwCheck.val()=="" ){
			swal("비밀번호를 입력해주세요!","", "error");
		} else if ( adminpw.val() == adminpwCheck.val() ) {
			swal("비밀번호가 일치합니다 !", "", "success");
			
			 if(animating) return false;
			    animating = true;
	
			    current_fs = $(this).parent();
			    next_fs = $(this).parent().next();
	
			    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
			    next_fs.show();
			    current_fs.animate({opacity: 0}, {
			        step: function(now, mx) {
			            scale = 1 - (1 - now) * 0.2;
			            left = (now * 50)+"%";
			            opacity = 1 - now;
			            current_fs.css({
			                'transform': 'scale('+scale+')',
			                'position': 'absolute'
			            });
			            next_fs.css({'left': left, 'opacity': opacity});
			        },
			        duration: 800,
			        complete: function(){
			            current_fs.hide();
			            animating = false;
			        },
			        easing: 'easeInOutBack'
			    });
		} else {
			swal("비밀번호를 확인해주세요!","", "error");
			adminpw.val("");
			adminpwCheck.val("");
		}
	});// end pwCheck event

</script>


</html>