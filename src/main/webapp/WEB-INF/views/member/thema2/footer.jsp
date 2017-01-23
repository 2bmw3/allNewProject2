<!--end-footer-text-->
<div class="footer-text">
	<div class="container">
		<div class="footer-main">
			<p class="footer-class">
				© 2015 Free Style All Rights Reserved | Design by <a
					href="#" target="_blank">W3layouts</a>
			</p>
		</div>
	</div>
<script type="text/javascript">
	$(window).load(function() {
		
		 var defaults = {
		 containerID: 'toTop', // fading element id
		 containerHoverID: 'toTopHover', // fading element hover id
		 scrollSpeed: 1200,
		 easingType: 'linear'
		 };

		$().UItoTop({
			easingType : 'easeOutQuart'
		});

	});
	
	$(".pagination").on("click", "li", function(event) {
	    event.preventDefault();
	    $("#pageInput").val($(this).val());
	    $("#pageNumForm").submit();
	 });

</script>
<a href="#home" id="toTop" class="scroll" style="display: block;">
	<span id="toTopHover" style="opacity: 1;"> </span>
</a>
</div>
<!-- 새로 추가한 것들 -->
<script src="/resources/member/js/rate.js"></script>
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>
<!--end-footer-text-->
