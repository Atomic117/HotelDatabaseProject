<%@ page import="com.demo.AdminService" %>
<%@ page import="com.demo.Customer" %>
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
     ArrayList<Customer> listy = null;

     try {
         listy = service.customerList();
     } catch (Exception e) {
         e.printStackTrace();
         response.sendRedirect("admin_error2.jsp");
     }
 %>

 <h2>All Customers</h2>
 <div>
     <%
         if (listy != null && !listy.isEmpty()) {
             for (Customer thing : listy) {
     %>
     <div class="room-container">
         <ul class="room-info">
             <li><span>Customer ID: </span> <%= thing.getCustomerID() %></li>
             <li><span>Name: </span> <%= thing.getFullName() %></li>
             <li><span>Address: </span> <%= thing.getAddress() %></li>
             <li><span>Registration Date: </span> <%= thing.getRegistrationDate() %></li>
             <li><span>Type ID: </span> <%= thing.getTypeID() %></li>
             <li><span>Password: </span> <%= thing.getPassword() %></li>
         </ul>
         <a href="admin_edit_customer.jsp?objectid=<%= thing.getCustomerID() %>" class="book-button">Edit</a>
         <a href="admin_delete_customer.jsp?objectid=<%= thing.getCustomerID() %>" class="book-button">Delete</a>
     </div>
     <%
             }
         } else {
             out.println("<p>No customers found.</p>");
         }
     %>
 </div>

 <div class="button-container1">
     <form action="admin.jsp">
         <button type="submit" class="button1">Go back</button>
     </form>
     <form action="admin_insert_customer.jsp">
          <button type="submit" class="button1">Create customer</button>
     </form>
 </div>


  </body>
  </html>