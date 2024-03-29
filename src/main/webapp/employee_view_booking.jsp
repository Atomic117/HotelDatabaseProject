<%@ page import="com.demo.BookingService" %>
<%@ page import="com.demo.UserService" %>
<%@ page import="com.demo.Booking" %>
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
     BookingService findBookings = new BookingService();
     UserService service = new UserService();
     String username = (String) session.getAttribute("name");
     ArrayList<Booking> books = null;
     int employee = -1;

     try {
         employee = service.findEmployeeID(username);
         books = findBookings.getEmployeeBookings(employee);
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("employee_cv_error.jsp");
     }
 %>

 <h2>Current Bookings</h2>
 <div>
     <%
         if (books != null && !books.isEmpty()) {
             for (Booking currentBooking : books) {
     %>
     <div class="room-container">
         <ul class="room-info">
             <li><span>Booking ID: </span> <%= currentBooking.getBookingID() %></li>
             <li><span>Room ID: </span> <%= currentBooking.getRoomID() %></li>
             <li><span>Customer ID: </span> <%= currentBooking.getCustomerID() %></li>
             <li><span>Start: </span> <%= currentBooking.getStartDate() %></li>
             <li><span>End: </span> <%= currentBooking.getEndDate() %></li>
         </ul>
         <a href="employee_booking.jsp?bookingid=<%= currentBooking.getBookingID() %>" class="book-button">Convert into Renting</a>
     </div>
     <%
             }
         } else {
             out.println("<p>No current bookings found.</p>");
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