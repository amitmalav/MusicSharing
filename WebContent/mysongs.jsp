<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.HomepageAct" %>
    <%@ page import="database.Track" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String user = (String)session.getAttribute("currentuser");
	out.print(user + "<br><br>");	
	List<Track> rs = HomepageAct.getMySongs(user);
	
	for(Track song : rs){
		out.print("<br><br>**** <br>");
		out.print(song.getUser() + "		" + song.getTrack()+"		" + song.getAlbum()+"		" + song.getArtist()+"		" + song.getStatus()+"		"+ song.getLink()+"		");
	}
%>
<br><br>
<a href = "addsong.jsp"><input type="button" value="Add a new Song" name="add"></a>

</body>
<!-- <script>
function addSong(){
	loaction.href = "addsong.jsp";  
}
</script> -->
</html>