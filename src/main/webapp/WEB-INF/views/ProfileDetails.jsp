<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head >

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile Details</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Merienda+One" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
 
 
	body{
		background: #eeeeee;
	}
    .form-inline {
        display: inline-block;
    }
	.navbar-header.col {
		padding: 0 !important;
	}	
	.navbar {		
		background: #fff;
		padding-left: 16px;
		padding-right: 16px;
		border-bottom: 1px solid #d6d6d6;
		box-shadow: 0 0 4px rgba(0,0,0,.1);
	}
	.nav-link img {
		border-radius: 50%;
		width: 36px;
		height: 36px;
		margin: -8px 0;
		float: left;
		margin-right: 10px;
	}
	.navbar .navbar-brand {
		color: #555;
		padding-left: 0;
		padding-right: 50px;
		font-family: 'Merienda One', sans-serif;
	}
	.navbar .navbar-brand i {
		font-size: 20px;
		margin-right: 5px;
	}
	.search-box {
        position: relative;
        border-radius:20px;
    }	
    .search-box input {
		box-shadow: none;
        padding-right: 35px;
        border-radius: 20px !important;
    }
	.search-box .input-group-addon {
        min-width: 35px;
        border: none;
        background: transparent;
        position: absolute;
        right: 0;
        z-index: 9;
        padding: 7px;
		height: 100%;
    }
    .search-box i {
        color: #a0a5b1;
		font-size: 19px;
    }
	.navbar .nav-item i {
		font-size: 18px;
	}
	.navbar .dropdown-item i {
		font-size: 16px;
		min-width: 22px;
	}
	.navbar .nav-item.open > a {
		background: none !important;
	}
	.navbar .dropdown-menu {
		border-radius: 1px;
		border-color: #e5e5e5;
		box-shadow: 0 2px 8px rgba(0,0,0,.05);
	}
	.navbar .dropdown-menu li a {
		color: #777;
		padding: 8px 20px;
		line-height: normal;
	}
	.navbar .dropdown-menu li a:hover, .navbar .dropdown-menu li a:active {
		color: #333;
	}	
	.navbar .dropdown-item .material-icons {
		font-size: 21px;
		line-height: 16px;
		vertical-align: middle;
		margin-top: -2px;
	}
	.navbar .badge {
		background: #f44336;
		font-size: 11px;
		border-radius: 20px;
		position: absolute;
		min-width: 10px;
		padding: 4px 6px 0;
		min-height: 18px;
		top: 5px;
	}
	.navbar ul.nav li a.notifications, .navbar ul.nav li a.messages {
		position: relative;
		margin-right: 10px;
	}
	.navbar ul.nav li a.messages {
		margin-right: 20px;
	}
	.navbar a.notifications .badge {
		margin-left: -8px;
	}
	.navbar a.messages .badge {
		margin-left: -4px;
	}	
	.navbar .active a, .navbar .active a:hover, .navbar .active a:focus {
		background: transparent !important;
	}
	@media (min-width: 1200px){
		.form-inline .input-group {
			width: 300px;
			margin-left: 30px;
		}
	}
	@media (max-width: 1199px){
		.form-inline {
			display: block;
			margin-bottom: 10px;
		}
		.input-group {
			width: 100%;
		}
	}
</style>
</head>
<body>

<div th:replace="WelcomeHeader :: header">
</div>
<div class="container">	
	<div class="signup-form" >
		<form class="needs-validation" id="ProfileForm" th:object="${userDet}">
			<div class="form-row card_basic">
				
				<div class="col-md-8 mb-8">			
					<div class="card" style="width: 80%;padding-left: 25px;">
				  		<div class="card-body"> 
				  			<div class="form-group">
								<div class="row">
									<div class="col-md-4 mb-4">
										<label for="userFirstName">First name</label>
										<input type="text" class="form-control reg_det" th:value="${userDet.firstName}" id="firstName" placeholder="First name" required>
									</div>
									<div class="col-md-4 mb-4">
										<label for="userLastName">Last name</label>
										<input type="text" class="form-control reg_det" th:value="${userDet.lastName}" id="lastName" placeholder="Last name"  required>
									</div>
									<div class="col-md-4 mb-4">
										<label for="userName">User Name</label>
					        			<input type="text" class="form-control reg_det" th:value="${userDet.userName}" maxlength="40" id="userName" placeholder="UserName" required="required">
					        		</div>																	
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-4 mb-4">
										<label for="userMobileNo">Mobile No</label>
										<input type="text" pattern="\d*" maxlength="10" class="form-control reg_det" th:value="${userDet.phone}" id="phone" placeholder="Mobile No" required="required">
									</div>
									<div class="col-md-4 mb-4">
										<label for="userMail">Email Id</label>
					        			<input type="email" class="form-control reg_det" th:value="${userDet.email}" maxlength="40" id="email" placeholder="Email" required="required">
					        		</div>					
					         		<div class="col-md-4 mb-4">	
						        		<label for="Place">Place</label>		        		
									   <select class="form-control" id="place" th:field="*{place}">										   
                               				<option th:each="place : ${T(com.eatfit.user.entity.Place).values()}"
                                       		th:value="${place}" th:text="${place}"></option>
                           				</select>										
						        	</div>									
									
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-6 mb-6">										
										<div class="form-group">
										  <label for="Address">Address</label>
										  <textarea class="form-control rounded-0" th:field="${userDet.address}" id="address" rows="3"></textarea>
										</div>					        			
					        		</div>
								</div>
							</div>			
							<div class="form-group">
								<div class="row">
									<div class="col-md-2 mb-2">
										<button class="btn btn-primary btn-lg" style='float: left;' type="submit">Save</button>
									</div>
									<div class="col-md-2 mb-2">
										<button class="btn btn-danger btn-lg" style='float: left;' id='deleteButton' type="button">Delete</button>
									</div>
								</div>
							</div>
								
							
						</div>
				  	</div>
				</div>
			</div>	
		</form>    
	    <div class="alert alert-danger error_msg" style="display: none;">   
		    <input type="hidden" id="_csrf_token"
		           th:name="${_csrf.parameterName}" 
		           th:value="${_csrf.token}" />
		    <input type="hidden" id="_csrf_header"
	           th:name="${_csrf.headerName}" 
	           th:value="${_csrf.headerName}" />  		
		</div>
		
	</div>
</div>

</body>
<script  th:inline="javascript">
var Content='',Color_Code='';
var value=0;
var userDet = {};
var personalDto = {};

var header = $('#_csrf_header').val();
var token = $('#_csrf_token').val();
$(document).ready(function(){
	
	
	var userPersonalDetails= JSON.parse('[[${userDet}]]');
	//$('.user_dropdown').html(userName)
	console.log(userPersonalDetails);
	
	
})
$("#ProfileForm").submit(function(e) {

    e.preventDefault(); // avoid to execute the actual submit of the form. 
   	
   
   $.ajax({
		type : "POST",
		async:false,	
		contentType : "application/json",
		url :"/ProfileDetails/Save",		
		data : JSON.stringify(retrieveFieldVal()),			
		beforeSend: function(xhr) {
	      xhr.setRequestHeader(header, token);
	    },
		success : function(data) {
			if(data==true){				
				alert("Successfully Saved" )				
				window.location.href='Welcome';
				
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

$('#deleteButton').click(function(){
	 $.ajax({
			type : "DELETE",
			async:false,				
			url :"/ProfileDetails/Delete",		
						
			beforeSend: function(xhr) {
		      xhr.setRequestHeader(header, token);
		    },
			success : function(data) {
				if(data==true){				
					alert("Successfully deleted" )				
					window.location.href='login';
					
				}else{
					alert(data)
						
					
				}
				
			},
			error: function(xhr, status, error) {
				  var err = eval("(" + xhr.responseText + ")");
			}
		});
		

})
function retrieveFieldVal(){
	userDet={
			address:$('#address').val(),
			place:$('#place').val()
	}
	
	$('.reg_det').each(function(){	
		console.log($(this).attr('id'))
		userDet[$(this).attr('id')] =$(this).val();        
        
	});	
	
	return userDet;
	
}


</script>
</html>                            