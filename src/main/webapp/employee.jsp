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

<div class='button-container1'>
    <button onclick="window.location.href='searchforrooms.jsp'" class="button1"> View booking</button>
    <button onclick="window.location.href='view.jsp'" class="button1"> Rent now </button>
    <button onclick="window.location.href='logout.jsp'" class="button1">Log out </button>
</div>

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

</body>
</html>