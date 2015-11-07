<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register yourself</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<div class="container-fluid">
	<form action="Register" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="username" class="col-md-2 control-label">Username:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="username">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="password" class="col-md-2 control-label">Password:</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="password">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="repass" class="col-md-2 control-label">Retype Password:</label>
					<div class="col-md-3">
						<input type="password" class="form-control" name="repass">
					</div>
					<div class="check col-md-3"></div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="name" class="col-md-2 control-label">Name:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="name">
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="email" class="col-md-2 control-label">Email:</label>
					<div class="col-md-3">
						<input type="email" class="form-control" name="email">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>