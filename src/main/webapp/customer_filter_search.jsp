<%@ page import="com.demo.Search" %>
<%@ page import="com.demo.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

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
<%
    if (session.getAttribute("filter").equals("yes")){
    } else {
        response.sendRedirect("customer.filter.jsp");
    }

    Date inDate = (Date) session.getAttribute("indate");
    Date outDate = (Date) session.getAttribute("outdate");
    String room = (String) session.getAttribute("room");
    int chainId = (int) session.getAttribute("chainid");
    int star = (int) session.getAttribute("star");
    int total = (int) session.getAttribute("total");
    double price = (double) session.getAttribute("price");

    Search findroom = new Search();
    ArrayList<Room> rooms = null;

    try {
        rooms = findroom.search(chainId, inDate, outDate, star, room, price, total);
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("customer_search.jsp");
    }
%>

<h2>Room Information</h2>
<div>
    <%
        if (rooms != null && !rooms.isEmpty()) {
            for (Room availableRoom : rooms) {
    %>
    <div class="room-container">
        <ul class="room-info">
            <li><span>Room ID: </span> <%= availableRoom.getRoomID() %></li>
            <li><span>Hotel ID: </span> <%= availableRoom.getHotelID() %></li>
            <li><span>Price: </span> <%= availableRoom.getPrice() %></li>
            <li><span>Capacity: </span> <%= availableRoom.getCapacity() %></li>
            <li><span>View: </span> <%= availableRoom.getSea_mountainView() %></li>
        </ul>
        <a href="customer_booking.jsp?roomID=<%= availableRoom.getRoomID() %>" class="book-button">Book Now</a>
    </div>
    <%
            }
        } else {
            out.println("<p>No available rooms found.</p>");
        }
    %>
</div>


</body>
</html>