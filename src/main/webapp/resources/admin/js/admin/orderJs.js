 $(document).on("click",'#out', function() {
         swal({
            title : "정말 이십니까?",
            text : "꺼진 불도 다시 보자!!",
            type : "warning",
            showCancelButton : true,
            confirmButtonColor : "#DD6B55",
            confirmButtonText : "고객님에게로",
            cancelButtonText : "취소",
            closeOnConfirm : false
         }, function() {
            swal("출발", "자주 만나요", "success");
            var odno = $("#odno").val();

            $.ajax({
               url : "orderAction",
               data : "odno=" + odno,
               dataType : "JSON",
               type : "post",
               complete : $("#" + odno).detach()

            });//end  Ajax
         });
      });