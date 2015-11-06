<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Playlist" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br><br>
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	
}
	out.print(user + "<br><br>");	
	List<Playlist> rs = HomepageAct.getMyplaylists(user);
	
	for(Playlist pl : rs){
		out.print(pl.getPlaylistname());
		out.print("<br><br>");
	}
%>


<!-- //Add the onclick show data functionality bebo!! i don't know how to do that. -->

<a href = newplaylist.jsp>Create new playlist</a>

</body>
</html>
