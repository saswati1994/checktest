<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class = "container">
<div>
Order has been placed for: ${cartitems.getUserId()}
</div>
<button type="submit" class="btn btn-primary btn-lg">View Order</button>
</div>
</body>
</html>