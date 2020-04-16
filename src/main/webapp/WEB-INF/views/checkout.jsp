<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<div class="signup-form">
<div align="center">
		<h2>CheckOut</h2>
		<br> 
	</div>
	<div class="tableFixHead"   style="width:80%; height:250px;margin-top: 15px;margin-left: 15px;">
 		<table class="table table-bordered table-striped" >
		    <thead>
		      <tr>
		        <th>Item Name</th>
		        <th>Item Description</th>
		        <th>Price</th>
		      </tr>
		    </thead>
		    <tbody id="tablebody">
		    	<tr th:each="message : ${items}">
		        <td th:text="${message.itemName}"></td>
		        <td th:text="${message.itemDesc}"></td>
		        <td th:text="${message.price}"></td>
		        
		       <%--  <td><form  action="/items/update/${message.itemId}" method="put"><input type="submit" value="edit"></form></td> 
		        <td><form  action="/items/delete/${message.itemId}" ><input type="submit" value="delete"></form></td>  --%>
		   		 </tr>   
		    </tbody>
		  </table>
 	</div>
</div>
</body>
</html>