<%@ page import="com.demo.SearchService" %>
<%@ page import="com.demo.Room" %>
<%@ page import="com.demo.UserService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

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
    if (session.getAttribute("type").equals("customer")){
        response.sendRedirect("customer.jsp");
    } else if(session.getAttribute("type").equals("employee")){

    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }

    if (session.getAttribute("filter1").equals("no")){
        response.sendRedirect("employee_filter.jsp");
    }

    Date outDate = (Date) session.getAttribute("outdate1");
    String room = (String) session.getAttribute("room1");
    double price = (double) session.getAttribute("price1");
    String username = (String) session.getAttribute("name");

    if ("any".equals(room)) {
     room = null;
    }

    SearchService service1 = new SearchService();
    UserService service2 = new UserService();
    int employeeid = -1;
    ArrayList<Room> rooms = null;

    try {
        employeeid = service2.findEmployeeID(username);
        rooms = service1.employeeSearch(employeeid, outDate, room, price);
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("employee_error_display.jsp");
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
        <a href="employee_renting.jsp?roomIDs=<%= availableRoom.getRoomID() %>" class="book-button">Rent Room</a>
    </div>
    <%
            }
        } else {
            out.println("<p>No available rooms found.</p>");
        }
    %>
</div>

    <div class="button-container1">
        <form action="employee_filter.jsp">
            <button type="submit" class="button1">Enter a new Search</button>
        </form>
    </div>


</body>
</html>