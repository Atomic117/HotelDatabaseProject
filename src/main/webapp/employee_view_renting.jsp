<%@ page import="com.demo.RentingService" %>
<%@ page import="com.demo.UserService" %>
<%@ page import="com.demo.Renting" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee</title>
    <link rel="stylesheet" href="MainStyle.css">
</head>
<body>

<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="customer_search.jsp">Search Rooms</a></li>
        <li><a href="about.jsp">About Us</a></li>
    </ul>
</nav>

<%
     if (session.getAttribute("type").equals("customer")) {
        response.sendRedirect("customer.jsp");
     } else if (session.getAttribute("type").equals("employee")){

     } else if (session.getAttribute("type").equals("admin")){
         response.sendRedirect("admin.jsp");
     } else {
         response.sendRedirect("index.jsp");
     }


 %>

 <%
     RentingService findRentings = new RentingService();
     UserService service = new UserService();
     String username = (String) session.getAttribute("name");
     ArrayList<Renting> rents = null;
     int employee = -1;

     try {
         employee = service.findEmployeeID(username);
         rents = findRentings.employeeFindRenting(employee);
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("employee_av_error.jsp");
     }
 %>

 <h2>Current Rentings</h2>
 <div>
     <%
         if (rents != null && !rents.isEmpty()) {
             for (Renting currentRenting : rents) {
     %>
     <div class="room-container">
         <ul class="room-info">
             <li><span>Renting ID: </span> <%= currentRenting.getBookingID() %></li>
             <li><span>Customer ID: </span> <%= currentRenting.getCustomerID() %></li>
             <li><span>Room ID: </span> <%= currentRenting.getRoomID() %></li>
             <li><span>Payment Number: </span> <%= currentRenting.getPayment() %></li>
             <li><span>Start: </span> <%= currentRenting.getStartDate() %></li>
             <li><span>End: </span> <%= currentRenting.getEndDate() %></li>
         </ul>
         <a href="employee_archive.jsp?rentsid=<%= currentRenting.getBookingID() %>" class="book-button">Archive</a>
     </div>
     <%
             }
         } else {
             out.println("<p>No current rentings found.</p>");
         }
     %>
 </div>

 <div class="button-container1">
     <form action="employee.jsp">
         <button type="submit" class="button1">Go back</button>
     </form>
 </div>


  </body>
  </html>