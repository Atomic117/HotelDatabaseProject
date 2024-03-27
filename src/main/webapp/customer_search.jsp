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

<h1> Searching for Rooms </h1>

<div class='button-container1'>
    <button onclick="window.location.href='customer_filter.jsp'" class="button1"> Search via Filter</button>
    <button onclick="window.location.href='customer_view_1.jsp'" class="button1"> View All Avaliable Rooms </button>
    <button onclick="window.location.href='customer_view_2.jsp'" class="button1">View Total Capacity </button>
    <button onclick="window.location.href='customer.jsp'" class="button1">Go Back</button>
</div>

<%
    if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
%>

</body>
</html>