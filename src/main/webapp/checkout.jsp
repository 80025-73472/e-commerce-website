<% 
User user = (User) session.getAttribute("current-user");
if(user == null){
    session.setAttribute("message","You are not logged in ");
    response.sendRedirect("login.jsp");
    return;
}
else{
    %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout</title>
    <%@include file="components/common_css_js.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            padding-top: 50px;
        }
        .card {
            border: 1px solid #dee2e6;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .card-body {
            padding: 30px;
        }
        h4.text-muted {
            margin-bottom: 30px;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar a {
            color: #fff !important;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!--card-->
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-muted text-center">Selected items:</h4>
                        <div class="cart-body">
                            <!-- Cart items will be dynamically loaded here -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <!--form details-->
                <!--card-->
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center text-muted">Order details</h4>
                        <form action="#">
                            <div class="form-group mt-2">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                <small id="emailHelp" class="form-text>We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="name" >Name</label>
                                <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                               
                            </div>
                            <div class="form-group">
                                <label for="phone" >Enter Phone</label>
                                <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp" required>
                             </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1" >Delivery Address</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter your address" rows="4" required></textarea>
                            </div>
                            
                            <div class="container text-right">
                                <button class="btn btn-outline-success">Order Place</button>
                                <button class="btn btn-secondary">Shop More</button>
                            </div>
                            
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="components/common_modals.jsp" %>
</body>
</html>
<%
}

%>