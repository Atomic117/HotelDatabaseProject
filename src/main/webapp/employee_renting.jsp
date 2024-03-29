<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.demo.UserService" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.RentingService" %>
<%@ page import="com.demo.BookingService" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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

        int ids = Integer.parseInt(request.getParameter("roomIDs"));
        BookingService service1 = new BookingService();
        Room selectedRoom = null;

        try {
              selectedRoom = service1.getRoomByID(ids);
        } catch (Exception e){
              e.printStackTrace();
              response.sendRedirect("employee_r_error.jsp");
        }
%>
<%

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int id = Integer.parseInt(request.getParameter("typeid"));
        String address = request.getParameter("address");
        int payment = Integer.parseInt(request.getParameter("paymentid"));
        Date outDate = (Date) session.getAttribute("outdate1");

        UserService service2 = new UserService();
        int customerid = -1;

        try {
            boolean worked = service2.signUpCustomer(username, password, id, address);
            customerid = service2.findCustomerID(username);
        } catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("employee_rc_error.jsp");
        }

        RentingService service3 = new RentingService();
        try {
            boolean worked2 = service3.createRenting(customerid, selectedRoom.getRoomID(), payment, outDate);
            if (worked2){
                response.sendRedirect("employee_r_success.jsp");
            } else {
                response.sendRedirect("employee_r_error.jsp");
            }
        } catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("employee_r_error.jsp");
        }
    }
%>

<h2> Room Info </h2>
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


<form method="post" class="login-form">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
     <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
     </div>
     <div class="form-group">
        <label for="typeid">ID Number:</label>
        <input type="text" id="typeid" name="typeid" required>
     </div>
     <div class="form-group">
        <label for="paymentid">Payment Number:</label>
        <input type="text" id="paymentid" name="paymentid" required>
     </div>
    <button type="submit">Complete Renting</button>
</form>

<form action="employee_search.jsp" method="get" class="signup-button">
    <button type="submit">Continue Search</button>
</form>


</body>
</html>