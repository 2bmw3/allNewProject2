<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Calm breeze login screen</title>
<link rel="stylesheet" href="/resources/member/css/loginStyle.css">
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<style>
html {
	background: linear-gradient(rgba(196, 102, 0, 0.6), rgba(155, 89, 182, 0.6));
	height: 100%;
}
</style>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <h1>Welcome!</h1>

        <form class="form">
            <input id='userid' type="text" placeholder="UserID">
            <input id='userpw' type="password" placeholder="Password">
            <button id="login-button" style="margin: 5px;">Login</button><br>
            <button id="register-button">Register</button>
        </form>
    </div>
</div>

</body>
<script>

var url = document.location.href.split("?"); 
var URL = url[1].split("url=")[1]+ "?" + url[2];

$("#login-button").on("click",function(event){
	event.preventDefault();
	
	var userid = $("#userid").val();
	var userpw = $("#userpw").val();
	if( userid == "" || userpw == ""){
		swal("로그인 정보를 입력해주세요!","","error");
	} else {
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
	}
});

$("#register-button").on("click",function(event){
	event.preventDefault();
	location.href='register'; 
});
</script>
</html>
