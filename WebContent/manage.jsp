<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Manage" method="post" >
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
}
List<Track> unapps = HomepageAct.getUnapprovedSongs();
if(unapps == null){
	response.sendRedirect("home.jsp");
}
for(Track t : unapps){
	out.print(t.getTrack()+"   "+t.getAlbum()+"   "+t.getArtist()+"   "+t.getUser());
out.print("<input type=\"checkbox\" name=\"checked\""+ "value=\""+t.getTrackid()+"\">" + "<br/><br/>");
	} 
%>
<button type="submit">Submit</button>
</form>

</body>
</html>