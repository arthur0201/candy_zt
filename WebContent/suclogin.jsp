<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Hello <%=(String)request.getParameter("username") %> !</h2><br>
<h2> Welcome to Candy management!</h2>

homepage：<input  type="button" value="进入" style="margin-left: 30px" onclick="window.location.href='AllServlet?methodName=<%=4%>&id=<%=""%>&name=<%=""%>';" />
</body>
</html>