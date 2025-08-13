
<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User" %>

<%

    User user = (User) session.getAttribute("current-user");
    
    if (user == null) {
        session.setAttribute("message", "You are not logged in! Please login");
        response.sendRedirect("login.jsp");
        return;
    }
    else {
        if (user.getUserType().equals("normal")) {
            
            session.setAttribute("message", "You are not admin.\n you can not access this page:");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>

<% 

              CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
              List<Category> list = cdao.getCategories();
//             Getting count
                Map<String,Long> m=Helper.getCount(FactoryProvider.getFactory());

             
             %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>

        <%@include file="components/common_css_js.jsp" %>
        
        <style>
            
            body{
                background: #e2e2e2;
            }
        </style>

    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        

        <div class ="container admin">
            
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            
            
            <div class="row mt-30">


                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card"  data-toggle="tooltip" data-placement="left" title="Number of user ">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px; "class="img-fluid rounded-circle" src="img/seo-and-web.png" alt="user_icon "> 
                            </div>
                            <h4><%= m.get("userCount") %></h4>
                            <h3 class="text-uppercase text-muted">Users</h3>

                        </div>

                    </div>

                </div>

                <!--Second col-->
                <div class="col-md-4"  data-toggle="tooltip" data-placement="left" title="Number of categories are avilable">

                    <div class="card text-center">

                        <div class="card-body ">

                            <div class="container">
                                <img style ="max-width:100px; "class="img-fluid " src="img/list.png" alt="user_icon "> 
                            </div>

                            <h4> <%=list.size() %></h4>
                            <h3 class="text-uppercase text-muted">Categories</h3>

                        </div>

                    </div> 

                </div>

                <!--Third col-->
                <div class="col-md-4"  data-toggle="tooltip" data-placement="left" title="Total number of product avilable">

                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style ="max-width:100px; "class="img-fluid " src="img/product.png" alt="user_icon "> 
                            </div>

                            <h4><%= m.get("productCount") %></h4>
                            <h3 class="text-uppercase text-muted">Products</h3>

                        </div>
                    </div>
                </div>
            </div>


            <!--Second row-->

            <div class="row mt-3">

                <!--Second row first column-->
                <div class="col-md-6" data-toggle="tooltip" data-placement="top" title="Click here to add new product category">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:74px; "class="img-fluid rounded-circle" src="img/key.png" alt="user_icon "> 
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h3 class="text-uppercase text-muted">Add Category</h3>

                        </div>

                    </div>
                </div>

                <!--Second row second column-->

                <div class="col-md-6" data-toggle="tooltip" data-placement="top" title="Click here to add new product">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:100px; "class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon "> 
                            </div>
                            <p class="mt-2"> Click here to add new Product</p>
                            <h3 class="text-uppercase text-muted"> Add Product</h3>

                        </div>

                    </div>
                </div>
            </div> 
            
            
             
            <!--view product row-->
            <div class="row mt-3" data-toggle="tooltip" data-placement="top" title="Click to see all the products ">
                 <div class="col-md-12">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style ="max-width:74px; "class="img-fluid " src="img/view.png" alt="user_icon "> 
                            </div>
                           
                            <p class="mt-2">Click here to see all the products</p>
                            <h3 class="text-uppercase text-muted">View Products</h3>

                        </div>

                    </div>
                </div>
                
                
                
                
            
                
            </div>
            
            
        </div>


        <!--Add category modal-->

        

        <!-- Modal -->
        
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header  text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Enter category details:</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action ="ProductOperationServlet" method="post">
                            
                            
                            
                            <input type="hidden" name="operation" value="addcategory">
                            
                            
                            
                            <div class="form-group">
                                
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />
                            </div>
                            <div class="form-group">
                                
                                <textarea style="height:300px;" class="form-control" placeholder="Enter category description " name="catDescription" required></textarea>                                </textarea>
                            </div>
                            
                            <div class="container text-right">
                                <button class="btn btn-outline-success">Add category</button>
                                  <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                            </div>
                            
                        </form>
                        
                    </div>
                    <div class="modal-footer">
                      
                     
                    </div>
                </div>
            </div>
        </div>

        <!--End add category model-->

        <!--Add product model-->
        
        
        
       <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header text-white">
        <h5 class="modal-title" id="exampleModalLabel">Product details:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          
          <!--form-->
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="operation" value="addproduct"/>
              
              
              
              <!--product title-->
              <div class="form-group">
                  <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required /> 
              </div>
             
              <!--product price-->
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter price of product:" name="pPrice" required /> 
              </div>
              
              <!--Product Discount-->
              
                <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required /> 
              </div>
              
              
              <!--Product Quantity-->
              
              <div class="form-group">
                  <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required /> 
              </div>
              
              
              <!--Product category-->
             
              
              
              <div class="form-group">
                  <select name="catId" class ="form-control" id="">
                      
                      <% 
                      for(Category c:list){
                      
                      %>
                      
                      <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle() %></option>
                      <% }%>
                      
                      
                  </select>
              </div>
              
              <!--Product file-->
              <div class="form-group">
                  <label for="pPic"> Select Picture of Product:</label>
                  <br>
                   <input type="file" id="pPic" name="pPic" required/>
              </div>
              
              
               <!--product description-->
              <div class="form-group">
                  <textarea style="height:150px;"  class="form-control" placeholder="Enter productdescription" name="pDesc"></textarea>
              </div>
               
               <!--Submit button-->
               
               <div class="container text-center">
                   <button class="btn btn-outline-success ">Add Product</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
               </div>
               
               
            </form>
            <!--form end-->
                
        </div>
                 
      </div>
    </div>
  </div>
        
        <!--End Add product model-->
<%@include file="components/common_modals.jsp" %>
<script>
    $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>

    </body>
</html>
