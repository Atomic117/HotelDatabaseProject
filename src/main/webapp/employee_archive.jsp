<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" %>
<%@ page import="com.demo.Renting" %>
<%@ page import="com.demo.Customer" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.RentingService" %>
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
        response.sendRedirect("customer.jsp");
    } else if (session.getAttribute("type").equals("employee")){

    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
    else {
        response.sendRedirect("login_redirect.jsp");
    }


    int rentsid = Integer.parseInt(request.getParameter("rentsid"));
    RentingService service = new RentingService();
    Room selectedRoom = null;
    Renting selectedRenting = null;
    Customer selectedCustomer = null;

    try {
        selectedRenting = service.getRentingByRentingID(rentsid);
        selectedRoom = service.getRoomByRentingID(rentsid);
        selectedCustomer = service.findCustomerByRentingID(rentsid);
    } catch (Exception e){
          e.printStackTrace();
          response.sendRedirect("employee_a_error.jsp");
    }

    if (request.getMethod().equals("POST")) {
        String info = (String) request.getParameter("info");
        try {
            boolean worked = service.archivesRenting(selectedRenting, info);
            if (worked){
               response.sendRedirect("employee_a_success.jsp");
            } else {
               response.sendRedirect("employee_a_error.jsp");
            }

        } catch (Exception e){
             e.printStackTrace();
             response.sendRedirect("employee_a_error.jsp");
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
            <li><span>Booking ID: </span> <%= selectedRenting.getBookingID() %></li>
            <li><span>Paymet Number: </span> <%= selectedRenting.getPayment() %></li>
            <li><span>Start Date: </span> <%= selectedRenting.getStartDate() %></li>
            <li><span>End Date: </span> <%= selectedRenting.getEndDate() %></li>
        </ul>
    </div>
</div>

<h2> Customer Info: </h2>
<div>
    <div class="room-container">
        <ul class="room-info">
            <li><span>Customer ID: </span> <%= selectedCustomer.getCustomerID() %></li>
            <li><span>Name: </span> <%= selectedCustomer.getFullName()%></li>
            <li><span>Address: </span> <%= selectedCustomer.getAddress() %></li>
            <li><span>ID Type: </span> <%= selectedCustomer.getTypeID() %></li>
        </ul>
    </div>
</div>

<div class="button-container1">
    <form method="post" class="login-form">
         <div class="form-group">
            <label for="info">Additional Info:</label>
            <input type="text" id="info" name="info" required>
         </div>
        <button type="submit">Archive</button>
    </form>
</div>
<div class="button-container1">
     <form action="employee_view_renting.jsp">
         <button type="submit" class="button1">Go Back</button>
     </form>
</div>



</body>
</html>