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

<h1> You are logged in as: Customer</h1>

<div class='button-container1'>
    <button onclick="window.location.href='customer_search.jsp'" class="button1"> Search for rooms</button>
    <button onclick="window.location.href='customer_view_booking.jsp'" class="button1"> View bookings </button>
    <button onclick="window.location.href='logout.jsp'" class="button1">Log out </button>
</div>

<%
    if (session.getAttribute("type").equals("customer")) {

    } else if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
    else {
        response.sendRedirect("index.jsp");
    }
%>

</body>
</html>