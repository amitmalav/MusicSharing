<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Songs</title>
</head>
<body>

<!-- <form action="AddSong" method="post">  
Trackname:<input type="text" name="trackname"/><br/><br/>  
playtime:<input type="text" name="playtime"/><br/><br/>  
Link to the track:<input type="text" name="link"/><br/><br/> 
Submit for Approval:<input type="submit"></input>  
</form> -->
<%
String user = (String)session.getAttribute("currentuser");
out.print(user);
%>
</body>
</html>