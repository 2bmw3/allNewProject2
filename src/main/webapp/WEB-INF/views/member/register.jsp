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
</head>
<script language="javascript">
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2, zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

	document.getElementById('roadAddrPart1').value = roadAddrPart1;
	document.getElementById('roadAddrPart2').value = roadAddrPart2;
	document.getElementById('addrDetail').value = addrDetail;
	document.getElementById('zipNo').value = zipNo;
	
	document.getElementById('uaddress').value = zipNo + "\t" + roadAddrPart1 + "\t" + addrDetail;
}
</script>
<body>

<form id="msform" method="post" action="/memberRegisterAction">

	<ul id="progressbar">
		<li class="active" style="padding-left: 17%">Basic</li>
		<li>Detail</li>
	</ul>
	<!-- fieldsets -->
	<fieldset>
		<h2 class="fs-title">Welcome!</h2>
		<h3 class="fs-subtitle">Please write</h3>
		<input type="text" name="userid" placeholder="ID" /> 
		<input type="password" id="userpw" name="userpw" placeholder="Password" /> 
		<input type="text" name="uname" placeholder="Name" /> 
		<input type="text" name="uphonenumber" placeholder="Phonenumber" /> 
		<input type="button" name="next" class="next action-button" value="Next" />
	</fieldset>
	<fieldset>
		<h2 class="fs-title">Info</h2>
		<h3 class="fs-subtitle">please write</h3>
		<input type="hidden" name="uaddress" id="uaddress" placeholder="Address" /> 
		<div name="form" id="addForm">
			    <input type="hidden" id="confmKey" name="confmKey" value="">
				<input type="text" id="zipNo" name="zipNo" readonly placeholder="우편번호">
				<input type="button"  value="주소검색" onclick="goPopup();">
				<input type="text" id="roadAddrPart1" placeholder="도로명주소">
				<input type="text" id="addrDetail" style="width: 50%; float:left;" value="" placeholder="상세주소1">
				<input type="text" id="roadAddrPart2" style="width: 50%;" value="" placeholder="상세주소2">
		</div>
		<input type="email" name="uemail" placeholder="Email" /> 
		<input type="date" name="ubirth" placeholder="Birth" /> 
		<select name="ugender">
		  <option >----------</option>
		  <option value="Male">Male</option>
		  <option value="Female">Female</option>
		</select>
		<input type="button" name="previous" class="previous action-button" value="Previous" /> 
		<button id='formSubmit' class="action-button">Join us</button>
	</fieldset>
</form>

</body>
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/admin/js/register.js"></script>
</html>