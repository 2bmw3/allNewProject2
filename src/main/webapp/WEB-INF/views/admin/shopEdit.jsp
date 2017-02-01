<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="header.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Shop Image Editing</h1>

			<ul class="nav nav-pills">
				<li class="active"><a data-toggle="pill" href="#Title">Title edit</a></li>
				<li><a data-toggle="pill" href="#Banner">Banner edit</a></li>
			</ul>

			<div class="tab-content">
				<div id="Title" class="tab-pane fade in active">
					<h3>Title image</h3>
					<button type="button" id='modify' class="btn btn-default" data-toggle="modal" data-target="#titleModal">Modify</button>
					<br>
					<img id='titleImg' src="${titleimg}" style="width: 400px; height: 400px;">
				</div>
				
				<!-- Modal -->
			  <div class="modal fade" id="titleModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Title image change</h4>
			        </div>
			        <div class="modal-body">
			          <input type="file" id='selectImg'>
			          	<br>
			        	<button id='selectImgBtn' type="button" class="btn btn-primary btn-xs" data-dismiss="modal" style="float: right;">Submit</button>
						<br>			        
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
				
				<div id="Banner" class="tab-pane fade">
					<h3>Banner image</h3>
				</div>
				
			</div>
		</div>
	</div>
</div>
<script>
	/* for firebase upload */
	var config = {
		apiKey : "AIzaSyCCPgBU1lxPq7PVclQyoN5lUX3nFgtXClQ",
		authDomain : "project-26bd6.firebaseapp.com",
		databaseURL : "https://project-26bd6.firebaseio.com",
		storageBucket : "project-26bd6.appspot.com",
		messagingSenderId : "544848311496"
	};
	
	firebase.initializeApp(config);
	var storage = firebase.storage();
	var storageRef = storage.ref();
	/* for firebase upload */
	
	//uuid create
	function guid() {
		function s4() { 
			return ((1 + Math.random()) * 0x10000 | 0).toString(16)
					.substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4()
				+ s4() + s4();
	}// end uuid create
	
	$("#selectImgBtn").on("click", function() {
		var adminid = getCookie('username');
		var titleImg = $("#titleImg");
		var selectImg = $("#selectImg");
		var file= selectImg[0].files[0];
		var uuidFileName = guid() + "_" + file.name;
		
		var upload = storage.ref().child("titleimg/" +uuidFileName);
        var uploadTask = upload.put(file);


        uploadTask.on('state_changed', function(snapshot){
        }, function(error) {
        }, function() {
            var downloadURL = uploadTask.snapshot.downloadURL;
            $(titleImg)[0].src = downloadURL;
            selectImg[0].value = "";
			var data = {"titleimg":downloadURL, "adminid": adminid};
			
			$.ajax({
				url : "titleImgUpdate",
				data : data,
				dataType : 'text',
				type : "post",
				success : function(result) {
					swal(result,"","success");
				}
			});
            
        });
	});

</script>
<%@include file="footer.jsp"%>