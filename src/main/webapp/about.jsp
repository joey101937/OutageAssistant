<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        <link rel="stylesheet" type="text/css" href="base.css">
	<link rel="icon" href="images/nc.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>
	<header>
		<h1 id="title">Outage Assistant</h1>
		<h3 id="subtitle">Outage Information for the Carolinas</h3>	</header>

	<%@include file="topNav.jsp"%>

	<br>
	
	<main>

		<h2 align="center">ABOUT US</h2>
		<br>
		<img class="group" src="images/campus.jpg" alt="UNCC">
		<br>
		<h3>The Problem</h3>
			<p>Power outages are common occurrences in our world today and are frequently documented by power companies. However, these providers only document the current outages in their respective areas of coverage. Most often these results refresh after 30 minutes, bringing forth a batch of new results. A majority of power providers do not allow access to information about past outages, and if they do it is often locked behind a paywall or lengthy legal process. Insurance companies, independent contractors, as well as everyday end users often do not have the means to access this information. </p>
		<h3>Our Solution</h3>
			<p>The solution to this problem is Outage Assistant: a reliable and informative web application providing both current and historical information about power outages in North Carolina. Outage Assistant is a completely free and public alternative to dealing directly with power companies, and utilizes unique visualizations to complement the collected data. With up-to-date information about current outages and a detailed log of previous occurrences, insurance companies and contractors will always have a reliable source of event-tracking. </p>
		<h3>Our Features</h3>
			<p>Outage Assistant is home to three primary features: 
				<ul>
					<li>The first is a detailed list of current outages in North Carolina, specifically the counties covered by Duke Power. This list provides the county, date, number of customers tracked, and the number of customers currently without power. </li> 
					<li>The second feature is a collection of data visualizations used to represent the current status of the power grid as well as its integrity over a selected course of time. Both of these features are found on the same home page of the web application while the third has its own standalone page. </li> 
					<li>This third feature is an archive that allows users to view historical outages. These entries can be searched with a designated query or can be sorted via filters.</li> </p>
				</ul>
		<h3>Technologies Used</h3>
			<p>The framework for Outage Assistant was built with the idea of a web application in mind. We discussed if it would be better to build this concept as a local application, but eventually decided that access from anywhere via the Internet would be the more functional and useful choice. The idea for a mobile application was also considered, but eventually excluded due to the limited access found in a mobile app compared to a website. After considering what platform industry professionals would most often use, the concept was developed into a web application. </p>
		<h3>Development</h3>
			<p>This project was developed by Martin Katz, Racheal Libberton, Austin Thomas, Joseph De Meis, and Vinith Kantamneni as part of the ITCS 4155 Capstone course at UNC Charlotte. This application was built over the span of the 2019 Fall semester and developed under the agile style of workflow. Three sprints were envisioned and presented to show progress during the semester and various prototypes were tested before moving onto the final product. </p>
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
