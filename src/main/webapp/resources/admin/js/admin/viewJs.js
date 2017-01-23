   
   /* firebase script */
   var config = {
      apiKey : "AIzaSyCCPgBU1lxPq7PVclQyoN5lUX3nFgtXClQ",
      authDomain : "project-26bd6.firebaseapp.com",
      databaseURL : "https://project-26bd6.firebaseio.com",
      storageBucket : "project-26bd6.appspot.com",
      messagingSenderId : "544848311496"
   };
   firebase.initializeApp(config);

   // Get a reference to the storage service, which is used to create
	// references in your storage bucket
   var storage = firebase.storage();

   // Create a storage reference from our storage service
   var storageRef = storage.ref();
   
   
      $('.showQnA').hide();
               $('.review').on('click',
                     function() {
                        var qno = $(this).attr('value');
                        var acontent = $('#' + qno).val();
                        var formData = {
                           "qno" : qno,
                           "acontent" : acontent,
                           "awriter" : '사장'
                        };
                        $.ajax({
                           url : "answerAction",
                           data : formData,
                           dataType : "JSON",
                           type : "post",
                           complete : function() {
                              $('#' + qno).val("");
                              $('#c' + qno).after(
                                    "<li><i class='material-icons'>subdirectory_arrow_right</i> RE :"
                                          + acontent + "</li>")

                           }
                        });// end replyAction Ajax
                     });

               $('#qnaTab').on('click', function() {
                  $('.showReview').hide();
                  $('.showQnA').show();
               });

               $('#reviewTab').on('click', function() {
                  $('.showQnA').hide();
                  $('.showReview').show();
               });

            

      // product delete
      $(".deleteBtn").on("click",function(event) {   
          var targetFileArr = [];
          var pno = $(this).parents()[0].firstElementChild.value;
          var formData = { "pno": pno};   
           
          swal({
               title : "Are you sure?",
               text : "You will not be able to recover this imaginary file!",
               type : "warning",
               showCancelButton : true,
               confirmButtonColor : "#DD6B55",
               confirmButtonText : "Yes, delete it!",
               closeOnConfirm : false
               },function() {
                   swal(
                         "Deleted!",
                         "Your imaginary file has been deleted.",
                         "success");
                   $.ajax({
                       url : "/fbFileDelete",
                       data : formData,
                       dataType : "json",
                       type : "post",
                       contentType : false,
                       processData : false,
                       success : function( file ) {
                          targetFileArr = file.split("/");
                          
                          for( var  i = 0 ; i < targetFileArr.length; i++ ){
                             
                             var desertRef = storageRef.child('products/'+ targetFileArr[i]); 
                              desertRef.delete().then(function() { }).catch(function(error) { });
                       }// end success
                    }
                 });// end ajax
                
                $.ajax({
                   url :"/productsDelete",
                   data :formData,
                   dataType :"json",
                   type :"post",
                   complete : function() {
                      setTimeout("location.href='/admin/listAction';", 1000);
                   }// end success
                });// end ajax
            });// end swal function 
        });// end product delete click function
      
      $(".img").bind("click", function() {

          var img = ($(this)[0].title);
          $(".timg").attr('src', img);

       });