<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.*"
            import= "java.sql.*"
    %>
    <%@ page import="database.LoginAct" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <a href = "home.jsp">Home</a>

<br><br> -->





<!-- 
<a href = "addsong.jsp">Add New Song</a> -->

<!-- 
<form action="addsong.jsp" method="post">  
Trackname:<input type="text" name="trackname"/><br/><br/>  
playtime:<input type="text" name="playtime"/><br/><br/>  
Link to the track:<input type="text" name="link"/><br/><br/> 
Submit for Approval:<input type="submit"></input>  
</form>
 -->
<%
String user = (String)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("index.jsp");
	
}
out.print("Welcome " + user);
%>
<br><br>

<a href = "home.jsp">Home</a>

<br><br>

<a href = "addsong.jsp">Add New Song</a>

<br/><br/>
<a href = "mysongs.jsp">My Songs</a>
<br/><br/>

<a href = "myplaylist.jsp">My Playlists</a>  
<!-- will have add playlist in it -->

<div></div>
</body>
</html>