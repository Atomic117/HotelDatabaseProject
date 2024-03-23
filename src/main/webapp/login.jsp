<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
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
            alert("Error: Invalid username or password");
        }
    </script>

</head>
<body>
<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="view.jsp">Rent</a></li>
        <li><a href="about.jsp">About Us</a></li>
    </ul>
</nav>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //READ FROM DATABASE
        String validUsername = "user";
        String validPassword = "password";

        boolean isAuthenticated = validUsername.equals(username) && validPassword.equals(password);
        boolean isEmployee = true;

        if (isAuthenticated) {
            if (isEmployee) {
                response.sendRedirect("employee.jsp");
            } else {
                response.sendRedirect("customer.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=invalidCredentials");
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