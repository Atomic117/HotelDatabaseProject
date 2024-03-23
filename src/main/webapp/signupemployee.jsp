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
                if (error === 'takenName') {
                    alert("Error: Username taken already");
                } else if (error === 'invalidID'){
                    alert("Error: Incorrect chainID");
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
        String chainid = request.getParameter("chainid");
        String address = request.getParameter("address"); // Corrected method name
        String role = request.getParameter("role"); // Corrected method name
        String ssn = request.getParameter("ssn"); // Corrected method name

        // READ FROM DATABASE
        String takenUserName = "user";
        String validChainID = "123";

        if (username.equals(takenUserName)) {
            response.sendRedirect("signupemployee.jsp?error=takenName");
        } else if (!validChainID.equals(chainid)) {
            response.sendRedirect("signupemployee.jsp?error=invalidID");
        } else {
            response.sendRedirect("employee.jsp");
        }
    }
%>

<form action="signupemployee.jsp" method="post" class="login-form">
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div class="form-group">
        <label for="chainid">ChainID:</label>
        <input type="text" id="chainid" name="chainid" required>
    </div>
    <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
    </div>
    <div class="form-group">
        <label for="role">Role:</label>
        <input type="text" id="role" name="role" required>
    </div>
    <div class="form-group">
        <label for="ssn">SSN:</label>
        <input type="text" id="ssn" name="ssn" required>
    </div>
    <button type="submit">Sign Up</button>
</form>

<form action="login.jsp" method="get" class="signup-button">
    <button type="submit">Already have an account?</button>
</form>

</body>
</html>