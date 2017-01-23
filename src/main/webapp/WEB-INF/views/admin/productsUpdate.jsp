<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>

<!--/head-->
<style>
select {
   background: #F0F0E9;
   border: medium none;
   color: #696763;
   display: block;
   font-family: 'Roboto', sans-serif;
   font-size: 14px;
   font-weight: 300;
   height: 40px;
   margin-bottom: 10px;
   outline: medium none;
   padding-left: 10px;
   width: 100%;
}
#area {
   color: black;
   height: 200px;
}
.colorInfo{
   border: 1px;
   border-color: black;
}

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}
.colorInfo{
   border: 1px;
   border-color: black;
}
</style>

   <!-- write -->
  <div id="page-wrapper"> 
   <div class="container">
      <div>
         <div class="col-sm-10 col-sm-offset-1">
            <div class="login-form">
               <h2>상품을 수정해 주세요</h2>
               
               <form method="post" action="/adminUpdateAction" id='writeForm'>
                  <input type='hidden' name='jspName' value='${param.jspName}' /> 
                  <input type='hidden' name='sType' value='${param.sType}' /> 
                  <input type='hidden' name='keyword' value='${param.keyword}' /> 
                  <input type='hidden' name='ppkind' value='${param.ppkind}' />
                  <input type='hidden' name='pno' value='${updateProductsRead[0].pno}'/>
                   <input type='hidden' name='pageNum' value='${pageNum}'/>
                   
                  <div class='has-success' >
                   		<input style='width:74%; margin-bottom:2%;' type="text" id="inputSuccess" class='form-control col-md-6 pname' name="pname" placeholder="상품명" value="${updateProductsRead[0].pname}"/>
                   </div>
                   
                  <div class="has-success row" style='width:76%; margin-bottom:1%;' >
                  	<input style='width:32%; margin-left:2%;' type="text" id="inputSuccess" class="form-control col-md-4 price" name="price" placeholder="가격" value="${updateProductsRead[0].price}">
				    <select style='width:31%; margin-left:2%;' id="disabledSelect" name="pgender" class='col-md-4 form-control pgender' >
                    	<option selected>성별</option>
                     	<option>남성</option>
                     	<option>여성</option>
                     	<option>남녀공용</option>
                    </select>
                  	<select style='width:31%; margin-left:2%;' id="disabledSelect" name="pkind" class='col-md-4 form-control pkind'>
                    	 <option selected>종류</option>
                     	<option>상의</option>
                     	<option>하의</option>
                     	<option>아우터</option>
                     	<option>신발 및 악세사리</option>
                     	<option>기타</option>
                  	</select>
                  </div>
                  
                  <div id=pinfo style='margin-bottom:2%;'>
                     <div class='row' style='border-bottom: 0;'>
                     
                        <div class="col-sm-16" style="padding: 0em; margin-left: 1em;">
                           <i class="fa fa-plus addBtn">&nbsp;&nbsp;추가하기</i>&nbsp;&nbsp;

                           <image src='/resources/admin/images/color_info/red.jpg' class='colorInfo' id='red' />
                           <image src='/resources/admin/images/color_info/orange.jpg' class='colorInfo' id='orange' />
                           <image src='/resources/admin/images/color_info/yellow.jpg' class='colorInfo' id='yellow' />
                           <image src='/resources/admin/images/color_info/green.jpg' class='colorInfo' id='green' />
                           <image src='/resources/admin/images/color_info/blue.jpg' class='colorInfo' id='blue' />
                           <image src='/resources/admin/images/color_info/navy.jpg' class='colorInfo' id='navy' />
                           <image src='/resources/admin/images/color_info/purple.jpg' class='colorInfo' id='purple' />
                           <image src='/resources/admin/images/color_info/pink.jpg' class='colorInfo' id='pink' />
                           <image src='/resources/admin/images/color_info/beige.jpg' class='colorInfo' id='beige' />
                           <image src='/resources/admin/images/color_info/brown.jpg' class='colorInfo' id='brown' />
                           <image src='/resources/admin/images/color_info/gray.jpg' class='colorInfo' id='gray' />
                           <image src='/resources/admin/images/color_info/white.jpg' class='colorInfo' id='white' />
                           <image src='/resources/admin/images/color_info/black.jpg' class='colorInfo' id='black' />
                           <image src='/resources/admin/images/color_info/etc.jpg' class='colorInfo' id='etc' />
                           <br>
                           
                        </div>
                     </div>
                  </div>

                 <!-- pinfo 띄워주기 -->
                 <c:forEach items="${updateInfoRead}" var="vo" varStatus="status">
                 	<div class='has-warning row infoDiv' style='border-bottom: 0; margin-bottom:2%;'>
                 		<input type='hidden' name='list[${status.count-1}].pno' value='${updateInfoRead[0].pno}'/>                  	
             	   		<input style='margin-left:1.5%; width:20%;' type='text' name='list[${status.count-1}].picolor' placeholder='색깔' value='${vo.picolor}' id='"+piNum+"'  class='form-control picolor col-sm-2'/>
             			<input style='margin-left:2%; width:20%;' type='text' name='list[${status.count-1}].pisize' placeholder='사이즈' value='${vo.pisize}' class='form-control col-sm-2 pisize'/>                  	
             			<input style='margin-left:2%; width:20%;' type='text' name='list[${status.count-1}].pistock' placeholder='수량' value='${vo.pistock}' class='form-control col-sm-2 pistock'>
             			<div class='col-sm-2 deleteBtn' style='margin-left:1%'>
             				<button type='button' class='btn btn-warning btn-circle'>
             					<i class='fa fa-times'></i>
                			</button>
             			</div>
               		</div>
                 </c:forEach>
               <!-- pinfo 띄워주기  end-->
                  
                  
                  
                 <div id="sample">
                     <!--  TextEditor -->
                     <textarea cols="40" style=" height: 300px; width:75%;">${updateProductsRead[0].pcontent}</textarea>
                     <input type='hidden' id='pcontent' name='pcontent'>
                 </div>
                 
                  <input type="text" class='form-control fileDrop' name="content" placeholder="사진을 넣어주세요" id="area" readonly="readonly" style='width: 75%;'>
                  
                  <div class="field half first" id="uploaded">
                     <c:forEach items="${updateProductsRead}" var="vo" varStatus="status">
                        <div value='${vo.pphoto}' style='float: left; width: 30%;padding-bottom: 12px;'>
                           <img style='width:75px;height:75px;'src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.pphoto}?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e"/>&nbsp;&nbsp;
                           <i class='fa fa-times deletephoto' style="font-size:24px"></i>
                           <input type='checkbox' class = 'titlephoto' name='ptitlephoto' value='${vo.pphoto}'>
                         </div>
                    </c:forEach>
                    <input type="hidden" id="photo" name="pphoto" />
                 </div>
                 <br>
                 <div style='float: left; width: 100%; padding-bottom: 12px;'>
                    <button class='reBtn btn btn-outline btn-default' style='float: left; width: 20%'>다시 선택하기</button>
                 </div>
                 <br>
                 <div style='float: left; width: 100%; padding-bottom: 12px;'>
                   <button class ="btn btn-success"  style='float: left; width: 20%' id='submitBtn'>등록</button>
                      <button id="cancelBtn" type="button" class="btn btn-danger" style='margin-left: 23em; width: 20%''>취소</button>
                 </div>
               </form>
            </div>
         </div>
      </div>
   </div>

   </div>

<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">

                <input id='uploadFile' type="file">
                 <button id='uploadBtn'>파일 전송</button>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">Close</a>
                </div>
                
            </div>
        </div>
    </div>
</div> 




<script src="/resources/admin/js/admin/editorJs.js"></script>
<script>
   var fileNames = [];
   var fileLength = 0;
   var piNum = ${fn:length(updateInfoRead)};//   pisize, picolor, pistock을 list 인덱스 값을 증가시키기 위한 변수

   //textArea replace
   bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
    
    /* firebase script */
      var config = {
          apiKey: "AIzaSyCCPgBU1lxPq7PVclQyoN5lUX3nFgtXClQ",
           authDomain: "project-26bd6.firebaseapp.com",
           databaseURL: "https://project-26bd6.firebaseio.com",
         storageBucket: "project-26bd6.appspot.com",
         messagingSenderId: "544848311496"
    };
         
    firebase.initializeApp(config);
    var storage = firebase.storage();
    var storageRef = storage.ref();

    // drag and drop titleImg check box
   $('.reBtn').hide();
     
    //uuid 생성
       function guid() {
       function s4() {
         return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
       }
       return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
     };// end guid
      
    //처음에 띄워줄 때 그 값들을 바로 넣어주기
    $.each(${pname}, function( index, value ) {     
       fileNames.push(value);   
    });
    
   //사진을 올리지 않으면 photo value값에 아무값도 들어가지 않늗다. 
   $("#photo").val(fileNames);
   /* fileLength = fileNames.length; */
   
   // editor fileupload popup
   $(document).on('click', ".btn-example" , function(event){
          var $href = $(this).attr('href');
          layer_popup($href);
      });
   
   // fileUpload popup
   function layer_popup(el){

        var $el = $(el);        //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find('a.btn-layerClose').click(function(){
            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });

        $('.layer .dimBg').click(function(){
            $('.dim-layer').fadeOut();
            return false;
        });

    }
   
   
   /* 글 쓸 때 null값 체크 */
   $(document).on('click',"#submitBtn", function(event){
      event.preventDefault();
      
      var pnameVal = $('.pname').val();
      var priceVal = $('.price').val();
      var pgenderVal = $('.pgender').val();
      var pkindVal = $('.pkind').val();
      var picolorVal = []; var pisizeVal = []; var pistockVal = [];
      var nullCheck = "T";      
      var targets = $('.infoDiv');
      
      if(targets.length == 0){
         nullCheck = "F";
      }
      
      
      for(var i = 0 ; i < targets.length ; i++){
         picolorVal[i] = targets[i].childNodes[1].value;
         pisizeVal[i] =  targets[i].childNodes[2].value;
         pistockVal[i] = targets[i].childNodes[3].value;
         if(pnameVal == "" || priceVal == "" || pgenderVal == "성별" || pkindVal == "종류" 
               || picolorVal[i] == "" || pisizeVal[i] == "" || pistockVal[i] ==""){
            nullCheck = "F";
            break;
         }
      }
      if(nullCheck == "F"){
         swal("빈칸이 존재합니다!");
      }else{
         $('#pcontent').val($(".nicEdit-main")[0].innerHTML);
         $('#writeForm').submit();
      }
   
   });
   
   
   
   
    //editor fileUploadBtn click function for firebase
   $("#uploadBtn").on("click",function(){
        var file = $("#uploadFile")[0].files[0];
        var uuidFileName = guid() + "_" + file.name;
        
         var upload = storage.ref().child("editor/" + uuidFileName );                       
         var uploadTask = upload.put(file);

         uploadTask.on('state_changed', function(snapshot){ }, function(error) { }, function() {
            
            var str = "<img src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/editor%2F"
                     + uuidFileName 
                     +"?alt=media&token=8e92d83a-28b9-4bbb-8418-b86219abbe64' style='cursor:pointer;' class='editImg' name='"
                     + uuidFileName
                     + "'>";
            $(".nicEdit-main")[0].innerHTML += str; 
            $('#pcontent').val($(".nicEdit-main")[0].innerHTML);
            str="";
            $("#uploadFile").val("");
            
         });// end uploadTask function
            $('.dim-layer').fadeOut();// 팝업 닫기
   });// end editor fileUploadBtn function
   
// editor fileDelete function
   $(document).on('click', ".editImg" , function(event){
          var fileName = $(this)[0].name;
          var targetFile = $(this)[0];
          var desertRef = storageRef.child('editor/'+ fileName);
        
        swal({
             title: "사진을 지우시겠습니까?",
             text: "한번 지운 사진은 복구할 수 없습니다!",
             type: "warning",
             showCancelButton: true,
             confirmButtonColor: "#DD6B55",
             confirmButtonText: "네",
             cancelButtonText:"아니요",
             closeOnConfirm: false
           },
           function(){
              desertRef.delete().then(function() { }).catch(function(error) { });
               $(targetFile).remove();
             swal("삭제되었습니다!", "", "success");
           }); 
    });// end fileDelete function
   
   
   $(document).ready( function() {
      
            var uploadedList = $("#uploaded");

            $(".fileDrop").on("dragenter dragover", function(event) {
                     event.preventDefault();
                    });
              
            $(".fileDrop").on("drop", function(event) {
                     event.preventDefault();
                     fileLength = fileNames.length;
                     //드랍이 다 되면 실제로 데이터가 들어오도록 (여러개 드랍 가능)
                     var files = event.originalEvent.dataTransfer.files;

                     for (var i = 0; i < files.length; i++) {
                         var file = files[i];
                        var uuidFileName = guid() + "_" + file.name;
                        
                        var upload = storage.ref().child("products/" + uuidFileName );                       
                        var uploadTask = upload.put(file);
                                                           
                        fileNames.push(uuidFileName);
                        $("#photo").val(fileNames);
                     }//end for fileUpload
                     
                     // 업로드가 다 완료되면 
                     uploadTask.on('state_changed', 
                            function(snapshot){ }, 
                            function(error) { }, 
                           function() {
                                                       
                            for( var i = fileLength ; i < fileNames.length; i++ ){
                               
                            console.log("fileNames"+[i]+".......... " + fileNames[i]);
                            
                            var str = "";
                             
                             str = "<div value="+fileNames[i]+" style='float: left; width: 30%;padding-bottom: 12px;'>"
                                  + "<img src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F"
                                  + fileNames[i]
                                  + "?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e'style='width:75px; height:75px;'/>&nbsp;&nbsp;<i class='fa fa-times deletephoto' style='font-size:24px'/>"
                                  + "<input type='checkbox' class = 'titlephoto' name='ptitlephoto' value="+fileNames[i]+"></div>";
                              
                                    
                                 $("#uploaded").append(str);
                        }// end prevShow for
                   });// end uploadTask function
               });// end fileDrop event

                 
                 
                 
              // 파일 업로드 한 거 지우기
              $(document).on('click',".deletephoto", function(event){              
                   var target = $(this).parent();
                   var fileName = target.attr('value');                   
                   var desertRef = storageRef.child('products/'+ fileName);
                  
                   desertRef.delete().then(function() { }).catch(function(error) { });
                    
                    if(fileName != ""){
                       // 삭제한 값의 인덱스 번호를 제거하여 배열을 정리
                       fileNames.splice(fileNames.indexOf(fileName.valueOf()),1);
                       $(target)[0].remove();
                       $("#photo").val("");
                       $("#photo").val(fileNames); 
                     }
                 });   // end deletephoto event
                 
                                   
                  // 타이틀 사진을 선택하면 다른 사진들은 check하지 못하게 설정
                  $(document).on("click",".titlephoto",function() {
                     if($(this).is(':checked')) {
                  $('.reBtn').show();
                  $(".titlephoto").hide();
                     } else {}
                 });// end titlephoto
                 
                 $(document).on('click','.reBtn', function(event){
                    event.preventDefault();
                    $(".titlephoto").show();
                       $("input[name=ptitlephoto]").prop("checked", false);
                      $('.reBtn').hide();
                 });// end reBtn' event
 
                 
                 
                /* Pinfo 추가하기위한 addBtn */
                $(".addBtn").on("click",
                         function() {

                            $('#pinfo').after(
                                    "<div class='has-warning row infoDiv' style='border-bottom: 0; margin-bottom:2%;'>"    
                            		+ "<input type='hidden' name='list["+ piNum +"].pno' value='"+${updateInfoRead[0].pno}+"'/>"            	
									+ "<input style='margin-left:1.5%; width:20%;' type='text' name='list[" + piNum + "].picolor' placeholder='색깔' id='"+piNum+"'  class='form-control picolor col-sm-2'/>"
                            		+ "<input style='margin-left:2%; width:20%;' type='text' name='list[" + piNum + "].pisize' placeholder='사이즈' class='form-control col-sm-2 pisize'/>"                  	
                            		+ "<input style='margin-left:2%; width:20%;' type='text' name='list[" + piNum + "].pistock' placeholder='수량' class='form-control col-sm-2 pistock'>"
                            		+ "<div class='col-sm-2 deleteBtn' style='margin-left:1%'>"
                            		+	"<button type='button' class='btn btn-warning btn-circle'>"
                            		+		"<i class='fa fa-times'></i>"
                            		+  "</button>"
                            		+ "</div>"
                            		+"</div>"
                                  );
                            
                         
                         // 색상 정보를 입력하기 위한 event                         
                         $(".colorInfo").on("click", function(){
                            var color = '#' + piNum;
                            $("#" + (piNum - 1)).val($(this)[0].id);
                         }); // end colorInfo event
                         piNum++;      
                   });// end addBtn event
                   
                   /* Pinfo 삭제하기위한 deleteBtn */
                   $(document).on('click',".deleteBtn", function(event){
                      $(this).parent()[0].remove();
                      });// end deleteBtn event 

                      
         /* 글 등록을 취소하기 위한 cancelBtn */
         $("#cancelBtn").on("click", function(event){

            event.preventDefault();
            
            swal({
                 title: "정말로 취소하시겠습니까?",
                 text: "등록을 취소하면 그동안 작성했던 데이터를 잃을 수 있습니다.",
                 type: "warning",
                 showCancelButton: true,
                 confirmButtonClass: "btn-danger",
                 cancelButtonText: "아니오",
                 confirmButtonText: "예",
                 closeOnConfirm: false,
                 closeOnCancel: false
               },
               function(isConfirm) {
                 if (isConfirm) {
                   swal("글 등록을 취소합니다.", "1초 후, 메인 화면으로 돌아갑니다.", "error");
                   setTimeout((isConfirm) => {
                     // 원래 보던 list페이지로 보내주기
                        var prevPage ="";
                     var jspName = '${param.jspName}';
                     var sType = '${param.sType}';
                     var keyword = '${param.keyword}';
                     var pkind = '${param.ppkind}';
                     var pageNum = '${pageNum}';
                     
                     if(jspName =="/list"){
                        prevPage = jspName + "?pageNum=" + pageNum;
                     }else if(jspName=="/adminListSearch"){
                        prevPage = jspName + "?pageNum=" + pageNum + "&sType=" + sType + "&keyword=" + keyword;
                     }else if(jspName=="/index"){
                     str = "/index";
                  }else{
                        prevPage = jspName + "?page=" + pageNum +"&pkind="+ pkind;
                     } 
                     // 원래 보던 list페이지로 보내주기 끝
                     self.location = "/admin" + prevPage;
                  }, 1000);
                 } else {
                   swal("", "글 등록 화면으로 돌아갑니다.");
                 }
               });// end isConFirm function         
         });// end cancelBtn event
      }); //end document
</script>
<%@ include file="footer.jsp"%>