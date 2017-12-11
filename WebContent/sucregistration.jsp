<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> Successful registration!</h1>
<h2>

Your login user name:  <%=(String)request.getAttribute("USERNAME") %><br>
Your login password:  <%=(String)request.getAttribute("PASS") %><br>

	Please login:
<a href="http://localhost:8080/candy/login.jsp"><input type="button" value="Login"></input></a>

</h2>
</body>
</html>