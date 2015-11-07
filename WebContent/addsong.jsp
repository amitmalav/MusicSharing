<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Songs</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	
}
%>

<nav class = "navbar navbar-default">
<div class = "container-fluid">
<div class = "navbar-header col-md-12">
<a class = "navbar-brand col-md-3" href = "home.jsp">Home</a>
<a class = "navbar-brand col-md-3" href = "feedback.jsp">Give Feedback</a>
<a class = "navbar-brand col-md-3" href = "logout.jsp">Logout</a>
</div>
</div>
</nav>
<form action="AddSong" method="post" role="form" class="form-horizontal">
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="albumname" class="col-md-2 control-label">AlbumName:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="albumname">
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="artistname" class="col-md-2 control-label">ArtistName:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="artistname">
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="trackname" class="col-md-2 control-label">Trackname:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="trackname">
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="playtime" class="col-md-2 control-label">Playtime:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="playtime">
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="rating" class="col-md-2 control-label">Trackrating:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="trackrating">
					</div>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-10">
				<div class="form-group row">
					<label for="link" class="col-md-2 control-label">Link to the track:</label>
					<div class="col-md-3">
						<input type="text" class="form-control" name="link">
					</div>
				</div>
			</div>
		</div>
		
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
		
		<div class="form-group col-md-10 form-group row">
			<div class="col-md-2"></div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
</form>

<%-- 
<%
String user = (String)session.getAttribute("currentuser");
out.print(user);
%> --%>
</body>
</html>