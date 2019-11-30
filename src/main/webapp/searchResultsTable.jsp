<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Database.PaginationSettings"%>
<%@page import="java.util.List"%>
<%@page import="Database.Entities.Record"%>
<%@page import="javax.enterprise.context.SessionScoped"%>
<%@page import="Database.DatabaseManager"%>
<%
    try {
        PaginationSettings ps = new PaginationSettings(1, 40);
        if(session.getAttribute("sort")!=null){
            System.out.println("sorting by " + session.getAttribute("sort"));
            ps.orderBy = (String)session.getAttribute("sort");
        }
        List<Record> records = DatabaseManager.getRecordsByCounties(((List<Integer>)session.getAttribute("searchedIds")), ps);
        session.setAttribute("searchRes", records);
    } catch (Exception e) {
        session.setAttribute("dbError", true);
    }
%>
<table id="current">
    <tr>
        <th>County</th>
        <th><a href="TableManagerServlet?sort=customersServed&origination=/searchResults.jsp#current">Customers Tracked</a></th> 
        <th><a href="TableManagerServlet?sort=customersWithoutPower&origination=/searchResults.jsp#current">Customers Out</a></th>
        <th><a href="TableManagerServlet?sort=time&origination=/searchResults.jsp#current">Date</a></th>
    </tr>
    <c:forEach var="record" items="${sessionScope.searchRes}">
        <tr>
            <td>${record.getCounty()}</td>
            <td>${record.getCustomersServed()}</td>
            <td>${record.getCustomersWithoutPower()}</td>
            <td>${record.getFormattedDate()}</td>
        </tr>
    </c:forEach>

</table>


