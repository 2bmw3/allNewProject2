<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Shopping mall</title>
</head>
<style>

/*
.chart rect {
  fill: steelblue;
}
*/
.chart .legend {
  fill: black;
  font: 14px sans-serif;
  text-anchor: start;
  font-size: 12px;
}

.chart text {
  fill: white;
  font: 10px sans-serif;
  text-anchor: end;
}

.chart .label {
  fill: black;
  font: 14px sans-serif;
  text-anchor: end;
}

.bar:hover {
  fill: brown;
}

.axis path,
.axis line {
  fill: none;
  stroke: #000;
  shape-rendering: crispEdges;
}


</style>
<!--/head-->
<%@include file="header.jsp"%>
<body>

               <!-- rate start -->
               <div class="container">
                  <div class="row">
                     <form>
                        <h2>연령별 구매 통계</h2>
                        <svg class="chart"></svg>
                     </form>
                  </div>
               </div>
               <!-- rate end -->


            </div>
         </div>

      </div>



   </div>
   <script src="http://d3js.org/d3.v3.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery.scrollUp.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/price-range.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery.prettyPhoto.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/contact.js"></script>
   <script>
      var data = {

         labels : [ '10대', '20대', '30대', '40대', '50대 이상' ],

         series : [ {
            label : '아우터',
            values : [ 4, 8, 15, 16, 23, 42 ]
         }, {
            label : '상의',
            values : [ 12, 43, 22, 11, 73, 25 ]
         }, {
            label : '하의',
            values : [ 31, 28, 14, 8, 15, 21 ]
         }, {
            label : '기타',
            values : [ 2, 4, 6, 8, 6, 7 ]
         } ]
      };

      var chartWidth = 300, barHeight = 20, groupHeight = barHeight
            * data.series.length, gapBetweenGroups = 10, spaceForLabels = 150, spaceForLegend = 150;

      // Zip the series data together (first values, second values, etc.)
      var zippedData = [];
      for (var i = 0; i < data.labels.length; i++) {
         for (var j = 0; j < data.series.length; j++) {
            zippedData.push(data.series[j].values[i]);
         }
      }

      // Color scale
      var color = d3.scale.category20();
      var chartHeight = barHeight * zippedData.length + gapBetweenGroups
            * data.labels.length;

      var x = d3.scale.linear().domain([ 0, d3.max(zippedData) ]).range(
            [ 0, chartWidth ]);

      var y = d3.scale.linear().range([ chartHeight + gapBetweenGroups, 0 ]);

      var yAxis = d3.svg.axis().scale(y).tickFormat('').tickSize(0).orient(
            "left");

      // Specify the chart area and dimensions
      var chart = d3.select(".chart").attr("width",
            spaceForLabels + chartWidth + spaceForLegend).attr("height",
            chartHeight);

      // Create bars
      var bar = chart.selectAll("g").data(zippedData).enter().append("g")
            .attr(
                  "transform",
                  function(d, i) {
                     return "translate("
                           + spaceForLabels
                           + ","
                           + (i * barHeight + gapBetweenGroups
                                 * (0.5 + Math.floor(i
                                       / data.series.length)))
                           + ")";
                  });

      // Create rectangles of the correct width
      bar.append("rect").attr("fill", function(d, i) {
         return color(i % data.series.length);
      }).attr("class", "bar").attr("width", x).attr("height", barHeight - 1);

      // Add text label in bar
      bar.append("text").attr("x", function(d) {
         return x(d) - 3;
      }).attr("y", barHeight / 2).attr("fill", "red").attr("dy", ".35em")
            .text(function(d) {
               return d;
            });

      // Draw labels
      bar.append("text").attr("class", "label").attr("x", function(d) {
         return -10;
      }).attr("y", groupHeight / 2).attr("dy", ".35em").text(function(d, i) {
         if (i % data.series.length === 0)
            return data.labels[Math.floor(i / data.series.length)];
         else
            return ""
      });

      chart.append("g").attr("class", "y axis").attr(
            "transform",
            "translate(" + spaceForLabels + ", " + -gapBetweenGroups / 2
                  + ")").call(yAxis);

      // Draw legend
      var legendRectSize = 18, legendSpacing = 4;

      var legend = chart.selectAll('.legend').data(data.series).enter()
            .append('g').attr(
                  'transform',
                  function(d, i) {
                     var height = legendRectSize + legendSpacing;
                     var offset = -gapBetweenGroups / 2;
                     var horz = spaceForLabels + chartWidth + 40
                           - legendRectSize;
                     var vert = i * height - offset;
                     return 'translate(' + horz + ',' + vert + ')';
                  });

      legend.append('rect').attr('width', legendRectSize).attr('height',
            legendRectSize).style('fill', function(d, i) {
         return color(i);
      }).style('stroke', function(d, i) {
         return color(i);
      });

      legend.append('text').attr('class', 'legend').attr('x',
            legendRectSize + legendSpacing).attr('y',
            legendRectSize - legendSpacing).text(function(d) {
         return d.label;
      });
   </script>
</body>
</html>