<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" %>
<%@ page import="com.demo.Booking" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.BookingService" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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

<h1> Selected Booking: </h1>

<%
    if (session.getAttribute("type").equals("customer")) {

    } else if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
    else {
        response.sendRedirect("login_redirect.jsp");
    }

    int booksid = Integer.parseInt(request.getParameter("bookingid"));
    BookingService service = new BookingService();
    Room selectedRoom = null;
    Booking selectedBooking = null;

    try {
        selectedBooking = service.getBookingByBookingID(booksid);
        selectedRoom = service.getRoomByBookingID(booksid);
    } catch (Exception e){
          e.printStackTrace();
          response.sendRedirect("customer_d_error.jsp");
    }

    if (request.getMethod().equals("POST")) {
        try {
            boolean worked = service.deleteBooking(booksid);
            if (worked){
               response.sendRedirect("customer_d_success.jsp");
            } else {
               response.sendRedirect("customer_d_error.jsp");
            }

        } catch (Exception e){
             e.printStackTrace();
             response.sendRedirect("customer_b_error.jsp");
        }
    }
%>

<h2> Room Info: </h2>
<div>
    <div class="room-container">
        <ul class="room-info">
            <li><span>Room ID: </span> <%= selectedRoom.getRoomID() %></li>
            <li><span>Hotel ID: </span> <%= selectedRoom.getHotelID() %></li>
            <li><span>Price: </span> <%= selectedRoom.getPrice() %></li>
            <li><span>Capacity: </span> <%= selectedRoom.getCapacity() %></li>
            <li><span>View: </span> <%= selectedRoom.getSea_mountainView() %></li>
            <li><span>Damage: </span> <%= selectedRoom.getDamage() %></li>
            <li><span>Extension: </span> <%= selectedRoom.getExtension() %></li>
        </ul>
    </div>
</div>

<h2> Booking Info: </h2>
<div>
    <div class="room-container">
        <ul class="room-info">
            <li><span>Booking ID: </span> <%= selectedBooking.getBookingID() %></li>
            <li><span>Start Date: </span> <%= selectedBooking.getStartDate() %></li>
            <li><span>End Date: </span> <%= selectedBooking.getEndDate() %></li>
        </ul>
    </div>
</div>

<form method="post">
    <input type="hidden" name="roomID" value="<%= selectedRoom.getRoomID() %>">
    <button type="submit" class="book-room-button">Delete Booking</button>
</form>

<div class="button-container1">
     <form action="customer_view_booking.jsp">
         <button type="submit" class="button1">Go Back</button>
     </form>
</div>

</body>
</html>