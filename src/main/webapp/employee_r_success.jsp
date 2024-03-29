<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    session.setAttribute("filter1", "no");
    session.setAttribute("outdate1", "");
    session.setAttribute("room1", "");
    session.setAttribute("price1", "");
    session.setAttribute("name", "");
%>
<h1> Success: Renting has been made</h1>

    <div class="button-container1">
        <form action="employee.jsp">
            <button type="submit" class="button1">Back to Main</button>
        </form>
    </div>

</body>
</html>