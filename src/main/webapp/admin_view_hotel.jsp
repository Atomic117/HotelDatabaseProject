<%@ page import="com.demo.AdminService" %>
<%@ page import="com.demo.Hotel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
     if (session.getAttribute("type").equals("customer")) {
        response.sendRedirect("customer.jsp");
     } else if (session.getAttribute("type").equals("employee")){
        response.sendRedirect("employee.jsp");
     } else if (session.getAttribute("type").equals("admin")){

     } else {
         response.sendRedirect("index.jsp");
     }


 %>

 <%
     AdminService service = new AdminService();
     ArrayList<Hotel> listy = null;

     try {
         listy = service.hotelList();
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("admin_error2.jsp");
     }
 %>

 <h2>All Hotels</h2>
 <div>
     <%
         if (listy != null && !listy.isEmpty()) {
             for (Hotel thing : listy) {
     %>
     <div class="room-container">
         <ul class="room-info">
             <li><span>Hotel ID: </span> <%= thing.getHotelID() %></li>
             <li><span>Chain ID: </span> <%= thing.getChainID() %></li>
             <li><span>Manager Name: </span> <%= thing.getManagerName() %></li>
             <li><span>Number of Room: </span> <%= thing.getRoomNumber() %></li>
             <li><span>Address: </span> <%= thing.getAddress() %></li>
             <li><span>Star: </span> <%= thing.getStar() %></li>
             <li><span>Email: </span> <%= thing.getEmail() %></li>
             <li><span>Phone: </span> <%= thing.getPhone() %></li>
         </ul>
         <a href="admin_edit_hotel.jsp?objectid=<%= thing.getHotelID() %>" class="book-button">Edit</a>
         <a href="admin_delete_hotel.jsp?objectid=<%= thing.getHotelID() %>" class="book-button">Delete</a>
     </div>
     <%
             }
         } else {
             out.println("<p>No hotels found.</p>");
         }
     %>
 </div>

 <div class="button-container1">
     <form action="admin.jsp">
         <button type="submit" class="button1">Go back</button>
     </form>
     <form action="admin_insert_hotel.jsp">
          <button type="submit" class="button1">Create hotel</button>
     </form>
 </div>


  </body>
  </html>