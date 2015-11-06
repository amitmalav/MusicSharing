<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="AddPlaylist" method="post">  

PlaylistName:<input type="text" name="plname"/><br/><br/>
Privacy Option:<br>
<input type="radio" name="secure" value="1">Public<br>
<input type="radio" name="secure" value="0">Private<br>


<%
String user = (String)session.getAttribute("currentuser");
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