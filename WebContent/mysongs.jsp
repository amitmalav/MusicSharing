<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.util.*"
            import= java.sql.*
    %>
    <%@ page import="database.HomepageAct" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String user = request.getParameter("username");
	List<String> rs = HomepageAct.getMySongs(user);
	
	for(String song : rs){
		out.print("Songs Added <br/>");
		out.print(song+"<br/>");
	}
%>
<input type="button" value="Add a new Song" name="add" onclick="addSong()">

</body>
<script>
function addSong(){
	loaction.href = "addSong.jsp";  
}
</script>
</html>

//assumed existence of funtion, class, addsong.jsp