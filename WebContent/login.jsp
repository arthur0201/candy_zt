<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function validate() {
		var username = document.forms[0].username.value;
		var password = document.forms[0].password.value;
	    if (username.length <= 0) {
			alert("用户名不能为空请重新输入!");
			return false;
		}
	    else if(password.length <= 0) {
			alert("密码不能为空请重新输入!");
			return false;
		}
		else {
			return true;
		}
	}
</script>
</head>
<body>
	<h1>Candy Management Login</h1>
	<form method="POST" action="login">
		User name: <input type="text" name="username" /><br> Password: <input
			type="password" name="password" /><br> <input type="submit"
			value="Login" onclick="return validate()"/> <input type="button" value="register" onclick="window.location.href='http://localhost:8080/candy/registration.jsp' "/>
	</form>
</body>
</html>