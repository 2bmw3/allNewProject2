<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta charset="UTF-8">
<title>Calm breeze login screen</title>
<link rel="stylesheet" href="/resources/member/css/loginStyle.css">
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<style>
#video { 
     position: absolute;
	 top: 0px;
     left: 0px; 
     max-width: 100%;
     width: 100%;
     height: auto;
     z-index: -1;
     overflow: hidden;
}

</style>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <h2>Welcome</h2>

        <form class="form">
            <input id='userid' type="text" placeholder="Username">
            <input id='userpw' type="password" placeholder="Password">
            <button id="login-button">Login</button>
        </form>
    </div>
</div>
<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      <source src="/resources/member/video/sm.mp4">
</video>
</body>
<script>

var url = document.location.href.split("?"); 
var URL = url[1].split("url=")[1]+ "?" + url[2];

$("#login-button").on("click",function(){
	event.preventDefault();
	
	//ahffk
	var userid = $("#userid").val();
	var userpw = $("#userpw").val();
	 formData = {"userid":userid, "userpw":userpw};
    $.ajax({      
    	url: "/member/loginAction", 
        data: formData, 
        type:"post",
        dataType: "text",
       	success: function(data){   
       			str = URL;
        		if(data=="success"){
        			if(url[2]==undefined){
        				str = "/member/index";
        			}
        			location.href = str;		
        		}else{
	     	     	swal({
	  	     			title: "정보가 일치 하지 않습니다.",
	  	     	 		text: "다시 시도해주세요",
	  	     			type: "error",
	  	     			timer: 1000,
	  	     			showConfirmButton: false
	  	     		});
        		}
        }
    }); 
});
</script>
</html>
