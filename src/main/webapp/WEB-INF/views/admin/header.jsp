<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="http://t4t5.github.io/sweetalert/dist/sweetalert.css" rel="stylesheet">
<script src="https://www.gstatic.com/firebasejs/3.6.2/firebase.js"></script>
<script src="http://t4t5.github.io/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>  
	
<!-- Bootstrap Core CSS -->
<link href="/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/admin/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="/resources/admin/vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
<div id="wrapper">

    <!-- Navigation -->
    
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index">Admin Page</a>
        </div>
        <!-- /.navbar-header -->


        <ul class="nav navbar-top-links navbar-right">
            <li>
                <a class="dropdown-toggle member" href="">
                    <i class="fa fa-window-restore"></i>
                </a>
                <!-- /.dropdown-messages -->
            </li>
            <!-- /.dropdown -->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
                	<i onclick="myFunction()" id="dropbtn" class="fa fa-bell fa-fw"></i> 
                	<span id="count" class="label label-success">0</span>
                </a>
                <ul style="overflow:scroll; width:350px; height:500px;" class="dropdown-menu dropdown-messages" id="myDropdown">

                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="index"><i class="fa fa-dashboard fa-fw"></i> HOME</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i>상품목록<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="listAction">전체보기</a>
                            </li>
                            <li>
                                <a href="categoryListAction?pkind=아우터">아우터</a>
                            </li>
                            <li>
                                <a href="categoryListAction?pkind=상의">상의</a>
                            </li>
                            <li>
                                <a href="categoryListAction?pkind=하의">하의</a>
                            </li>
                            <li>
                                <a href="categoryListAction?pkind=신발 및 악세사리">신발 및 악세사리</a>
                            </li>
                            <li>
                                <a href="categoryListAction?pkind=기타">기타</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i>주문관리<span class="fa arrow"></span></a>
                 <ul class="nav nav-second-level">
                            <li>
                                <a href="order">현재 주문 관리</a>
                            </li>
                            <li>
                                <a href="orderList">전체 주문 현황</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="write"><i class="fa fa-edit fa-fw"></i>상품 등록</a>
                    </li>
                    <li>
                        <a href="cardEdit?pageNum=1">&nbsp;<i class="fa fa-id-badge"></i>&nbsp;카드 제작</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
        