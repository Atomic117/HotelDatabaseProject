<%@ page import="com.demo.Search" %>
<%@ page import="com.demo.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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

<h2> Available rooms based on criteria </h2>



<%
    if (session.getAttribute("filter").equals("yes")){
    } else {
        response.sendRedirect("customer.filter.jsp");
    }

    Search findroom = new Search();
    ArrayList<Room> rooms = null;
    try {
        rooms = findroom.search();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


</body>
</html>