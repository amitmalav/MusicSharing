<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<%-- <%if(session.getAttribute("currentUser") != null) { 
	response.sendRedirect("home.jsp");
}
%> --%>


</head>
<body>

<form action="Login" method="post">  
Name:<input type="text" name="username"/><br/><br/>  
Password:<input type="password" name="password"/><br/><br/>  
<input type="submit" value="login"/>  
</form>

<br><br>

<a href="register.jsp">Register Here!</a>
</body>
</html>