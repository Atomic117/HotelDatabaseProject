<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="LoginStyle.css">
</head>
<body>
<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="view.jsp">Rent</a></li>
        <li><a href="about.jsp">About</a></li>
    </ul>
</nav>

<div class="container">
    <h2>Sign Up</h2>
    <form action="view.jsp" method="post">
        <label for="username"><b>Username</b></label>
        <input type="text" placeholder="Create Username" name="username" required>

        <label for="password"><b>Password</b></label>
        <input type="password" placeholder="Create Password" name="password" required>

        <button type="submit">Create Account</button>
    </form>
</div>

<form action = "login.jsp" method = "get">
    <button type = "submit" class ="small-button"> Already have an account? </button>
</form>

</body>
</html>