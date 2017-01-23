var config = {
   apiKey : "AIzaSyCCPgBU1lxPq7PVclQyoN5lUX3nFgtXClQ",
   authDomain : "project-26bd6.firebaseapp.com",
   databaseURL : "https://project-26bd6.firebaseio.com",
   storageBucket : "project-26bd6.appspot.com",
   messagingSenderId : "544848311496"
};
firebase.initializeApp(config);

// Get a reference to the storage service, which is used to create references in your storage bucket
var storage = firebase.storage();

// Create a storage reference from our storage service
var storageRef = storage.ref();

   $(".pagination").on("click", "li", function(event) {
      event.preventDefault();
      $("#pageInput").val($(this).val());
      $("#pageNumForm").submit();
   });

   
   $("#select").click(function() {
         console.log($("#select option:selected").val());
         console.log($("#colorSearch"));

         if ($("#select option:selected").val() == "c") {
            if ($("#color").css("display") == "none") {
               jQuery('#color').show();
            } else {
               jQuery('#color').hide();
            }
         }
      });

      $(".colorInfo").on("click", function() {
         $(this)[0].id;
         $("#keyword").val($(this)[0].id);

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
                                  dataType : "text",
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
