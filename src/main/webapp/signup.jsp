<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="MainStyle.css">
</head>
<body>

<%
    if (session.getAttribute("type").equals("customer")) {
        response.sendRedirect("customer.jsp");
    } else if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }
%>

<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="searchforrooms.jsp">Rent</a></li>
        <li><a href="about.jsp">About Us</a></li>
    </ul>
</nav>

    <div class="button-container1">

        <form action="signupcustomer.jsp">
            <button type="submit" class="button1">Sign up as Customer</button>
        </form>

        <form action="signupemployee.jsp">
            <button type="submit" class="button1">Sign up as Employee</button>
        </form>

         <form action="login.jsp">
            <button type="submit" class="button1">Go Back</button>
         </form>
    </div>

</body>
</html>