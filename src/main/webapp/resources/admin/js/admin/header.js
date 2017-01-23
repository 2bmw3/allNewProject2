var username = getCookie('username'); 

$(".member").on("click",function(){
	event.preventDefault();
   $.ajax({
            url : "shopName",
            data : "adminid=" + username,
            dataType : "text",
            type : "post",
            success : function(data) {
            	console.log(data);
            	window.open(data, '_blank');
            }
    });
});


// 관리자 아이디 값 쿠키에서 찾는 함수
function getCookie(cname) {
   var name = cname + "=";
   var cookie = document.cookie.split(';');
   for (var i = 0; i < cookie.length; i++) {
      var value = cookie[i].trim();
      if (value.indexOf(name) == 0) {
         return value.substring(name.length,
               value.length);
      }
   }
   return "";
}
// 알림 데이터 가져오기
(function() {
   $.ajax({
            url : "latter",
            data : "adminid=" + username,
            dataType : "JSON",
            type : "post",
            success : function(data) {
               var count = data.length;
               var str = "";
               if (data != "") {

                  $.each(data,function(key,index) {
		                     str+="<li class='divider'></li>"
		                    	  +"<li>"
		                          +    "<a href='view?pno=" + index.pno + "&pageNum=1&jspName=/index'>"
		                          +        "<div>"
		                          + 	  	 	"<img style='  position: relative; display: inline-block; border-radius: 50%; width: 40px; height: 40px;' src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F"
		                          + 			index.ptitlephoto
		                          + 			"?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e' style='width:30px;height:30px;'>"
		                          +            	"<strong>'" + index.pname + "'</strong>"
		                          +        "</div>"
		                          +        "<div>&nbsp;&nbsp;&nbsp;&nbsp; 이 상품에서 답변하지 않은 Q/A가 있습니다.</div>"
		                          +    "</a>"
		                          +"</li>";
                	  				
		                          
                                
                              });
                  $('#count').html(count);
                  $('#myDropdown').append(str);
               }

            }
         });
}());
