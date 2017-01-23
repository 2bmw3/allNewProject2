document.write('<script src="/resources/js/html5shiv.js"></script>');

var fileNames = [];
var piNum = 0; //   pisize, picolor, pistock을 list 인덱스 값을 증가시키기 위한 변수
var fileLength = 0;

//textArea replace
bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });

// firebase config
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

/* 글 쓸 때 null값 체크 */
$("#submitBtn").on('click', function(event){
   
   event.preventDefault();
   
   var pnameVal = $('.pname').val();
   var priceVal = $('.price').val();
   var pgenderVal = $('.pgender').val();
   var pkindVal = $('.pkind').val();
   var picolorVal = []; var pisizeVal = []; var pistockVal = [];
   var nullCheck = "T";
   var targets = $('.infoDiv');
   

   if(targets.length == 0){
      nullCheck = "F";s
   }
   
   for(var i = 0 ; i < targets.length ; i++){
      picolorVal[i] = targets[i].children[0].value;
      pisizeVal[i] = targets[i].children[1].value;
      pistockVal[i] = targets[i].children[2].value;
      
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

// editor fileupload popup
$(document).on('click', ".btn-example" , function(event){
       var $href = $(this).attr('href');
       layer_popup($href);
   });

//uuid 생성
function guid() {
  function s4() {
    return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
};// end guid


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

//editor fileUploadBtn click function for firebase
$("#uploadBtn").on("click",function(){
       var file = $("#uploadFile")[0].files[0];
     var uuidFileName = guid() + "_" + file.name;
     
      var upload = storage.ref().child("editor/" + uuidFileName );                       
      var uploadTask = upload.put(file);

      uploadTask.on('state_changed', function(snapshot){ }, function(error) { }, function() {
         
         var str = "<img src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/editor%2F"
                  + uuidFileName 
                  +"?alt=media&token=8e92d83a-28b9-4bbb-8418-b86219abbe64' style='cursor:pointer; width:100%;' class='editImg' name='"
                  + uuidFileName
                  +  "'>";
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

   $(".fileDrop").on("dragenter dragover",function(event) {
              event.preventDefault();
           });
     
     $(".fileDrop").on("drop", function(event) {
              event.preventDefault();
              console.log("================");
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

                        var str = "";
                         
                         str = "<div value='" + fileNames[i] + "'style='float: left; width: 30%;padding-bottom: 12px;'>"
                              + "<img src='https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F"
                              + fileNames[i]
                              + "?alt=media&token=42abbd59-4fb8-4db9-8c06-88d563ca1b6e'style='width:75px; height:75px;'/>&nbsp;&nbsp;<i class='fa fa-times deletephoto' style='font-size:24px'/>"
                              + "<input type='checkbox' class = 'titlephoto' name='ptitlephoto' value="+fileNames[i]+"></div>";

                               $("#uploaded").append(str);                                  
                       }// end prevShow for
                     fileLength = fileNames.length;
            });// end uploadTask function
        });// end fileDrop event

               
  // 파일 업로드 한 거 지우기
 $(document).on('click', ".deletephoto" , function(event){
      var target = $(this).parent()[0];
      var fileName = $(this).parent()[0].lastChild.defaultValue;
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
            	+ "<input style='margin-left:1.5%; width:20%;' type='text' name='list[" + piNum + "].picolor' placeholder='색깔' id='"+piNum+"'  class='form-control picolor col-sm-2'/>"
            	+ "<input style='margin-left:2%; width:20%;' type='text' name='list[" + piNum + "].pisize' placeholder='사이즈' class='form-control col-sm-2 pisize'/>"                  	
            	+ "<input style='margin-left:2%; width:20%;' type='text' name='list[" + piNum + "].pistock' placeholder='수량' class='form-control col-sm-2 pistock'>"
            	+ "<div class='col-sm-2 deleteBtn' style='margin-left:1%'>"
            	+	"<button type='button' class='btn btn-warning btn-circle'>"
            	+		"<i class='fa fa-times'></i>"
                +   "</button>"
            	+ "</div>"
                +"</div>"
                );
               
            
            // 색상 정보를 입력하기 위한 event
            $(".colorInfo").on("click", function(){
               var color = '#' + piNum;
               $("#" + (piNum - 1)).val($(this)[0].id);
               
            }); // end colorInfo event   
            piNum++;

            /* Pinfo 삭제하기위한 deleteBtn */
            $(".deleteBtn").on("click", function(event) {
               $(this).parent()[0].remove();
               });// end deleteBtn event         
               
      });// end addBtn event
      
      
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
                  self.location = "/admin/index";
               }, 1000);
              } else {
                swal("", "글 등록 화면으로 돌아갑니다.");
              }
            });// end isConFirm function         
      });// end cancelBtn event
   });//end document