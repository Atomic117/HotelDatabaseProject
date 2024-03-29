<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.BookingService" %>
<%@ page import="com.demo.UserService" %>
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

<h1> Selected Room: </h1>

<%
    if (session.getAttribute("filter").equals("no")){
        response.sendRedirect("customer_search.jsp");
    } else if (session.getAttribute("type").equals("customer")) {

    } else if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
    else {
        response.sendRedirect("login_redirect.jsp");
    }

    int ids = Integer.parseInt(request.getParameter("roomID"));
    BookingService service = new BookingService();
    Room selectedRoom = null;

    try {
          selectedRoom = service.getRoomByID(ids);
    } catch (Exception e){
          e.printStackTrace();
          response.sendRedirect("customer_b_error.jsp");
    }

    if (request.getMethod().equals("POST")) {
        UserService service2 = new UserService();
        String username = (String) session.getAttribute("name");
        Date startd = (Date) session.getAttribute("indate");
        Date endd = (Date) session.getAttribute("outdate");
        try {
            int custid = service2.findCustomerID(username);
            boolean worked = service.newBooking(custid, ids, startd, endd);
            if (worked){
               response.sendRedirect("customer_b_success.jsp");
            } else {
               response.sendRedirect("customer_b_error.jsp");
            }

        } catch (Exception e){
             e.printStackTrace();
             response.sendRedirect("customer_b_error.jsp");
        }
    }
%>

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

<div class="button-container1">
    <form method="post">
        <input type="hidden" name="roomID" value="<%= selectedRoom.getRoomID() %>">
        <button type="submit" class="button1">Book Room</button>
    </form>

     <form action="customer_filter_search.jsp">
         <button type="submit" class="button1">Back to Search</button>
     </form>
</div>

</body>
</html>