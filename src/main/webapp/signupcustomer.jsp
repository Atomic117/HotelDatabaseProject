<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<&@ page import="javax.servlet.http.HttpServletRequest" &>
<&@ page import="javax.servlet.http.HttpSession" &>
<&@ page import="UserSession" &>
<&@ page import="SignIn" &>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="MainStyle.css">
        <script>
            var urlParams = new URLSearchParams(window.location.search);
            var error = urlParams.get('error');
            if (error === 'invalidCredentials') {
                alert("Error: Username taken already");
            }
        </script>
</head>
<body>
<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="searchforrooms.jsp">Rent</a></li>
        <li><a href="about.jsp">About Us</a></li>
    </ul>
</nav>


<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String id = request.getParameter("typeID");



        //READ FROM DATABASE
        String validUsername = "user";

        boolean isOkay = !validUsername.equals(username);

        if (isOkay) {
            SignIn signIn = new SignIn();
            signIn.signUpCustomer(username, password, Integer.parseInt(id), address)
            response.sendRedirect("customer.jsp");
        } else {
            response.sendRedirect("signupcustomer.jsp?error=invalidCredentials");
        }
    }
%>

<form action="signupcustomer.jsp" method="post" class="login-form">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
     <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
     </div>
     <div class="form-group">
        <label for="typeID">ID Number:</label>
        <input type="text" id="typeID" name="typeID" required>
     </div>
    <button type="submit">Sign Up</button>
</form>

<form action="login.jsp" method="get" class="signup-button">
    <button type="submit">Already have an account?</button>
</form>


</body>
</html>