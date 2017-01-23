<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shop index</title>
</head>
<body>
<%@include file="header.jsp"%>

<!--banner-starts-->
<div class="bnr" id="home">
    <div id="top" class="callbacks_container">
        <ul class="rslides" id="slider4">
            <li>
                <div class="banner-4"></div>
            </li>
            <li>
                <div class="banner-3"></div>
            </li>
            <li>
                <div class="banner-2"></div>
            </li>
            <li>
                <div class="banner-1"></div>
            </li>
        </ul>
    </div>
    <div class="clearfix"></div>
</div>
<!--banner-ends-->


<!--Slider-Starts-Here-->
<script src="/resources/themes/thema2/js/responsiveslides.min.js"></script>
<!--start-banner-bottom-->
<div class="banner-bottom">
    <div class="container">
        <div class="banner-bottom-top">
            <div class="col-md-6 banner-bottom-left">
                <div class="bnr-one">
                    <div class="bnr-left">
                        <h1>${hitItem[0].pname}</h1>
                        <p>￦${hitItem[0].price}</p>
                        <div class="b-btn">
                            <a href="/member/thema2/view?shopname=${param.shopname}&pno=${hitItem[0].pno}">SHOP NOW</a>
                        </div>
                    </div>
                    <div class="bnr-right">
                        <img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${hitItem[0].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
                        alt="" style="width: 100%; max-height: 255px;"/>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-6 banner-bottom-right">
                <div class="bnr-two">
                    <div class="bnr-left">
                        <h1>${hitItem[1].pname}</h1>
                        <p>￦${hitItem[2].price}</p>
                        <div class="b-btn">
                            <a href="/member/thema2/view?shopname=${param.shopname}&pno=${hitItem[1].pno}">SHOP NOW</a>
                        </div>
                    </div>
                    <div class="bnr-right">
                       <img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${hitItem[1].ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164" 
                       alt="" style="width: 100%; max-height: 255px;"/>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--end-banner-bottom-->

<div class="shoes">
    <div class="container">
    <hr/>
    <h2 style="text-align: center;">- New Item -</h2>
        <div class="product-one">
      	  <c:forEach items="${newItem}" var="vo">
            <div class="col-md-3 product-left">
                <div class="p-one simpleCart_shelfItem">
                    <a href="/member/thema2/view?shopname=${param.shopname}&pno=${vo.pno}">
                        <img src="https://firebasestorage.googleapis.com/v0/b/project-26bd6.appspot.com/o/products%2F${vo.ptitlephoto}?alt=media&token=5efdca0d-caa2-4c84-b3d8-23683e4f3164"
                         alt="" style='min-height:200px;max-height: 200px;'/>
                    </a>
                    <h5>${vo.pname}</h5>
                    <p><span class=" item_price">￦${vo.price}</span></p>
                </div>
            </div>
       	  </c:forEach>
        </div>
    </div>
</div>

<%@include file="footer.jsp"%>
</body>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
        // Slideshow 4
        $("#slider4").responsiveSlides({
            auto: true,
            pager: true,
            nav: false,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>
<!--End-slider-script-->
</html>