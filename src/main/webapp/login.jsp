<%-- 
    Document   : login
    Created on : 05-Aug-2024, 11:54:05 pm
    Author     : rishi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - Mycart</title>
        
          <%@include  file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        
        
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h4>Login</h4>
                            
                            
                        </div>
                        
                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                              <form action="LoginServlet">
                                  <div class="form-group" method="post">
                                       <label for="exampleInputEmail1">Email address</label>
                                       <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                       <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                  </div>
                                  
                                  <div class="form-group">
                                       <label for="exampleInputPassword1">Password</label>
                                       <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Pasward">
                                  </div>
                                  
                                  <a href="register.jsp">if not registered click here </a>
                                  <div class="container mt-1">
                                      <button type="submit" class="btn btn-primary border-0">Submit</button>
                                      <button type="reset" class="btn btn-primary border-0">Reset</button>
                                  </div>
                                       
                              </form>  
                            
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
