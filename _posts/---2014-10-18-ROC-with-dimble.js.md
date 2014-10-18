---
layout: post
category : js
tagline: "ROC with dimble.js"
tags : [dimble]
---
<script type="text/javascript" src="http://d3js.org/d3.v3.min.js">
</script>
<script type="text/javascript" src="http://dimplejs.org/dist/dimple.v2.1.0.min.js">
</script>
<div id="roc">
<h4>ROC Curve Comparison</h4></div>
<div id="bar">
<h4>Value False Positive Rate</h4></div>
<script type="text/javascript">
    var svg = dimple.newSvg("#roc", 550, 500);
    d3.tsv("data1.tsv", function (data) {

      // Filter for a single SKU and Channel
      //data = dimple.filterData(data, "SKU", "Theta 18 Pack Standard");
      //data = dimple.filterData(data, "Channel", "Hypermarkets");

      // Create and Position a Chart
      var myChart = new dimple.chart(svg, data);
      myChart.setBounds(60, 30, 400, 400);
	  myChart.addMeasureAxis("x", "False Positive Rate");
	   // Order the x axis by date
      //x.addOrderRule("xline");
      myChart.addMeasureAxis("y", "True Positive Rate");
	  
      var lines =myChart.addSeries(["False Positive Rate","Model"], dimple.plot.line);
      lines.lineWeight = 3;
      lines.lineMarkers = true;
	  lines.getTooltipText = function (e) {
                return [
                    "TP Rate: " + e.yValue,
                    "FP Rate: "	+ e.xValue			
                ];
            };
	  
	  myLegend = myChart.addLegend(60, 10, 400, 20, "left");
	  

      // Draw the chart
      myChart.draw();
	  
	  var bHeight = 400;
	  var sampleSVG = d3.select("#bar")
        .append("svg")
        .attr("width", 400)
        .attr("height", bHeight);  

      var rCir = 10;	  
	  d3.selectAll("circle").on("mouseover", null);
      d3.selectAll("circle").on("mouseover", function (e) {
          d3.select(this).style("opacity", 1);
          dimple._showPointTooltip(e, this, myChart, lines);
		  rCir = e.yValue*80;
		 
		 
		 var res_data_1 = dimple.filterData(dimple.filterData(data, "Model", "Model 1"),"False Positive Rate",e.xValue.toString());
         var res_data_2 = dimple.filterData(dimple.filterData(data, "Model", "Model 2"),"False Positive Rate",e.xValue.toString());		 // Row 1 only
		 //alert([e.xValue,e.yValue,e.aggField[0],e.aggField[1],e.aggField.slice(-1)[0],JSON.stringify(res_data_1[0].Cost)]);
		 
		 sampleSVG.append("rect")
        .style("fill", "royalblue")
		.style("opacity", 0.5)
        .attr("x", 50)
        .attr("y", 0)
        .attr("width", 50)
		.attr("height",res_data_1[0].Cost*10)
		
		sampleSVG.append('text').text(Math.round(res_data_1[0].Cost*10))
                .attr('x', 65)
                .attr('y', 15)
                .attr('fill', 'black')
		
		sampleSVG.append("rect")
        .style("fill", "red")
		.style("opacity", 0.5)
        .attr("x", 110)
        .attr("y", 0)
        .attr("width", 50)
		.attr("height",res_data_2[0].Cost*10)

		sampleSVG.append('text').text(Math.round(res_data_2[0].Cost*10))
                .attr('x', 125)
                .attr('y', 15)
                .attr('fill', 'black')
		  
      });
	  
	  d3.selectAll("circle").on("mouseleave", function (e) {
		 sampleSVG.append("rect")
        .style("fill", "white")
        .attr("x", 0)
        .attr("y", 0)
        .attr("width", 400)
		.attr("height",400)
		
		//sampleSVG.append("rect")
        //.style("fill", "white")
        //.attr("x", 110)
        //.attr("y", 0)
        //.attr("width", 50)
		//.attr("height",200)
		  
      });
	  
	  

    });
  </script>