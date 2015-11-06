<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register yourself</title>
</head>
<body>
<form action="Register" method="post">
UserName:<input type="text" name="username"/><br/><br/>
Password:<input type="password" name="password"/><br/><br/>
Retype Password:<input type="password" name="repass"/>
<div class="passwd">Password empty</div>
<br/><br/>
Name<input type="text" name="name"/><br/><br/>
E-mail<input type="text" name="email"/><br/><br/>
<input type="submit" value="login"/>
</form>
</body>
</html>