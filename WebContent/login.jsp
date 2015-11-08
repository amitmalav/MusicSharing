<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<%if(session.getAttribute("currentuser") != null) {
	System.out.println("werty");
	response.sendRedirect("home.jsp");
}
%>
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>
<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<div class="navbar-brand col-md-6" href = "index.jsp">Welcome to Music Sharing Application</div>
<a class = "navbar-brand col-md-1" href = "login.jsp">Login</a>
<a class = "navbar-brand col-md-1" href = "register.jsp">Register</a>
</div>
</div>
</nav>

<form action="Login" method="post" role="form" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="username" class="col-md-2 control-label">UserName:</label>
				<div class="col-md-3">
					<input type="text" class="form-control" name="username">
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="passwprd" class="col-md-2 control-label">Password:</label>
				<div class="col-md-3">
					<input type="password" class="form-control" name="password">
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group col-md-10 form-group row">
		<div class="col-md-2"></div>
		<button type="submit" class="btn btn-primary">Login</button>
	</div>  
</form>
</body>
</html>