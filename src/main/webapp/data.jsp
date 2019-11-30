<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="Database.Entities.County"%>
<%@page import="Database.Entities.AggregateRecord"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Database.PaginationSettings"%>
<%@page import="java.util.List"%>
<%@page import="Database.Entities.Record"%>
<%@page import="javax.enterprise.context.SessionScoped"%>
<%@page import="Database.DatabaseManager"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Visual Data</title>
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


    <%
        try {
            if (session.getAttribute("aggregateRecords") == null) {
                List<AggregateRecord> records = DatabaseManager.getAllAggregateRecords();
                session.setAttribute("aggregateRecords", records);
            }
        } catch (Exception e) {
            session.setAttribute("dbError", true);
        }
        try {
            if (session.getAttribute("allCounties") == null) {
                List<County> records = DatabaseManager.getAllCounties();
                session.setAttribute("allCounties", records);
            }
        } catch (Exception e) {
            session.setAttribute("dbError", true);
        }
        
    %>

    <body>
        <header>
            <h1 id="title">Outage Assistant</h1>
            <h3 id="subtitle">Outage Information for the Carolinas</h3>
        </header>

        <%@include file="topNav.jsp"%>

        <br>

        <main>

            <h2 align="center">VISUAL DATA</h2>
            <br>
            <!-- <h3>Outage Visualizations</h3> -->


            <!-- Tab content -->
            <div id="Line" class="tabcontent">
                <canvas id="myChart1"  width="35%" height="15%"></canvas>

                <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

                <script>
                    var ctx = document.getElementById('myChart1').getContext('2d');
                    var chart = new Chart(ctx, {
                    // The type of chart we want to create
                    type: 'line',

                    // The data for our dataset
                    data: {
                    labels: [
                     <c:forEach var="record" items="${sessionScope.aggregateRecords}">
                        '${record.getFormattedDate()}',
                    </c:forEach>
                    ],
                    datasets: [{
                    label: 'Customers Without Power',
                    backgroundColor: 'rgb(66, 188, 245)',
                    borderColor: 'rgb(66, 188, 245)',
                    data: [
                    <c:forEach var="record" items="${sessionScope.aggregateRecords}">
                        '${record.getCustomersWithoutPower()}',
                    </c:forEach>
                    ]
                    }]
                    },

                    // Configuration options go here
                    options: {}
                    });
                </script>
            </div>


            <script>
                function openCity(evt, cityName) {
                // Declare all variables
                var i, tabcontent, tablinks;

                // Get all elements with class="tabcontent" and hide them
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
                }

                // Get all elements with class="tablinks" and remove the class "active"
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
                }

                // Show the current tab, and add an "active" class to the button that opened the tab
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
                }
                // Get the element with id="defaultOpen" and click on it
                document.getElementById("defaultOpen").click();
            </script>

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
