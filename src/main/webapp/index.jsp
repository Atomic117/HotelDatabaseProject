<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="MainStyle.css">
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

<h1> Hotel Booking Website</h1>
<div class="image-container">
    <img src="img/hotelimage_0.jpg" alt="Image 1" width ="500" height = "300">
    <img src="img/hotelimage_1.jpg" alt="Image 2" width ="500" height = "300">
    <img src="img/hotelimage_2.jpg" alt="Image 3" width ="500" height = "300">
</div>
<p> Here is where you book hotel rooms for your vacation. </p>
<p> Please log in or create a new user account</p>
<h2>Select your start date:</h2>
<select name="startdate" id="startdate">
    <option value="red">Now</option>
    <option value="red">Today</option>
    <option value="green">Tomorrow</option>
    <option value="blue">Future</option>
    <option value="yellow">Yesterday</option>
</select>
</body>
</html>