<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.demo.UserService" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
        response.sendRedirect("employee.jsp");
    } else if (session.getAttribute("type").equals("admin")){
        response.sendRedirect("admin.jsp");
    }


    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isAdmin = "admin".equals(username) && "admin".equals(password);
        boolean isEmployee = false;
        boolean isCustomer = false;


        UserService signin = new UserService();
        try {
            isEmployee = signin.employeeLogIn(username, password);
            isCustomer = signin.customerLogIn(username, password);
        } catch (Exception e){
            e.printStackTrace();
            response.sendRedirect("login_error_2.jsp");
        }


        if (isAdmin){
            session.setAttribute("type", "admin");
            response.sendRedirect("admin.jsp");
        } else if (isEmployee){
            session.setAttribute("name", username);
            session.setAttribute("type", "employee");
            response.sendRedirect("employee.jsp");
        } else if (isCustomer){
            session.setAttribute("name", username);
            session.setAttribute("type", "customer");
            response.sendRedirect("customer.jsp");
        } else {
            response.sendRedirect("login_error.jsp");
        }

    }
%>

<form action="login.jsp" method="post" class="login-form">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <button type="submit">Login</button>
</form>

<form action="signup.jsp" method="get" class="signup-button">
    <button type="submit">Sign Up</button>
</form>

</body>
</html>