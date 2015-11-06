<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	
}
%>
<form action="AddPlaylist" method="post">  

PlaylistName:<input type="text" name="plname"/><br/><br/>
Privacy Option:<br>
<input type="radio" name="secure" value="1">Public<br>
<input type="radio" name="secure" value="0">Private<br>


<%
	out.print(user + "<br><br>");	
	List<Track> rs = HomepageAct.getallSongs();
	
	for(Track song : rs){
		out.print("<input type=\"checkbox\" name=\"track\""+ "value=\""+ song.getTrackid() +  "\">" +  song.getTrack()+"		" + song.getAlbum() + "<br><br>");
	}
%>

<input type="submit" value = "Create Playlist"></input>  
</form>



</body>
</html>