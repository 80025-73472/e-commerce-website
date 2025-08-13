<% 

 String message= (String)session.getAttribute("message");
if(message!=null){
    // print
   // out.println(message);
%>
   
    
   
   
   <div class="alert alert-success alert-dismissible fade show" role="alert">
         <strong><%=message %></strong> You should check in on some of those fields below.
         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
         <span aria-hidden="true">&times;</span>
         </button>
    </div>
   
    <%
        
    session.removeAttribute("message");
    
}
    %>