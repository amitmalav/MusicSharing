<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.FirstPage" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome to Music Sharing Application</h1>
<a href="register.jsp">Register Yourself!</a>
<a href="login.jsp">Login</a>
<h2>Top Hits Now</h2>
<%
	List<Track> top = FirstPage.getTopSongs();
	for(Track t: top){
		out.print(t.getTrack()+" from "+t.getAlbum() + "<br><br>");
	}
%>
</body>
</html>