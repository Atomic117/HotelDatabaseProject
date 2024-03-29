<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.demo.AdminService" %>
<%@ page import="javax.servlet.http.*" %>

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
<%
    try {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int hotelid = Integer.parseInt(request.getParameter("hotelid"));
            int roomnumber = Integer.parseInt(request.getParameter("roomnumber"));
            int chainid = Integer.parseInt(request.getParameter("chainid"));
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            int star = Integer.parseInt(request.getParameter("stars"));
            String manager = request.getParameter("manager");
            String phone = request.getParameter("phone");
            if (hotelid <= 40){
                throw new IllegalArgumentException("");
            }

            if (star <= 0 || star > 5) {
                throw new IllegalArgumentException("");
            }

            AdminService service = new AdminService();
            boolean worked = service.createHotel(hotelid, roomnumber, chainid, address, email, star, manager, phone);
            if (worked) {
                response.sendRedirect("admin_success.jsp");
            } else {
                response.sendRedirect("admin_error.jsp");
            }
        }
    } catch (NumberFormatException e) {
        response.sendRedirect("admin_error3.jsp");
    } catch (IllegalArgumentException e){
        response.sendRedirect("admin_error3.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("admin_error.jsp");
    }
%>

<form method="post" class="login-form">
    <div class="form-group">
        <label for="hotelid">Hotel ID:</label>
        <input type="text" id="hotelid" name="hotelid" required>
    </div>
    <div class="form-group">
        <label for="roomnumber">Number of rooms:</label>
        <input type="text" id="roomnumber" name="roomnumber" required>
    </div>
    <div class="form-group">
        <label for="chainid">Chain ID:</label>
        <input type="text" id="chainid" name="chainid" required>
    </div>
    <div class="form-group">
        <label for="manager">Manager Name:</label>
        <input type="text" id="manager" name="manager" required>
    </div>
     <div class="form-group">
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
     </div>
     <div class="form-group">
        <label for="stars">Star:</label>
        <input type="text" id="stars" name="stars" required>
     </div>
      <div class="form-group">
         <label for="email">Email:</label>
         <input type="text" id="email" name="email" required>
      </div>
      <div class="form-group">
          <label for="phone">Phone:</label>
          <input type="text" id="phone" name="phone" required>
      </div>
    <button type="submit">Create Hotel</button>
</form>

<form action="admin_view_hotel.jsp" method="get" class="signup-button">
    <button type="submit">Go Back</button>
</form>


</body>
</html>