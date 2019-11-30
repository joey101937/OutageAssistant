<!DOCTYPE html>
<html>
    <head>
        <title>Current Outages</title>
        <link rel="stylesheet" type="text/css" href="base.css">
	<link rel="icon" href="images/nc.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
				.annotation-note-label {
					font-size: 10px;
					fill: #000;
				}
			</style>
	</head>

    <body>
	<header>
		<h1 id="title">Outage Assistant</h1>
		<h3 id="subtitle">Outage Information for the Carolinas</h3>
	</header>

        <%@include file="topNav.jsp"%>

	<br>
	
	<main>
	
		<h2 align="center">OUTAGE MAP</h2>
		<br>
		<!-- <h3>Outage Visualizations</h3> -->

			<svg width="960" height="500"></svg>
			<script src="https://d3js.org/d3.v4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/d3-annotation/2.1.0/d3-annotation.min.js"></script>

			<script>
					var svg = d3.select("svg");
					//create projection for map and pass that to the path generator
					var projection = d3
						.geoAlbers()
						.rotate([0, 62, 0]);
					var path = d3.geoPath(projection);
					d3.json("ncmap.json", function (error, mapData) {
						if (error) throw error;
						var projection = d3
							.geoAlbers()
							.rotate([0, 62, 0])
							.fitSize([d3.select("svg").attr("width")-50, d3.select("svg").attr("height")], mapData);         
							var path = d3.geoPath(projection);
						svg
							.append("g")
							.selectAll("path")
							.data(mapData.features)
							.enter()
							.append("path")
							.attr("d", path)
							.attr("class", "county")
							.attr("id", function (d) {
								return d.properties.county;
							})
							.attr("fill", "#fff")
							.style("stroke", "#d3d3d3")
							.attr("transform", "translate(25, 0)");
							
						// make initial annotation estimations and start annotations tool
						var annotations = mapData.features.map(function (el) {
							return {
								note: { label: el.properties.county, orientation: "topBottom"},
								x: path.centroid(el.geometry)[0],
								y: path.centroid(el.geometry)[1] - 10
							}
						});
						
						window.makeAnnotations = d3.annotation()
							.type(d3.annotationLabel)
							.annotations(annotations)
							.disable(["connector", "subject"])
							//.editMode(true);
						svg.append("g")
							.attr("class", "annotation-group")
							.attr("transform", "translate(25, 0)")
							.call(makeAnnotations);
						//document.getElementById("editMode").addEventListener("click", function () {
						//	makeAnnotations.editMode(!makeAnnotations.editMode()).update(); 
						//});
					});
				</script> 
		<br>
	<h3>Past Month's Outages</h3>
	
	<%@ include file="currentOutagesTable.jsp" %>
        
	<br>
	</main>

	<footer>
        	<hr>
        	<p>
            	<b> All content on this page is used for educational, non-profit purposes</b>
        	</p>
        	<p>©2019 Group 8, All Rights Reserved</p>
		<br>
    	</footer>
	<br>
    </body>
</html>