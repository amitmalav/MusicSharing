<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.Explore" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<a class = "navbar-brand col-md-3" href = "home.jsp">Home</a>
<a class = "navbar-brand col-md-3" href = "feedback.jsp">Give Feedback</a>
<a class = "navbar-brand col-md-3" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>
<h1 class="text-center">Apply one or more filters</h1>
<form action="exploreRes.jsp" method="post" >
<div class="form-group">
	<div class="col-md-10">
		<div class="form-group row">
			<label for="name" class="col-md-2 control-label">Artist:</label>
			<div class="col-md-3">
				<select class="form-control" name="name">
<option>All</option>
<%
List<String> artist = new ArrayList<String>();
List<String> user = new ArrayList<String>();
List<String> album = new ArrayList<String>();
 
artist = Explore.getartist();
 user = Explore.getuser();
album = Explore.getalbum(); 
for(String ar: artist){
%>
<option><% out.print(ar+"<br/>"); %></option>
<%
}
%>
</select>
</div>
</div>
</div>
</div>
<div class="form-group">
	<div class="col-md-10">
		<div class="form-group row">
			<label for="user" class="col-md-2 control-label">Artist:</label>
			<div class="col-md-3">
				<select class="form-control" name="user">
<option>All</option>
<%
for(String us: user){
%>
<option><% out.print(us+"<br/>"); %></option>
<%
}
%>
</select>
</div>
</div>
</div>
</div>
<div class="form-group">
	<div class="col-md-10">
		<div class="form-group row">
			<label for="album" class="col-md-2 control-label">Artist:</label>
			<div class="col-md-3">
				<select class="form-control" name="album">
<option>All</option>
<%
for(String a: album){
%>
<option><% out.print(a+"<br/>"); %></option>
<%
}
%>
</select>
</div>
</div>
</div>
</div>
<div class="form-group col-md-10 form-group row">
		<div class="col-md-2"></div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div> 
</form>
</body>
</html>