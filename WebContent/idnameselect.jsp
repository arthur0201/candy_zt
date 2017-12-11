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

<title>按id查询</title>

</head>

<body>
	<br>
	<h3>符合条件的糖果信息</h3>
	<hr>
	<br>

	<table width="510" border="100" cellSpacing=1
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
		%>
		<td><a href="AllServlet?id=<%=st.getId()%>&&methodName=<%=1%>">删除</a></td>

		<td><a href="AllServlet?id=<%=st.getId()%>&&methodName=<%=3%>">修改</a></td>

		<%
			out.print("</tr>");
				}
			}
		%>
	</table>
	<br>
	<br>
	<h4>
		<a href=AllServlet?methodName=<%=4%>&id=<%=""%> &name=<%=""%>>返回信息查询页面</a>
	</h4>
</body>
</html>
