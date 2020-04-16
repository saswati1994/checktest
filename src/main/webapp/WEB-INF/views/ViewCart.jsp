<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>List of Cart Items</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>


  <body>
  <nav class="navbar navbar-dark bg-primary">
    <span class="navbar-brand mb-0 h1">Checkout</span>
    </nav>

    <div class = "container">
    <div class="row">
    <div class= "col">
    <h2 id="cartId"> Cart ID: ${cartitems.getCartId()} </h2>
    </div>
    <div class= "col">
    <h2> User ID: ${cartitems.getUserId()}</h2>
    </div>
    </div>
        <table class="table table-bordered table-hover">
        <thead class= "thead-dark">
          <tr>
              <th scope="col"><h3>Item</h3></th>
              <th scope="col"><h3>Item Description</h3></th>
              <th scope="col"><h3>Price</h3></th>
            </tr>
         </thead>

            <c:forEach var="item" items="${items}">
                <tr>
                  <td><h5>${item.getItemName()}</h5></td>
                  <td><h5>${item.getItemDesc()}</h5></td>
                  <td><h5>${item.getPrice()}</h5></td>
                </tr>
             </c:forEach>

        </table>
        <div class= "col">
         <h2>Total Price: ${totalPrice} </h2>
         </div>
        <button type="submit" class="btn btn-primary btn-lg" id='orderButton'>Place Order</button>
        </div>

      </body>
      <script  th:inline="javascript">
      
      var orderInfo={}
      
      $('#orderButton').submit(function(e){
    	  alert(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    	  e.preventDefault(); 
         $.ajax({
		type : "POST",
		async:false,	
		contentType : "application/json",
		url :"/order",		
		data : JSON.stringify(retrieveFieldVal()),		
		success : function(data) {
			if(data==true){				
				alert("Order Placed")				
				window.location.href='SuccessOrder';
				
			}else{
				alert(data)
				//$('.error_msg').show();
				//$('.error_msg').html(data);		
				
			}
			
		},
		error: function(xhr, status, error) {
			  var err = eval("(" + xhr.responseText + ")");
		}
	});
      });   
      
      
         function retrieveFieldVal(){
        	 alert( $('#cartId').html())
        		orderInfo={
        				placedDate:"2020-04-16",
        				cartId: $('#cartId').html()
        		}
        		
        		/* $('.reg_det').each(function(){	
        			console.log($(this).attr('id'))
        			orderInfo[$(this).attr('id')] =$(this).val();        
        	        
        		}); */	
        		
        		return orderInfo;
        		
        	}
   </script>
</html>