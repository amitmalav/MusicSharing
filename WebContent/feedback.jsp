<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.LoginAct" %>
    <%@ page import="database.FirstPage" %>
    <%@ page import="database.Track" %>
    <%@ page import="database.HomepageAct" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<a class = "navbar-brand col-md-3" href = "home.jsp">Home</a>
<div class="col-md-8"></div>
<a class = "navbar-brand col-md-1" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>

<form action="Feedback" method="post" role="form" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="username" class="col-md-2 control-label">Username:</label>
				<div class="col-md-10">
					<input type="text" class="form-control" name="username" id="username" required>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-10">
			<div class="form-group row">
				<label for="feedback" class="col-md-2 control-label">Feedback:</label>
				<div class="col-md-10">
					<textarea class="form-control" rows="5" name="feedback" id="feedback" required></textarea>
				</div>
			</div>
		</div>
	</div>

</form>

</body>
</html>