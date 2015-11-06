<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href = "home.jsp">Home</a>

<br><br>
<!-- 
<a href = "addsong.jsp">Add New Song</a> -->
<form action="addsong.jsp" method="post">  
Trackname:<input type="text" name="trackname"/><br/><br/>  
playtime:<input type="text" name="playtime"/><br/><br/>  
Link to the track:<input type="text" name="link"/><br/><br/> 
Submit for Approval:<input type="submit"></input>  
</form>
<br/><br/>
<a href = "addtoplaylist.jsp">Add Song to Playlist</a>

<a href = "myplaylist.jsp">My Playlists</a>  
<!-- will have add playlist in it -->
<%
String user = (String)session.getAttribute("currentUser");
out.print(user);
%>
<div></div>
</body>
</html>