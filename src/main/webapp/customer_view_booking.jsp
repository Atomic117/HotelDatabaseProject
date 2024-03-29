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
    <title>Customer</title>
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

     } else if (session.getAttribute("type").equals("employee")){
         response.sendRedirect("employee.jsp");
     } else if (session.getAttribute("type").equals("admin")){
         response.sendRedirect("admin.jsp");
     } else {
         response.sendRedirect("index.jsp");
     }
     session.setAttribute("filter", "no");
     session.setAttribute("room", "1000");
     session.setAttribute("star", "0");
     session.setAttribute("chainid", "0");
     session.setAttribute("price", "0");
     session.setAttribute("total", "0");
     session.setAttribute("indate", "0");
     session.setAttribute("outdate", "0");

 %>

 <%
     BookingService findBookings = new BookingService();
     UserService service = new UserService();
     String username = (String) session.getAttribute("name");
     ArrayList<Booking> books = null;

     try {
         int customerID = service.findCustomerID(username);
         books = findBookings.getCustomerBookings(customerID);
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("customer_bv.jsp");
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
             <li><span>Start: </span> <%= currentBooking.getStartDate() %></li>
             <li><span>End: </span> <%= currentBooking.getEndDate() %></li>
         </ul>
         <a href="customer_edit_booking.jsp?bookingid=<%= currentBooking.getBookingID() %>" class="book-button">View your booking</a>
     </div>
     <%
             }
         } else {
             out.println("<p>No current bookings found.</p>");
         }
     %>
 </div>

 <div class="button-container1">
     <form action="customer.jsp">
         <button type="submit" class="button1">Go back</button>
     </form>
 </div>


  </body>
  </html>