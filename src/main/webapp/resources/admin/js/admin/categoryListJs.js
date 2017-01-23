$(".pagination").on("click", "li", function(event) {
		event.preventDefault();
		$("#pageInput").val($(this).val());
		$("#pageNumForm").submit();
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