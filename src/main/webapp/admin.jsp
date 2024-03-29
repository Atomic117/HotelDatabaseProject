<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
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

<h1> You are logged in as: Admin</h1>

<div class='button-container1'>
    <button onclick="window.location.href='admin_view_customer.jsp'" class="button1"> Edit Customer</button>
    <button onclick="window.location.href='admin_view_employee.jsp'" class="button1"> Edit Employee</button>
    <button onclick="window.location.href='admin_view_hotel.jsp'" class="button1"> Edit Hotel </button>
    <button onclick="window.location.href='admin_view_room.jsp'" class="button1"> Edit Rooms</button>
</div>
<div class='button-container1'>
    <button onclick="window.location.href='logout.jsp'" class="button1">Log out </button>
</div>


<%
    if (session.getAttribute("type").equals("customer")) {
        response.sendRedirect("customer.jsp");
    } else if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){

    }
    else {
        response.sendRedirect("index.jsp");
    }
%>

</body>
</html>