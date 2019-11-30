<!DOCTYPE html>
<html>
    <head>
        <title>Results</title>
        <link rel="stylesheet" type="text/css" href="base.css">
	<link rel="icon" href="images/nc.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
	<header>
		<h1 id="title">Outage Assistant</h1>
		<h3 id="subtitle">subtitle goes here :)</h3>
	</header>

	<%@include file="topNav.jsp"%>

	<br>
	
	<main>

		<h2 align="center">USE FILTERS TO SORT OUTAGES</h2>
		<br>
		
                <%@include file="archiveTable.jsp" %>
	
	</main>

	
	<footer>
        	<hr>
        	<p>
            	<b> All content on this page is used for educational, non-profit purposes</b>
        	</p>
        	<p>©2018 Group 8, All Rights Reserved</p>
		<br>
    	</footer>
	<br>
    </body>
</html>
