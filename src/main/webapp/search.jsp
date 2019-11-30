<!DOCTYPE html>
<html>
    <head>
        <title>Search Outages</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="base.css">
	<link rel="icon" href="images/nc.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
	<header>
		<h1 id="title">Outage Assistant</h1>
		<h3 id="subtitle">Outage Information for the Carolinas</h3>
	</header>

	<%@include file="topNav.jsp"%>

	<br>
	
	<main>

		<h2 align="center">SEARCH OUTAGES</h2>
		<br>
		
		<form class="search" action="SearchServlet">
 			<input type="text" placeholder="Search.." name="search">
  			<button type="submit"><i class="fa fa-search"></i></button>
		</form>
		<br>
		<br>
		<h3 align="center">Don't know exactly what you're looking for?</h3>
		<h2 align="center"><a href="archive.jsp">SORT WITH FILTER</a></h2>
	
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