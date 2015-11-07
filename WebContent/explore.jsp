<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.Explore" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Apply one or more filters</h2>
<h3>Artist</h3>
<form action="exploreRes.jsp" method="post" >
<select name = "artist">
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
<h3>User</h3>
<select name = "user">
<option>All</option>
<%
for(String us: user){
%>
<option><% out.print(us+"<br/>"); %></option>
<%
}
%>
</select>
<h3>Album</h3>
<select name = "album">
<option>All</option>
<%
for(String a: album){
%>
<option><% out.print(a+"<br/>"); %></option>
<%
}
%>
</select>
<button type="submit">Submit</button>
</form>
</body>
</html>