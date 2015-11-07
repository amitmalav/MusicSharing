<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.Explore" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String users = (String)session.getAttribute("currentuser");
if(users==null){
	response.sendRedirect("index.jsp");
	
}
String artist = request.getParameter("artist");
String user = request.getParameter("user");
String album = request.getParameter("album");
List<Track> songs = Explore.getTrack(artist, user, album);
if(songs.size()==0) out.print("No songs found!");
else{
	for(Track t:songs){
		out.print(t.getTrack());
	}
}
%>

</body>
</html>