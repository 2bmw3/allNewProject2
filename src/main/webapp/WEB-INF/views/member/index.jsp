<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shopping Mall</title>
<meta name="description"
	content="Demo of the tutorial on how to re-create a similar effect of the takeitapp.co website." />
<meta name="keywords"
	content="responsive, grid, polaroid, animation, intro, web design, tutorial, responsive images, srcset" />
<meta name="author" content="Codrops" />
<link href='https://fonts.googleapis.com/css?family=Caveat:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/square-loader.min.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/component.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/member/css/index.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css"
	rel="stylesheet">
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<!-- 구글 비젼에 데이터 요청 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script>
	document.documentElement.className = 'js';
</script>
</head>
<body>
	<div class="view">
		<header class="header"> <nav class="demos"> <a
			class="demos__item demos__item--current" href="member/index"></a> </nav> </header>
		<div id="myModal" class="modal" style="margin-top: -8%;">
			<!-- Modal content -->
			<div class="modal-content" style="width: 40%; height: 98%;">
				<div class="modal-header">
					<span class="close" id="webCamClose">&times;</span>
					<h2>Please put the card on the camera.</h2>
				</div>

				<div class="modal-body">
					<video id="video" width="100%" height="80%" autoplay></video>
					<canvas id="canvas"></canvas>
					<br />
					<div id="ViewTimer"></div>
				</div>
				<div class="modal-footer">
					<h3>won - piece</h3>
				</div>
			</div>
		</div>
		<section class="page page--mover">
		<div class="la-square-loader">
			<div></div>
		</div>
		</section>
		<div class="title-wrap">
			<h3 class="title title--main">
				OH<em>!</em>SNAP
			</h3>
			<p class="title title--sub">Smart Auto-Filtering for your shots.</p>
		</div>
		
			<figure class="pic10 camera" style="margin-left:3.5%;">
			<a href='#' id="myBtn" class='btn-example'> <i
				class="fa fa-camera-retro" style="font-size: 150px;"></i>
			</a> <figcaption>Search Camera</figcaption> 
			<a href='/member/list'> <i
				class="fa fa-list" style="font-size: 150px;"></i>
			</a> <figcaption>All List</figcaption> </figure>
		
		<section class="page page--static">
		<div class="page__title" style="margin-top: -20%;">
			<h2 class="page__title-main">Polaroid Stack to Grid Intro
				Animation</h2>
			<p class="page__title-sub">
				Recreating the effect seen on the <a
					href="http://www.takeitapp.co/en">takeit</a> website
			</p>
		</div>
		<ul class="grid">
			<c:forEach items="${indexList}" var="vo" varStatus="status">
				<li class="grid__item" style="width: 200px; height: 200px;"><figure
						class="pic${status.count}"> <a
						href="thema${vo.thema}/index?shopname=${vo.shopname}"> <img
						style="width: 200px; height: 200px" src="${vo.titleimg}" />
					</a> <figcaption>${vo.shopname}</figcaption> </figure></li>
			</c:forEach>
		</ul>
		</section>
		<div>
			<div class="device">
				<div class="device__screen"></div>
			</div>
			<button id="showgrid" class="button button--view"
				aria-label="Show me more">
				<svg width="100%" height="100%" viewBox="0 0 310 177"
					preserveAspectRatio="xMidYMid meet"> <path fill="#FFFFFF"
					d="M159.875,174.481L306.945,27.41c2.93-2.929,2.93-7.678,0-10.606L292.803,2.661c-1.406-1.407-3.314-2.197-5.303-2.197c-1.989,0-3.896,0.79-5.303,2.197L154.572,130.287L26.946,2.661c-1.406-1.407-3.314-2.197-5.303-2.197c-1.989,0-3.897,0.79-5.303,2.197L2.197,16.804C0.733,18.269,0,20.188,0,22.107s0.732,3.839,2.197,5.303l147.071,147.071C152.197,177.411,156.945,177.411,159.875,174.481L159.875,174.481z" />
				</svg>
			</button>
			<!-- Related demos -->
		</div>
		<!-- /view -->
		
</body>
<script src="/resources/member/js/classie.js"></script>
<script src="/resources/member/js/dynamics.min.js"></script>
<script src="/resources/member/js/imagesloaded.pkgd.min.js"></script>
<script src="/resources/member/js/main.js"></script>
<script>

    var modal = document.getElementById('myModal');
    var btn = document.getElementById("myBtn");
    var span = document.getElementsByClassName("close")[0];
    var video = document.getElementById('video');
    var canvas = document.getElementById('canvas');
    var context = canvas.getContext('2d');
    var video = document.getElementById('video');
    var videoJQ = $("#video");
    var canvasJQ = $("#canvas");
    var cameraBtn = $("#myBtn");
    var cameraDiv = $(".camera");

    btn.onclick = function() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
        canvasJQ.attr("heigth","0");
        canvasJQ.attr("width","0");
        cameraDiv.show();
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }


    // 웹캠을 클릭시 활성화
    cameraBtn.on("click",function(){
        canvasJQ.hide();
        if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({
                video : true
            }).then(function(stream) {
                video.src = window.URL.createObjectURL(stream);
                videoJQ.show();
                video.play();
                cameraDiv.hide();
            });
        }
    });

     document.getElementById("video").addEventListener("click", function() {
        var videoHeight = videoJQ[0].offsetHeight;
        var videoWidth = videoJQ[0].offsetWidth;

        canvasJQ.show();
        canvas.height = videoHeight;
        canvas.width = videoWidth;
        videoJQ.hide();

        context.drawImage(video, 0, 0,videoWidth,videoHeight);
        var base64 = canvas.toDataURL("image/jpeg");
        sendFileToCloudVision(base64.replace('data:image/jpeg;base64,', ''));
    });


    function sendFileToCloudVision (content) {
        var type = "TEXT_DETECTION";

        // Strip out the file prefix when you convert to json.
        var request = {
            requests: [{
                image: {
                    content: content
                },
                features: [{
                    type: type,
                    maxResults: 200
                }]
            }]
        };

        $.post({
            url:'https://vision.googleapis.com/v1/images:annotate?key=AIzaSyDZVLNTpGmVooQatMslQnPYKyNAMKhOuOo',
            data: JSON.stringify(request),
            contentType: 'application/json',
        }).fail(function (jqXHR, textStatus, errorThrown){
        }).done(displayJSON);
    }

    /**
     * Displays the results.
     */
    function displayJSON (data) {
        if(data.responses[0].textAnnotations==null || data.responses[0].textAnnotations[0].description.split("#")[1]==null){
            swal({
                title: "인식에 실패 하였습니다.",
                text: "다시 시도해주세요.",
                type: "error",
                timer: 1000,
                showConfirmButton: false
            });
            cameraBtn.trigger("click");
        }
        var contents = JSON.stringify(data.responses[0].textAnnotations[0].description.split("#")[1].split(" ")[0]);
        var pno = parseInt(contents.split('"')[1]);

        $.ajax({
            url:'/themaGet',
            type:'get',
            datatype: 'json',
            data:"pno="+pno,
            success:function(data){
                if(data.thema!="fail"){
                    swal({
                        title: "해당 상품으로 이동합니다.",
                        text:  "",
                        imageUrl: data.shoplogo,
                        closeOnConfirm: false,
                        showConfirmButton: false,
                        showLoaderOnConfirm: true,
                    });
                    console.log(data.thema);
                    setTimeout(() => {
                    	location.reload();
                        window.open(data.thema, '_blank');
                }, 1500);
                }else{
                    swal({
                        title: "해당 상품이 존재 하지 않습니다.",
                        text: "다시 시도해주세요.",
                        type: "error",
                        timer: 1500,
                        showConfirmButton: false
                    });
                    cameraBtn.trigger("click");
                }


            }
        });
    }
</script>
</html>