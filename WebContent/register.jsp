<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register yourself</title>
<link rel="stylesheet" href="css/bootstrap.css">
<%if(session.getAttribute("currentuser") != null) {
	System.out.println("werty");
	response.sendRedirect("home.jsp");
}
%>
</head>
<body>

<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<div class="navbar-brand col-md-6">Welcome to Music Sharing Application</div>
<a class = "navbar-brand col-md-1" href = "login.jsp">Login</a>
<a class = "navbar-brand col-md-1" href = "register.jsp">Register</a>
</div>
</div>
</nav>

<div class="container-fluid">
	<form action="Register" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="username" class="col-md-2 control-label">Username:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="username" id="username" required>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="password" class="col-md-2 control-label">Password:</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="password" id="password" required>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="repass" class="col-md-2 control-label">Retype Password:</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="repass" id="repass" required>
					</div>
					<div class="col-md-3" id="check"></div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="name" class="col-md-2 control-label">Name:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="name" id="name" required>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="email" class="col-md-2 control-label">Email:</label>
					<div class="col-md-3">
						<input type="email" class="form-control" name="email" id="email" required>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group col-md-10 form-group row">
			<div class="col-md-2"></div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		$("#repass").change(function(){
			if($("#password").val()==""){
				$("#check").text('Please enter password');
			}
			
			else if( $("#repass").val()!=$("#password").val() ){
				$("#check").text('Passwords do not match');
			}
			if($("#repass").val() == $("#password").val()){
				if($("#repass").val()!=""){
					$("#check").text('Passwords matched');	
				}
			}
		});
		$("#password").change(function(){
			if($("#repass").val()!=""){
				$("#check").text('Passwords do not match');
			}
			if($("#repass").val() == $("#password").val()){
				if($("#repass").val()!=""){
					$("#check").text('Passwords matched');	
				}
			}
		});
	</script>
</div>
</body>
</html>