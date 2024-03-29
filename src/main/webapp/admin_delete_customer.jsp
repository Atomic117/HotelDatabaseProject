<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" %>
<%@ page import="com.demo.AdminService" %>

<%
    int objectid = Integer.parseInt(request.getParameter("objectid"));
    AdminService service = new AdminService();
    boolean worked = false;

    try {
        worked = service.deleteCustomer(objectid);
    } catch (Exception e){
        response.sendRedirect("admin_error.jsp");
    }
    if (worked){
        response.sendRedirect("admin_success.jsp");
    } else {
        response.sendRedirect("admin_error.jsp");
    }

%>