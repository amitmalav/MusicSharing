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
<a href = "home.jsp">Home</a>

<br><br>

<%

  String username=request.getParameter("username");  
  String password=request.getParameter("password");  
        
  if(LoginAct.validate(username, password)){
  	//request.setAttribute("username", n);
  	//HttpSession userSession = request.getSession(true);
		//userSession.setAttribute("currentUser", username);
	out.print("blah blalh");
  	session.setAttribute("currentuser", username);
  	response.sendRedirect("home.jsp");
  }
  else{  
      //out.print("Sorry username or password error");  
      //RequestDispatcher rd=request.getRequestDispatcher(request.getContextPath() + "/login.jsp");  
      //rd.include(request,response);
  	//request.getSession(true).setAttribute("error", "Invalid");
  	out.print("blah blalh");
  	response.sendRedirect("login.jsp");
  }  
%>








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