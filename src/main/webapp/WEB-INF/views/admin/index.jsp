<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@include file="header.jsp"%>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">CHART</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
           
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 기간별 판매량
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                     <!-- /.col-lg-8 -->
	                <div class="col-lg-4">
	                    <!-- /.panel -->
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            <i class="fa fa-bar-chart-o fa-fw"></i> 분류별 소비자 평점 평균
	                        </div>
	                        <div class="panel-body">
	                            <div id="morris-donut-chart"></div>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-4 -->
	                
                    <!-- /.panel -->
                    <div class="panel panel-default col-lg-12">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 
                           		연령별 통계
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>연령별</th>
                                                    <th>남자</th>
                                                    <th>여자</th>
                                                    <th>수익(만원)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>10대</td>
                                                    <td>33%</td>
                                                    <td>67%</td>
                                                    <td>1000</td>
                                                </tr>
                                                <tr>
                                                    <td>20대</td>
                                                    <td>43%</td>
                                                    <td>57%</td>
                                                    <td>1250</td>
                                                </tr>
                                                <tr>
                                                    <td>30대</td>
                                                    <td>12%</td>
                                                    <td>78%</td>
                                                    <td>730</td>
                                                </tr>
                                                <tr>
                                                    <td>40대</td>
                                                    <td>-</td>
                                                    <td>100%</td>
                                                    <td>660</td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.col-lg-4 (nested) -->
                                <div class="col-lg-6">
                                    <div id="morris-bar-chart"></div>
                                </div>
                                <!-- /.col-lg-8 (nested) -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
               
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
<%@include file="footer.jsp"%>