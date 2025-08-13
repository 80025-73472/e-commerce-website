
<%@page import="com.learn.mycart.entities.User" %>
    <%
    
    User user=(User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message","You are not logged in! Please login");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        if(user.getUserType().equals("admin")){
            session.setAttribute("message","You are not admin.\n you can not access this page:");
        response.sendRedirect("admin.jsp");
        }
        if(user.getUserType().equals("normal")){
            response.sendRedirect("index.jsp");
        }
    }

    %>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@include file="components/navbar.jsp" %>
        <title><%=user.getUserName()%></title>
         <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <h4> This is Our Normal user Panel</h4>
        
    </body>
</html>
