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
            int roomid = Integer.parseInt(request.getParameter("roomid"));
            int hotelid = Integer.parseInt(request.getParameter("hotelid"));
            double price = Double.parseDouble(request.getParameter("price"));
            String capacity = request.getParameter("capacity");
            String viewed = request.getParameter("viewed");
            boolean extension = Boolean.parseBoolean(request.getParameter("extension"));
            boolean damage = Boolean.parseBoolean(request.getParameter("damage"));

            if (!(capacity.equals("Single") || capacity.equals("Double") || capacity.equals("King") || capacity.equals("Queen") ||
            capacity.equals("Suite"))) {
                throw new IllegalArgumentException("");
            }

            if (!(viewed.equals("none") || viewed.equals("Mountain") || viewed.equals("Sea"))) {
                throw new IllegalArgumentException("");
            }

            AdminService service = new AdminService();
            boolean worked = service.createRoom(roomid, hotelid, price, capacity, viewed, extension, damage);
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
        <label for="roomid">Room ID:</label>
        <input type="text" id="roomid" name="roomid" required>
    </div>
    <div class="form-group">
        <label for="hotelid">Hotel ID:</label>
        <input type="text" id="hotelid" name="hotelid" required>
    </div>
    <div class="form-group">
        <label for="price">Price:</label>
        <input type="text" id="price" name="price" required>
    </div>
     <div class="form-group">
        <label for="capacity">Capacity:</label>
        <input type="text" id="capacity" name="capacity" required>
     </div>
     <div class="form-group">
        <label for="viewed">Sea_mountain_view:</label>
        <input type="text" id="viewed" name="viewed" required>
     </div>
      <div class="form-group">
         <label for="extension">Extension:</label>
         <input type="text" id="extension" name="extension" required>
      </div>
      <div class="form-group">
          <label for="damage">Damage:</label>
          <input type="text" id="damage" name="damage" required>
      </div>
    <button type="submit">Create Room</button>
</form>

<form action="admin_view_room.jsp" method="get" class="signup-button">
    <button type="submit">Go Back</button>
</form>


</body>
</html>