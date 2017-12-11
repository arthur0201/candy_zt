<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="model.Candy"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>modify successfully</title>

<!-- <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page"> -->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<br>

	<h3>修改后的信息为：</h3>

	<hr>
	<br>
	<br>
	<table width="450" border="100" cellSpacing=1
		style="font-size: 15pt; border: dashed 1pt">
		<tr>
			<td>idCandy</td>
			<td>Candyname</td>
			<td>Candytaste</td>
			<td>price</td>
			<td colspan="2">Action</td>
		</tr>
		<%
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			ArrayList<Candy> result = new ArrayList<Candy>();
			result = (ArrayList<Candy>) request.getAttribute("result");
			if (!result.isEmpty()) {
				for (int i = 0; i < result.size(); i++) {
					Candy st = result.get(i);
					out.print("<tr>");
					out.print("<td>" + st.getId() + "</td>");
					out.print("<td>" + st.getCandyName() + "</td>");
					out.print("<td>" + st.getCandyTaste() + "</td>");
					out.print("<td>" + st.getPricae() + "</td>");
					out.print("</tr>");
				}
			}
		%>
	</table>
	<br>
	<br>
<!-- 	<h3>
		<a href=putin.jsp>返回信息输入页面</a>
	</h3> -->
	<h3>
		<a href=AllServlet?methodName=<%=4%>&id=<%=""%> &name=<%=""%>>返回信息查询页面</a>
	</h3>
</body>
</html>
