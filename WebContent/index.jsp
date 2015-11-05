<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= java.sql.*
    %>
    <%@ page import="database.FirstPage" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		out.print(t.getTrack()+" from "+t.getAlbum());
	}
%>
</body>
</html>