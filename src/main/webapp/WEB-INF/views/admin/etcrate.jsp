<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shopping mall</title>

<%@include file="header.jsp"%>
</head>


<body>
   <div class="container">
      <div>
         <div class="col-sm-10 col-sm-offset-1">

            <!-- chart start -->
            <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
            <!-- chart end -->
         </div>
      </div>
   </div>
   </div>
   </div>

   </div>

   </div>
</body>


<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   google.charts.load("current", {
      packages : [ "corechart" ]
   });
   google.charts.setOnLoadCallback(drawChart);
   function drawChart() {
      var data = google.visualization.arrayToDataTable([
            [ 'Task', 'Hours per Day' ], [ '아우터', 110 ], [ '기타', 10 ],
            [ '신발&악세사리', 20 ], [ '하의', 50 ], [ '상의', 70 ] ]);

      var options = {
         title : '항목별 통계',
         is3D : true,
      };

      var chart = new google.visualization.PieChart(document
            .getElementById('piechart_3d'));
      chart.draw(data, options);
   }
</script>
</body>
</html>