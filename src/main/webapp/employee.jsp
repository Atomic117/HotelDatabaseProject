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

<h1> You are logged in as: Employee</h1>

<%
    if (session.getAttribute("type").equals("customer")) {
        response.sendRedirect("customer.jsp");
    } else if (session.getAttribute("type").equals("employee")){

    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
    else {
        response.sendRedirect("index.jsp");
    }


%>

<div class='button-container1'>
    <button onclick="window.location.href='employee_view_booking.jsp'" class="button1"> Convert Booking</button>
    <button onclick="window.location.href='employee_filter.jsp'" class="button1"> Rent Now</button>
    <button onclick="window.location.href='employee_view_renting.jsp'" class="button1"> Check Out </button>
    <button onclick="window.location.href='logout.jsp'" class="button1">Log Out </button>
</div>

</body>
</html>